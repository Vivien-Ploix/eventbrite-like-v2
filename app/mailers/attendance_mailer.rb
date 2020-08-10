class AttendanceMailer < ApplicationMailer
  default from: 'vivien78@live.fr'
 
  def attendance_email(attendance)
    @attendance = attendance 
    @admin = User.find(@attendance.event.admin_id)

    @url  = 'https://eventbrite-like-vivien.herokuapp.com/login' 

    mail(to: @admin.email, subject: "Un nouveau participant s'est inscrit à votre évènement !") 
  end
end
