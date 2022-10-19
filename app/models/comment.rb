class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :my_threads
end
