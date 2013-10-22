json.array!(@loan_lenders) do |loan_lender|
  json.extract! loan_lender, :name
  json.url loan_lender_url(loan_lender, format: :json)
end
