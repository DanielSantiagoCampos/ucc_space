class Publication < ApplicationRecord
  has_one_attached :file_upload  # Asociación de Active Storage

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

  # Método para determinar si `file` es una URL externa
  def file_url
    if file.present? && file.start_with?("http")
      file  # Es una URL
    elsif file_upload.attached?
      Rails.application.routes.url_helpers.rails_blob_path(file_upload, only_path: true)  # Es un archivo cargado
    end
  end

  def tag_name
    case tag_type
    when 'work_opportunity' then 'Oportunidad de trabajo'
    when 'funny' then 'Divertido'
    when 'student_help' then 'Ayuda estudiantil'
    else 'Desconocido'
    end
  end
end
