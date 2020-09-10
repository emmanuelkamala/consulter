class UsersController < ApplicationController
  #before_action :authenticate_user, except: [:create]
  before_action :authenticate_request!, except: %i[create login]
  before_action :set_user, only: %i[show update destroy]
  #before_action :admin?, only: %i[index destroy]

  def login
    user = User.find_by(email: user_params[:email].to_s.downcase)

    if user&.authenticate(user_params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id)
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: UserSerializer.new(@user).serializable_hash
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     render json: UserSerializer.new(@user).serializable_hash, status: :created
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  def create
    @user = User.new(user_params)
  
    if @user.save && @user.authenticate(user_params[:password])
      auth_token = JsonWebToken.encode(user_id: @user.id)
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serializable_hash
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
