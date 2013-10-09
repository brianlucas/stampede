class CreateLoanAttributeTypes < ActiveRecord::Migration
  def change
    create_table :loan_attribute_types do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end
end
