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
    card = Card.new card_params
    card.user = @current_user
    if card.save
      redirect_to @current_user
    else
      flash[:errors] = card.errors.full_messages
      @card = card
      render :new
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
      params.require(:card).permit(:sentiment, :incident, :feeling, :expectation, :importance, :user_id, :sprint_id, :shared, :resolved)
  end

end
