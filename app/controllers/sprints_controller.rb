class SprintsController < ApplicationController

  def new
    @sprint= Sprint.new
  end

  def destroy
    Sprint.destroy params[:id]
    redirect_to @current_user
  end

end
