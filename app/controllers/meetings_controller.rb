class MeetingsController < ApplicationController
  before_action :authenticate_user 
  before_action :set_meeting, only: [:show, :update, :destroy]

  # GET /meetings
  def index
    @meetings = current_user.meetings.all

    render json: MeetingSerializer.new(@meetings).serializable_hash
  end

  # GET /meetings/1
  def show
    # @meeting = current_user.meetings.find(params[:id])
    render json: MeetingSerializer.new(@meeting).serializable_hash
  end

  # POST /meetings
  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      render json: MeetingSerializer.new(@meeting).serializable_hash, status: :created, location: @meeting
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meetings/1
  def update
    if @meeting.update(meeting_params)
      render json: MeetingSerializer.new(@meeting).serializable_hash
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meetings/1
  def destroy
    @meeting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
        @meeting = current_user.meetings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :user_id)
    end

end
