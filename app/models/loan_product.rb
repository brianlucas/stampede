class LoanProduct < ActiveRecord::Base
  has_many :loan_product_attributes
  has_many :loan_attributes, through: :loan_product_attributes
end
