class CreateLoanAttributes < ActiveRecord::Migration
  def change
    create_table :loan_attributes do |t|
      t.string :name, index: true
      t.string :label
      t.string :tags, index: true
      t.string :unit

      t.timestamps
    end
  end
end
