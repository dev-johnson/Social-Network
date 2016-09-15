class Like < ActiveRecord::Base
  # belongs_to :comments
  belongs_to :user_post
  belongs_to :user
end
