class CreateLoanLenders < ActiveRecord::Migration
  def change
    create_table :loan_lenders do |t|
      t.string :name

      t.timestamps
    end
  end
end
