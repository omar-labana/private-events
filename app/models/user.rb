class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: :creator_id, dependent: :delete_all
  has_many :attendances, dependent: :delete_all
  # not sure what it does
  has_many :attended_events, through: :attendances, source: :event

end
