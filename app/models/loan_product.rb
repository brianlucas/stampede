class LoanProduct < ActiveRecord::Base
  
  validates :code, :presence => true
  
  has_many :loan_product_attributes
  has_many :loan_attributes, through: :loan_product_attributes
end
