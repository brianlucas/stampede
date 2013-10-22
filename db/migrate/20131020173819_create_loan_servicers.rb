class CreateLoanServicers < ActiveRecord::Migration
  def change
    create_table :loan_servicers do |t|
      t.string :name

      t.timestamps
    end
  end
end
