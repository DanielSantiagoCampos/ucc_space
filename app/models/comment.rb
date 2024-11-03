class Comment < ApplicationRecord
  # Validaciones
  validates :comment, presence: true

  # Relaciones
  belongs_to :publication
  belongs_to :emisor_user, class_name: 'User'
end

