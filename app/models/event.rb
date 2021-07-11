class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, dependent: :delete_all
  has_many :attendees, through: :attendances, source: :user

  scope :upcoming, -> { where('date >= ?', Time.now).order(:date) }
  scope :past, -> { where('date < ?', Time.now).order(date: :desc) }
end
