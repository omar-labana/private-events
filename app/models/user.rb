class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: :creator_id, dependent: :delete_all
  has_many :attendances, dependent: :delete_all
  # not sure what it does
  has_many :attended_events, through: :attendances, source: :event
end
