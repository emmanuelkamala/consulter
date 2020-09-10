class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show update destroy]

  def index
    @meetings = Meeting.all
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
    @meeting = Meeting.find(params[:id]) if current_user.id === user.id
  end

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :consultant_id, :user_id)
  end
end