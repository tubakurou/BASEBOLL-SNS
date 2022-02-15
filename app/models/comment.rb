class Comment < ApplicationRecor
   belongs_to :user
  has_many :gamecomments, dependent: :destroy 
end
