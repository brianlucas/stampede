class LoanProductAttribute < ActiveRecord::Base
  belongs_to :loan_product
  belongs_to :loan_attribute
end
