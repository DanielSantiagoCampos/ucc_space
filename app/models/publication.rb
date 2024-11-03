class Publication < ApplicationRecord
  # Validaciones
  validates :description, presence: true

  # Relaciones
  belongs_to :user

  has_many :comments
  has_many :likes
  has_many :notifications

    # Enum para tag_type
  enum tag_type: {
    work_oportunity: 0,
    funny: 1,
    student_help: 3
  }
  
  # Enum para status
  enum status: {
    active: 0,
    inactive: 1
  }
end
