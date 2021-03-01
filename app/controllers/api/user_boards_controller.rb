class Api::UserBoardsController < ApplicationController
  
  def index
    @user = User.find_by(id: params[:id])
    render "index.json.jb"
  end

end
