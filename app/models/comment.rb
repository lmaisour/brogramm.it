class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  # validates :body, presence: true, length: {maximum: 2000}
end
