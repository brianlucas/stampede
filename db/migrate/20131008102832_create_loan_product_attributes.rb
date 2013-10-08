class CreateLoanProductAttributes < ActiveRecord::Migration
  def change
    create_table :loan_product_attributes do |t|
      t.references :loan_product, index: true
      t.references :loan_attribute, index: true
      t.integer :value

      t.timestamps
    end
    add_index :loan_product_attributes, [:loan_product_id, :loan_attribute_id], :unique => true, :name => "index_unique_loan_product_attributes"
  end
end
