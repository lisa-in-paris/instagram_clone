class User < ApplicationRecord
  has_many :picture
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: { maximum:30 }
  validates :email, presence: true, length: { maximum:255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  validates :password, length: {minimum: 6 }
  
  has_secure_password
  mount_uploader :image, ImageUploader
end
