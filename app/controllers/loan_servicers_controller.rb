class LoanServicersController < ApplicationController
  before_action :set_loan_servicer, only: [:show, :edit, :update, :destroy]

  # GET /loan_servicers
  # GET /loan_servicers.json
  def index
    @loan_servicers = LoanServicer.all
  end

  # GET /loan_servicers/1
  # GET /loan_servicers/1.json
  def show
  end

  # GET /loan_servicers/new
  def new
    @loan_servicer = LoanServicer.new
  end

  # GET /loan_servicers/1/edit
  def edit
  end

  # POST /loan_servicers
  # POST /loan_servicers.json
  def create
    @loan_servicer = LoanServicer.new(loan_servicer_params)

    respond_to do |format|
      if @loan_servicer.save
        format.html { redirect_to @loan_servicer, notice: 'Loan servicer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @loan_servicer }
      else
        format.html { render action: 'new' }
        format.json { render json: @loan_servicer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_servicers/1
  # PATCH/PUT /loan_servicers/1.json
  def update
    respond_to do |format|
      if @loan_servicer.update(loan_servicer_params)
        format.html { redirect_to @loan_servicer, notice: 'Loan servicer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @loan_servicer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_servicers/1
  # DELETE /loan_servicers/1.json
  def destroy
    @loan_servicer.destroy
    respond_to do |format|
      format.html { redirect_to loan_servicers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_servicer
      @loan_servicer = LoanServicer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_servicer_params
      params.require(:loan_servicer).permit(:name)
    end
end
