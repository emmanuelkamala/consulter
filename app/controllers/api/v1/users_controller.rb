class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user,except: [:create]
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :require_admin, only: [:index, :destroy]

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
      render json: UserSerializer.new(@user).serializable_hash,
                   status: :created
          
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

    def require_admin
      render json: { error: "You're not alowed to perform this operation" } if current_user.admin == false
    end
end
