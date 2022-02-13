class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :follower, class_name: "follower"
  has_many :followerd, class_name: "follower"
  belongs_to :team
  
  attachment :user_image
  
end
