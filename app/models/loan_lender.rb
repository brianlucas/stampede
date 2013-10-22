class LoanLender < ActiveRecord::Base
  
  has_many :loan_products
  
end
