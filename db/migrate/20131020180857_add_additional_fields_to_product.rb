class AddAdditionalFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :loan_products, :enabled, :integer
    add_reference :loan_products, :loan_lender, index: true
    add_column :loan_products, :slug, :string
    add_column :loan_products, :name, :string
    add_reference :loan_products, :loan_servicer, index: true
    add_column :loan_products, :logo, :string
    add_column :loan_products, :cosigner_release_available, :integer
    add_column :loan_products, :cosigner_release_note, :text
    add_column :loan_products, :external_url, :string
    add_column :loan_products, :auto_debit_discount, :decimal, :precision => 5, :scale => 2
    add_column :loan_products, :auto_debit_discount_note, :text
    add_column :loan_products, :loyality_discount, :decimal, :precision => 5, :scale => 2
    add_column :loan_products, :loyality_discount_note, :text
    add_column :loan_products, :type_refinanced, :integer
    add_column :loan_products, :interest_rate_index, :decimal, :precision => 5, :scale => 2
    add_column :loan_products, :interest_rate_index_note, :text
    add_column :loan_products, :min_repayment_rate, :decimal, :precision => 5, :scale => 2
    add_column :loan_products, :min_repayment_rate_note, :text
    add_column :loan_products, :max_repayment_rate, :decimal, :precision => 5, :scale => 2
    add_column :loan_products, :max_repayment_rate_note, :text
    add_column :loan_products, :origination_fee, :decimal, :precision => 5, :scale => 2
    add_column :loan_products, :early_repayment_penalty, :text
    add_column :loan_products, :notes, :text
    add_column :loan_products, :top_header, :text
    add_column :loan_products, :extra_top_summary, :text
    add_column :loan_products, :summary, :text
    add_column :loan_products, :disclosure, :string
  end
end
