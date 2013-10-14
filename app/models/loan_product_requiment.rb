# Usage:
# There is 2 ways use models
# 1. when inicialize with Product Code, check only this product:
# 
#  r = LoanProductRequiment.new("SFL-1")
#  
#  # here is for console, let you preview params to set and passible values
#  r.show_params_and_passible_values 
#  
#  # now set params
#  r.citizenship = "citizen"
#  r.program_eligible = "certificate"
#  r.degree_eligible = "mba"
#  
#  # check if can get loan (return false or true)
#  r.result
#  => false
#  
#  2. when inicialize without Product Code, check all products in databases
#  
#  r = LoanProductRequiment.new
#  
#  # here is for console, let you preview params to set and passible values
#  r.show_params_and_passible_values 
#  
#  # now set params
#  r.citizenship = "citizen"
#  r.program_eligible = "certificate"
#  r.degree_eligible = "mba"
#  
#  # check if can get loan (return array of codes or false if cannot fit any)
#  r.result
#  => ["WEL-1"]
#  



class LoanProductRequiment
  include ActiveModel::Model
  extend ActiveModel::Callbacks
  
  attr_accessor :loan_product_code, :citizenship, :program_eligible, :degree_eligible, :credit_score, :loan_size, :residence_eligible, :age_requirement, :loan_term_and_type
  
  validates :citizenship, :presence => true
  validates :program_eligible, :presence => true
  validates :degree_eligible, :presence => true
  validates :credit_score, :presence => true

  def assign_attributes(values)
    values.each do |k, v|
      send("#{k}=", v)
    end
  end
    
  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat vars
    super(*vars)
  end

  def self.attributes
    @attributes
  end

  def attributes
    self.class.attributes
  end
  
  def initialize(*vars)    
    @loan_product = LoanProduct.find_by_code(vars.first) if vars.first
  end
  
  def result
    if validate_params 
      if @loan_product
        check_attributes_for_product(@loan_product)        
      else
        products = []
        LoanProduct.all.each {|p| products << p.code if check_attributes_for_product(p.code) }
        if products.count > 0
          products
        else
          false
        end
      end
    end
  end
  
  def check_attributes_for_product (product_code)
    # check if attributes have correct values (check in database if exist this attribute)
    loan_product = LoanProduct.find_by_code(product_code)
    # first check if all attributes exist (all attributes are set for this product)
    return false unless loan_product.loan_product_attributes.count == LoanAttribute.all.count
      
    return false unless loan_product
    
    return false unless LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name(citizenship).id).value == 1
    return false unless LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name(program_eligible).id).value == 1
    return false unless LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name(degree_eligible).id).value == 1
    # check if score is grether than limit
    return false unless LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("minimum-credit-score").id).value <= credit_score.to_i
    # check if degree_eligible is undergraduated and if graduated should be elmininated
    undergraduated = ["certificate","associates","bachelors"].include?(program_eligible)
    return false if (!undergraduated or LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name(degree_eligible).id).value == 0)
    # check if loan size in in range depend of borrower is graduated
    if undergraduated
      return false unless loan_size.to_i.between?(LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("minimum-undergraduate").id).value,LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("maximum-undergraduate").id).value )
    else
      return false unless loan_size.to_i.between?(LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("minimum-graduate").id).value,LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("maximum-graduate").id).value )
    end
    
    return false unless LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name(residence_eligible).id).value == 1
    
    if residence_eligible == "AL"
      return false if LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("age-alabama").id).value > age_requirement.to_i
    elsif residence_eligible == "PR"
      return false if LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("age-puerto-rico").id).value > age_requirement.to_i
    elsif residence_eligible == "NE"
      return false if LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("age-nebraska").id).value > age_requirement.to_i
    elsif residence_eligible == "MS"
      return false if LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("age-mississippi").id).value > age_requirement.to_i
    else
      return false if LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("age-other").id).value > age_requirement.to_i
    end
    
    # uncomment below when check type need to be checked 
    #if loan_term_and_type == "fixed-5-years"
    #  return false unless (LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("loan-term").id).value == 5 and LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("loan-term").id).value == 1)
    #elsif loan_term_and_type == "fixed-10-years"
    #  return false unless (LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("loan-term").id).value == 10 and LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("loan-term").id).value == 1)
    #elsif loan_term_and_type == "fixed-15-years"
    #  return false unless (LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("loan-term").id).value == 15 and LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("loan-term").id).value == 1)
    #elsif loan_term_and_type == "variable"
    #  return false unless (LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name("loan-term").id).value == 2)
    #end
    
    true
  end 

  def validate_params
    # in this table we have errors for required fileds, can be used later 
    errors = []
    errors << "citizenship is not set correctly" unless LoanAttributeType.find_by_name("citizenship").loan_attributes.map{|at| at.name}.include?(citizenship)
    errors << "program_eligible is not set correctly" unless LoanAttributeType.find_by_name("program-eligible").loan_attributes.map{|at| at.name}.include?(program_eligible)
    errors << "degree_eligible is not set correctly" unless (LoanAttributeType.find_by_name("degree-eligible-graduate").loan_attributes.map{|at| at.name}.include?(degree_eligible) or LoanAttributeType.find_by_name("degree-eligible-undergraduate").loan_attributes.map{|at| at.name}.include?(degree_eligible))
    errors << "credit_score is not set correctly" unless is_num?(credit_score)
    errors << "loan_size is not set correctly" unless is_num?(loan_size)
    errors << "residence_eligible is not set correctly" unless LoanAttributeType.find_by_name("residence-eligible").loan_attributes.map{|at| at.name}.include?(residence_eligible)
    errors << "age_requirement is not set correctly" unless is_num?(loan_size)
    #errors << "loan_term_and_type is not set correctly" unless ["fixed-5-years","fixed-10-years","fixed-15-years","variable"].include?(loan_term_and_type)
    puts errors.join(", ")
    return (errors.count > 0) ? false : true
  end

  def show_params_and_passible_values
    params = "citizenship: " + LoanAttributeType.find_by_name("citizenship").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "program_eligible: " + LoanAttributeType.find_by_name("program-eligible").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "degree_eligible: " + LoanAttributeType.find_by_name("degree-eligible-graduate").loan_attributes.map{|at| at.name}.join(", ") + ", " + LoanAttributeType.find_by_name("degree-eligible-undergraduate").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "credit_score: (Integer value)\n " \
    + "loan_size: (Integer value)\n " \
    + "residence_eligible: " + LoanAttributeType.find_by_name("residence-eligible").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "age_requirement: (Integer value)\n " \
    #+ "loan_term_and_type: fixed-5-years, fixed-10-years, fixed-15-years, variable \n" 
    puts params
  end
  
  def self.show_params_and_passible_values
    params = "citizenship: " + LoanAttributeType.find_by_name("citizenship").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "program_eligible: " + LoanAttributeType.find_by_name("program-eligible").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "degree_eligible: " + LoanAttributeType.find_by_name("degree-eligible-graduate").loan_attributes.map{|at| at.name}.join(", ") + ", " + LoanAttributeType.find_by_name("degree-eligible-undergraduate").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "credit_score: (Integer value)\n " \
    + "loan_size: (Integer value)\n " \
    + "residence_eligible: " + LoanAttributeType.find_by_name("residence-eligible").loan_attributes.map{|at| at.name}.join(", ") + "\n"
    + "age_requirement: (Integer value)\n " \
    #+ "loan_term_and_type: fixed-5-years, fixed-10-years, fixed-15-years, variable \n" 
    puts params
  end
  
  def self.get_attributes
    @loan_attributes_types = LoanAttributeType.all
    @full_attributes = []
    @loan_attributes_types.each do |at|
       if at.name == "degree-eligible-graduate"
         @full_attributes << {
           :name => "degree-eligible", 
           :label => "Degree Eligible",
           :filed_type => 1,
           :attributes => at.loan_attributes.map{|a| {:id => a.id, :name => a.name, :label => a.label}} + LoanAttributeType.find_by_name("degree-eligible-undergraduate").loan_attributes.map{|a| {:id => a.id, :name => a.name, :label => a.label}}
         }
       elsif at.name == "degree-eligible-undergraduate"
         #do not enything, because its in above case
       else
         @full_attributes << {
           :name => at.name, 
           :label => at.label,
           :field_type => at.field_type ,
           :attributes => at.loan_attributes.map{|a| {:id => a.id, :name => a.name, :label => a.label}}
         }         
       end
    end
    @full_attributes
  end
  
  private
  
  def is_num?(str)
    begin
      !!Integer(str)
    rescue ArgumentError, TypeError
      false
    end
  end
  
end