class WorkspacesController < ApplicationController

  def new
    @workspace = Workspace.new
  end

  def destroy
    Workspace.destroy params[:id]
    redirect_to @current_user
  end

end
