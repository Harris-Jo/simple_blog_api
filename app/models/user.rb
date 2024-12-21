class User < ApplicationRecord
    has_secure_password
  
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
  
    validates :email, presence: true, uniqueness: true
  end
  