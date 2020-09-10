class ConsultantsController < ApplicationController
  before_action :authenticate_request!, except: %i[create login]
  before_action :is_confirmed?, only: [:login]
  before_action :set_consultant, only: %i[show update destroy]
  
  def login
    consultant = Consultant.find_by(email: consultant_params[:email].to_s.downcase)

    if consultant&.authenticate(consultant_params[:password])
      auth_token = JsonWebToken.encode(consultant_id: consultant.id)
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
  end

  # GET /consultants
  def index
    @consultants = Consultant.all
    render json: ConsultantSerializer.new(@consultants).serializable_hash
  end

  # GET /consultants/1
  def show
    render json: ConsultantSerializer.new(@consultant).serializable_hash
  end

  # POST /consultants
  def create
    @consultant = Consultant.new(consultant_params)

    if @consultant.save
      render json: ConsultantSerializer.new(@consultant).serializable_hash, status: :created
    else
      render json: @consultant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consultants/1
  def update
    if @consultant.update(consultant_params)
      render json: ConsultantSerializer.new(@consultant).serializable_hash
    else
      render json: @consultant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consultants/1
  def destroy
    @consultant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_consultant
    @consultant = Consultant.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def consultant_params
    params.require(:consultant).permit(:first_name, :last_name, :email, :password, :password_confirmation, :profession)
  end

  def is_confirmed?
    consultant = Consultant.find_by(email: consultant_params[:email].to_s.downcase)
    
    unless consultant.confirm
      render json: { error: "You are not confirmed. An Admin needs to confirm you. Sorry, Access denied" }
    end  
  end
end
