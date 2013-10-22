json.array!(@loan_servicers) do |loan_servicer|
  json.extract! loan_servicer, :name
  json.url loan_servicer_url(loan_servicer, format: :json)
end
