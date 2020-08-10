class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :participant, foreign_key: 'participant_id', class_name: "User"

  after_create :attendance_send
  
  def attendance_send
    AttendanceMailer.attendance_email(self).deliver_now
  end
end
