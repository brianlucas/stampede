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

  def assign_attributes(values)
    sanitize_for_mass_assignment(values).each do |k, v|
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
  
  attr_accessor :loan_product_code, :citizenship, :program_eligible, :degree_eligible
  
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
    return false unless loan_product
    
    return false unless LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name(citizenship).id).value == 1
    return false unless LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name(program_eligible).id).value == 1
    return false unless LoanProductAttribute.find_by_loan_product_id_and_loan_attribute_id(loan_product.id, LoanAttribute.find_by_name(degree_eligible).id).value == 1
    true
  end 

  def validate_params
    # in this table we have errors for required fileds, can be used later 
    errors = []
    errors << "citizenship is not set correctly" unless LoanAttributeType.find_by_name("citizenship").loan_attributes.map{|at| at.name}.include?(citizenship)
    errors << "program_eligible is not set correctly" unless LoanAttributeType.find_by_name("program-eligible").loan_attributes.map{|at| at.name}.include?(program_eligible)
    errors << "degree_eligible is not set correctly" unless (LoanAttributeType.find_by_name("degree-eligible-graduate").loan_attributes.map{|at| at.name}.include?(degree_eligible) or LoanAttributeType.find_by_name("degree-eligible-undergraduate").loan_attributes.map{|at| at.name}.include?(degree_eligible))
    puts errors.join(", ")
    return (errors.count > 0) ? false : true
  end

  def show_params_and_passible_values
    params = "citizenship: " + LoanAttributeType.find_by_name("citizenship").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "program_eligible: " + LoanAttributeType.find_by_name("program-eligible").loan_attributes.map{|at| at.name}.join(", ") + "\n" \
    + "degree_eligible: " + LoanAttributeType.find_by_name("degree-eligible-graduate").loan_attributes.map{|at| at.name}.join(", ") + ", " + LoanAttributeType.find_by_name("degree-eligible-undergraduate").loan_attributes.map{|at| at.name}.join(", ") + "\n"
    puts params
  end
  
end