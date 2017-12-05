class CardsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def cardData
    @card = Card.find_by(user_id: params[:UID])
    if  @card != nil
      render json: { info: "card exist", cardCompany: @card.card_company, cardNumber: @card.card_number } 
    else
      render json: { info: "card not exist" }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:card_company, :card_number, :user_id)
    end
end
