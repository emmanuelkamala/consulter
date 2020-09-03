class UsersController < ApplicationController
  # before_action :authenticate_request!
  before_action :authenticate_user,except: [:create]
  before_action :set_user, only: [:show, :update, :destroy]
  # before_action :admin, only: [:index, :destroy]

  # GET /users
  def index
    if current_user.admin?
      @users = User.all 

      render json: @users, :include => [:username, :email]
    end
  end

  # GET /users/1
  def show
    render json: UserSerializer.new(@user).serializable_hash
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serializable_hash, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serializable_hash
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if current_user.admin?
      @user.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    # def admin 
    #   if current_user.admin? && !current_user?(user) end
    # end
end
