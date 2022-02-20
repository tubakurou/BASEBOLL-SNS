class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable,:rememberable,:validatable
  
  has_many :follower, class_name: "follower"
  has_many :followerd, class_name: "follower"
  has_many :game_comments, dependent: :destroy
  belongs_to :team
  has_many :favorites, dependent: :destroy
  attachment :user_image
end
