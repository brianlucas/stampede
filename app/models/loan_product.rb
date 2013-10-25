# Usage:
# 
#  p = LoanProduct.find_by_slug("SFL-1")
#  
#  # set loan size in dolars
#  p.loan_size = 10000
#  
#  # get any calculation
#  
#  p.get_monthly_payment_min
#  p.get_total_cost_min
#  

class LoanProduct < ActiveRecord::Base
  
  validates :slug, :presence => true
  
  has_many :loan_product_attributes
  has_many :loan_attributes, through: :loan_product_attributes
  
  belongs_to :loan_lender
  belongs_to :loan_servicer
  
  attr_accessor :loan_size

  PRIVATE = 1
  FEDERAL = 2
  PRIVATE_AND_FEDERAL = 3
  
  def get_apr_min
    return false if min_repayment_rate.nil? or auto_debit_discount.nil? or loyality_discount.nil?
    min_repayment_rate - (auto_debit_discount  + loyality_discount)
  end
  
  def get_apr_max    
    return false if max_repayment_rate.nil? or auto_debit_discount.nil? or loyality_discount.nil?
    max_repayment_rate - (auto_debit_discount  + loyality_discount)
  end
    
  def get_monthly_payment_min
    return false if loan_size.nil? or get_loan_term.nil? or !get_apr_min or get_loan_term.nil?
    ((loan_size * (get_apr_min/1200) * (1 + (get_apr_min/1200) ) ** (12*get_loan_term)) / (( 1 + (get_apr_min/1200) ) ** (12*get_loan_term)-1)).to_f.round(2)
  end
  
  def get_monthly_payment_max
    return false if loan_size.nil? or get_loan_term.nil? or !get_apr_min or get_loan_term.nil?
    ((loan_size * (max_repayment_rate/1200) * (1 + (max_repayment_rate/1200) ) ** (12*get_loan_term)) / (( 1 + (max_repayment_rate/1200) ) ** (12*get_loan_term)-1)).to_f.round(2)
  end
  
  def get_total_cost_min
    return false if loan_size.nil? or get_loan_term.nil? or !get_monthly_payment_min
    (get_monthly_payment_min*12*get_loan_term).round(2)
  end
  
  def get_total_cost_max
    return false if loan_size.nil? or get_loan_term.nil? or !get_monthly_payment_max
    (get_monthly_payment_max*12*get_loan_term).round(2)
  end
  
  def get_loan_term
    return nil unless loan_term_attr = LoanAttribute.find_by_name("loan-term")
    return nil unless loan_term = loan_product_attributes.find_by_loan_attribute_id(loan_term_attr)
    loan_term.value
  end
  
  def get_loan_type
    return nil unless loan_type_attr = LoanAttribute.find_by_name("loan-type")
    return nil unless loan_type = loan_product_attributes.find_by_loan_attribute_id(loan_type_attr)
    loan_type.value
  end
  
end
