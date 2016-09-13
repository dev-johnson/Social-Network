class Comment < ActiveRecord::Base
  belongs_to :post, :user
end
