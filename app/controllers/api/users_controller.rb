class Api::UsersController < ApplicationController
  # before_action :authenticate_admin
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: @user).welcome_email.deliver

        
        render json: { message: "User created successfully" }, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end

    # if @user.save
    #   render json: { message: "User created successfully" }, status: :created
    # else
    #   render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    # end
  end


  def show
    if current_user
      id = params["id"]
      @user = User.find_by(id: id)
      
      if @user
        render "show.json.jb"
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {message: "Login to see this user"}
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.id == current_user.id
      @user.name = params[:name] || @user.name
      @user.email = params[:email] || @user.email
      if params[:password]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
      end
      @user.image_url = params[:image_url] || @user.image_url
      if @user.save
        render "show.json.jb"
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {message: "Not your profile!"}
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user == current_user
      user.destroy
      render json: { message: "Profile Deleted!" }
    else
      render json: {message: "Not your profile!"}
    end
  end
end
