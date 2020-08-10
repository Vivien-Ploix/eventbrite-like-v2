class User < ApplicationRecord
  has_many :events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendances





  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }







  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
