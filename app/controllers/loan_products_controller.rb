class LoanProductsController < ApplicationController
  before_action :set_loan_product, only: [:show, :edit, :update, :destroy]
  before_action :get_loan_attributes

  # GET /loan_products
  # GET /loan_products.json
  def index
    @loan_products = LoanProduct.all
  end

  # GET /loan_products/1
  # GET /loan_products/1.json
  def show
    @loan_product.loan_size = params[:loan_size].to_i
  end

  # GET /loan_products/new
  def new
    @loan_product = LoanProduct.new
    @loan_product.loan_product_attributes.new(LoanAttribute.all.map{|a| {:loan_attribute => a, :value => 0} })
  end

  # GET /loan_products/1/edit
  def edit
    @loan_product_attributes = @loan_product.loan_product_attributes
  end

  # POST /loan_products
  # POST /loan_products.json
  def create
    @loan_product = LoanProduct.new(loan_product_params)

    respond_to do |format|
      if @loan_product.save
        # save attributes for product
        loan_product_attributes_multibox_selected =  params[:loan_product_attributes_multibox] ? params[:loan_product_attributes_multibox].values.flatten : []  
        loan_product_attributes = {}
        
        LoanAttribute.all.map{|a| a.id}.each do |attr_id|
          if loan_product_attributes_multibox_selected.include?(attr_id.to_s)
            loan_product_attributes[attr_id.to_s] = 1
          elsif params[:loan_product_attributes].has_key?(attr_id.to_s)
            loan_product_attributes[attr_id.to_s] = params[:loan_product_attributes][attr_id.to_s]
          else
            loan_product_attributes[attr_id.to_s] = 0
          end
        end
        
        loan_product_attributes.each{|attribute_id, value| LoanProductAttribute.find_or_create_by_loan_product_id_and_loan_attribute_id(@loan_product.id,attribute_id).update_attribute("value",value)}               

        format.html { redirect_to @loan_product, notice: 'Loan product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @loan_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @loan_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_products/1
  # PATCH/PUT /loan_products/1.json
  def update
    respond_to do |format|
      if @loan_product.update(loan_product_params)
        
        # save attributes for product
        loan_product_attributes_multibox_selected =  params[:loan_product_attributes_multibox].values.flatten   
        loan_product_attributes = {}
        
        LoanAttribute.all.map{|a| a.id}.each do |attr_id|
          if loan_product_attributes_multibox_selected.include?(attr_id.to_s)
            loan_product_attributes[attr_id.to_s] = 1
          elsif params[:loan_product_attributes].has_key?(attr_id.to_s)
            loan_product_attributes[attr_id.to_s] = params[:loan_product_attributes][attr_id.to_s]
          else
            loan_product_attributes[attr_id.to_s] = 0
          end
        end
        
        loan_product_attributes.each{|attribute_id, value| LoanProductAttribute.find_or_create_by_loan_product_id_and_loan_attribute_id(@loan_product.id,attribute_id).update_attribute("value",value)}
                
        format.html { redirect_to @loan_product, notice: 'Loan product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @loan_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_products/1
  # DELETE /loan_products/1.json
  def destroy
    @loan_product.destroy
    respond_to do |format|
      format.html { redirect_to loan_products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_product
      @loan_product = LoanProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_product_params
      params.require(:loan_product).permit(:slug)
    end
    
    def get_loan_attributes
      @loan_attributes = LoanAttribute.all
      @loan_attribute_types = LoanAttributeType.all
    end
    
    def loan_product_params
      params.require(:loan_product).permit(:code, :name, :enabled, :slug, :loan_lender_id, :loan_servicer_id, :logo, :cosigner_release_available , :cosigner_release_note, :external_url, :auto_debit_discount, :auto_debit_discount_note, :loyality_discount, :loyality_discount_note, :type_refinanced, :interest_rate_index, :interest_rate_index_note, :min_repayment_rate, :min_repayment_rate_note, :max_repayment_rate, :max_repayment_rate_note, :origination_fee, :early_repayment_penalty, :notes, :top_header, :extra_top_summary, :summary, :disclosure, :loan_size)
    end
end
