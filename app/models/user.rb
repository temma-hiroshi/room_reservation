class User < ApplicationRecord
  has_many :rooms
  has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name,         presence: true, on: :update
  validates :introduction, presence: true, on: :update
  validates :image,        presence: true, on: :update
  
  mount_uploader :image, ImageUploader
end
