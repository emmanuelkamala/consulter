class ConsultantsController < ApplicationController
  #before_action :authenticate_v1_user
  before_action :set_consultant, only: %i[show update destroy]
  before_action :admin?, except: %i[show update]
  
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
end
