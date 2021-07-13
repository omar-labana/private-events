class Event < ApplicationRecord
  validates :title, presence: true, length: { in: 4..50 }
  validates :location, presence: true, length: { maximum: 30 }
  validates :date, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :attendances, dependent: :delete_all
  has_many :attendees, through: :attendances, source: :user

  scope :upcoming, -> { where('date >= ?', Time.now).order(:date) }
  scope :past, -> { where('date < ?', Time.now).order(date: :desc) }
end
