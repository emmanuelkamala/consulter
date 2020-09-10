class UsersController < ApplicationController
  before_action :authenticate_request!, except: %i[create login]
  before_action :is_confirmed?, only: [:login]
  before_action :set_user, only: %i[show update destroy]
  before_action :require_admin, only: %i[index destroy]

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

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serializable_hash, status: :created
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
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def is_confirmed?
    user = User.find_by(email: user_params[:email].to_s.downcase)

    unless user.confirm
      render json: { error: "You are not confirmed. An Admin needs to confirm you. Sorry, Access denied" }
    end  
  end

  def require_admin
    user = User.find_by(email: user_params[:email].to_s.downcase)

    unless user.admin
      render json: { error: "You are not allowed to perform that action" }
    end
  end
end
