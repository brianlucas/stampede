class LoanAttribute < ActiveRecord::Base
  has_many :loan_product_attributes
  has_many :loan_products, through: :loan_product_attributes
  belongs_to :loan_attribute_type
  
end
