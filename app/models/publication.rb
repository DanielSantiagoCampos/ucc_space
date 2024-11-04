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
    work_opportunity: 0,
    funny: 1,
    student_help: 3
  }
  
  # Enum para status
  enum status: {
    active: 0,
    inactive: 1
  }

  def tag_name
    case tag_type
    when 'work_opportunity' then 'Oportunidad de trabajo'
    when 'funny' then 'Divertido'
    when 'student_help' then 'Ayuda estudiantil'
    else 'Desconocido'
    end
  end
end
