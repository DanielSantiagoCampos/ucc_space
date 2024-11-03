class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 # Validaciones
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  # Relaciones
  has_many :publications
  has_many :comments, foreign_key: :emisor_user_id
  has_many :notifications_as_emisor, class_name: 'Notification', foreign_key: :emisor_user_id
  has_many :notifications_as_receptor, class_name: 'Notification', foreign_key: :receptor_user_id
end
