class Comment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :publication
  belongs_to :emisor_user, class_name: 'User'
end
