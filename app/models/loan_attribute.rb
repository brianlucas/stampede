class LoanAttribute < ActiveRecord::Base
  has_many :loan_product_attributes
  has_many :loan_products, through: :loan_product_attributes
  
  def self.get_by_tag(tag)
    where("tags like ?", "%#{tag}%")
  end
  
end
