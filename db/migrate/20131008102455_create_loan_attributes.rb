class CreateLoanAttributes < ActiveRecord::Migration
  def change
    create_table :loan_attributes do |t|
      t.string :name, index: true
      t.string :label
      t.string :unit
      t.references :loan_attribute_type

      t.timestamps
    end
  end
end
