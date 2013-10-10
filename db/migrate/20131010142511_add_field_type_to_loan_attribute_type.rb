class AddFieldTypeToLoanAttributeType < ActiveRecord::Migration
  def change
    add_column :loan_attribute_types, :field_type, :integer
  end
end
