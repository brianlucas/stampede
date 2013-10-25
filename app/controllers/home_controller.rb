class HomeController < ApplicationController
  before_action :get_loan_attributes, only: [:find]
  
  def index
  end
  
  def find
    @loan_products = LoanProduct.all
  end
  
  def result
    if params[:loan_attribs]
      req = LoanProductRequiment.new(params[:loan_product][:slug])
      req.assign_attributes(params[:loan_attribs])
      @product = params[:loan_product][:slug]
      @result = req.result
    end
  end
  
    private
    
    def get_loan_attributes
      @loan_attributes = LoanProductRequiment.get_attributes
    end
end
