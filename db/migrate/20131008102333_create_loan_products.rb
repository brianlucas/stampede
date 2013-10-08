class CreateLoanProducts < ActiveRecord::Migration
  def change
    create_table :loan_products do |t|
      t.string :code

      t.timestamps
    end
  end
end
