class Api::BoardPostsController < ApplicationController
  before_action :authenticate_user
  def create
    @board_post = BoardPost.new(
      post_id: params[:post_id],
      board_id: params[:board_id]
    )
    if current_user.id == @board_post.board.user_id
      if @board_post.save
        render json: {message: "Post added to board!"}
      else
        render json: {errors: @board_post.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Sorry, that's not your board"}
    end
  end

  def destroy
    @board_post = BoardPost.find_by(id: params[:id])
    @board_post.destroy
    render json: {message: "Post removed from board"}
  end
end
