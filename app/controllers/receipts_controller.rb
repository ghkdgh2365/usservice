class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  
  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = Receipt.all
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
    authorize_action_for @receipt
  end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = Receipt.new(receipt_params)
    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: 'Receipt was successfully created.' }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    authorize_action_for @receipt
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    authorize_action_for @receipt
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def show_receipts
    @user_id = params[:user_id]
    @receipts = Receipt.where(user_id: @user_id)
    
    @date_method = (params[:search].present? ? params[:search][:date_method] : 'pay_date').to_sym
    @start = selected_date(:start_date)
    @end = selected_date(:end_date)

    @search_receipts = params[:search].present? ? Receipt.where(@date_method => @start..@end, user_id: @user_id) : Receipt.none
    @this_user_id = params[:user_id]
  end
  
  def create_comment
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    
    @comment.save
    
    redirect_to :back
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:category, :pay_date, :amount, :content, :detail_content, :extra, :bill, :user_id, :card_id, :cash)
    end
    
    def selected_date(symbol)
        params[:search].present? && params[:search][symbol].present? ? params[:search][symbol].to_date : Time.now.to_date
    end
end
