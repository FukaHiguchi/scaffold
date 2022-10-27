class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :my_thread
end
