class LoanLendersController < ApplicationController
  before_action :set_loan_lender, only: [:show, :edit, :update, :destroy]

  # GET /loan_lenders
  # GET /loan_lenders.json
  def index
    @loan_lenders = LoanLender.all
  end

  # GET /loan_lenders/1
  # GET /loan_lenders/1.json
  def show
  end

  # GET /loan_lenders/new
  def new
    @loan_lender = LoanLender.new
  end

  # GET /loan_lenders/1/edit
  def edit
  end

  # POST /loan_lenders
  # POST /loan_lenders.json
  def create
    @loan_lender = LoanLender.new(loan_lender_params)

    respond_to do |format|
      if @loan_lender.save
        format.html { redirect_to @loan_lender, notice: 'Loan lender was successfully created.' }
        format.json { render action: 'show', status: :created, location: @loan_lender }
      else
        format.html { render action: 'new' }
        format.json { render json: @loan_lender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_lenders/1
  # PATCH/PUT /loan_lenders/1.json
  def update
    respond_to do |format|
      if @loan_lender.update(loan_lender_params)
        format.html { redirect_to @loan_lender, notice: 'Loan lender was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @loan_lender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_lenders/1
  # DELETE /loan_lenders/1.json
  def destroy
    @loan_lender.destroy
    respond_to do |format|
      format.html { redirect_to loan_lenders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_lender
      @loan_lender = LoanLender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_lender_params
      params.require(:loan_lender).permit(:name)
    end
end
