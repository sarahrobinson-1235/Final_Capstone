class Api::BoardsController < ApplicationController
  before_action :authenticate_user

  def index
    @boards = Board.all
    render "index.json.jb"
  end

  def create
    @board = Board.new(
      user_id: current_user.id,
      title: params[:title],
      description: params[:description]
    )
    if @board.save
      render "show.json.jb"
    else
      render json: {errors: @board.errors.full_messages }, status: :unprocessable_entity 
    end
    
  end

  def current_user_index
    @boards = current_user.boards
    render "current_user_index.json.jb"
  end

  def show
    @board = Board.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @board = Board.find_by(id: params[:id])
    if @board.user_id == current_user.id
      @board.title = params[:title] || @board.title
      @board.description = params[:description] || @board.description
      if @board.save
        render "show.json.jb"
      else
        render json: {errors: @board.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Not your board!"}
    end
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    if @board.user_id == current_user.id
      @board.destroy
      render json: {message: "Board deleted!"}
    else
      render json: {message: "Not your board!"}
    end
  end 
end
