class Comment < ActiveRecord::Base
  belongs_to :user_page
  belongs_to :user
end
