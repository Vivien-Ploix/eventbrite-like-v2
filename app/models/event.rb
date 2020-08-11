class Event < ApplicationRecord
  belongs_to :admin, foreign_key:'admin_id', class_name: 'User'
  has_many :attendances
  has_many :participants, through: :attendances, class_name: 'User' 


  validates :start_date, presence: true
  validate :start_date_not_past

  validates :duration, presence: true
  validate :positive_multiple_5

  validates :title, presence: true, length: { in: 3..140 } 

  validates :description, presence: true, length: { in: 5..1000 } 

  validates :price, presence: true, inclusion: { in: 1..1000 } 

  validates :location, presence: true



  private 

  def start_date_not_past
    if start_date < DateTime.now
      errors.add(:start_date, "can't be in the past")
    end 
  end 


  def positive_multiple_5
    if duration <= 0 && duation % 5 != 0
      errors.add(:duration, "can't negative or 0, and has to be a multiple of 5")
    end 
  end 
end
