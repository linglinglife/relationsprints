class WorkspacesController < ApplicationController

  # def new
  #   @workspace = Workspace.new
  # end

  def index

  end

  # components:
  # WorkspaceIndex
  # WorkspaceNewForm ??? Modal?
  # WorkspaceShare? Modal

  def create
    # create a workspace, and then add the creating user to the workspace's list of users
    w = Workspace.create name: params[:name]
    w.users << @current_user

  end

  def share_with_user
    workspace = Workspace.find params[:workspace_id]
    return unless workspace.users.include? @current_user  # can't share a workspace you're not in

    share_user = User.find_by email: params[:email]
    workspace.users << share_user
    render json: {message: "Shared with user successfully."}, status: :ok
  end

  def destroy
    Workspace.destroy params[:id]
    redirect_to @current_user
  end

end
