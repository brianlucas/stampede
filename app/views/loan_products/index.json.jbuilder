json.array!(@loan_products) do |loan_product|
  json.extract! loan_product, :code
  json.url loan_product_url(loan_product, format: :json)
end
