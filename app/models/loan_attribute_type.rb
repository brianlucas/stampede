class LoanAttributeType < ActiveRecord::Base
  
  validates :name, :presence => true
  
  has_many :loan_attributes
  
  # field types
  LOGIC = 1 # expeted 1 or 0, 1 - allowed, 0 - not allowed
  NUMBER = 2 # expected integer value for numerical attributes
  LOAN_TYPE = 3 # expected 1 or 2, 1 - fixed, 2 - variable 
  
  
end
