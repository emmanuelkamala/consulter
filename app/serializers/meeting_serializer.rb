class MeetingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_time, :end_time
end
