class Api::V1::MeetingsController < ApplicationController
  before_action :authenticate_user
  before_action :set_meeting, only: %i[show update destroy]

  def index
    @meetings = current_user.meetings.all
    render json: MeetingSerializer.new(@meetings).serializable_hash
  end

  def show
    render json: MeetingSerializer.new(@meeting).serializable_hash
  end

  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      render json: MeetingSerializer.new(@meeting).serializable_hash, status: :created
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  def update
    if @meeting.update(meeting_params)
      render json: MeetingSerializer.new(@meeting).serializable_hash
    else
      render json: @meeting.errors, status: :unprocessable_entity  
    end
  end

  def destroy
    @meeting.destroy
  end

  private

  def set_meeting
    @meeting = current_user.meetings.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :user_id)
  end
end
