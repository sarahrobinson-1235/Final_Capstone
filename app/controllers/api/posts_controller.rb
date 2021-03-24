class Api::PostsController < ApplicationController

  before_action :authenticate_user, except: :index
  def index
    @posts = Post.all
    render "index.json.jb"
  end

  def create
    @post = Post.new(
      user_id: current_user.id,
      name: params[:name],
      body: params[:body],
      image_url: params[:image_url]
    )
    if @post.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id
      @post.name = params[:name] || @post.name
      @post.body = params[:body] || @post.body
      @post.image_url = params[:image_url] || @post.image_url
      if @post.save
        render "show.json.jb"
      else
        render json: { errors: @post.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Not your post!"}
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id
      @post.destroy
      render json: {message: "Post deleted!"}
    else
      render json: {message: "Not your post!"}
    end
  end
end
