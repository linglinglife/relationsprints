class CardsController < ApplicationController

  before_action :check_if_logged_in, except: [:show]

  def get_user_cards
    cards = Card.where(user: @current_user).group_by &:sentiment
    render json: cards
  end

  def index
    @card = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    # binding.pry
    # render json: params
    card = Card.new card_params
    card.user = @current_user
    if card.save
      render json: card, status: :ok
    else
      render json: {error: card.errors}, status: :unprocessable_entity
    end

  end

  def edit
    @card = Card.find params[:id]
  end

  def update
    card = Card.find params[:id]
    card.update card_params
    redirect_to @current_user
  end

  def show
    @card = Card.find params[:id]
  end


  def destroy
    Card.destroy params[:id]
    redirect_to @current_user
  end

  private
  def card_params
      params.require(:card).permit(:sentiment, :incident, :feeling, :expectation, :importance)
  end

end
