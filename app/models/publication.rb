class Publication < ApplicationRecord
  has_one_attached :file_upload

  validates :description, presence: true

  belongs_to :user

  has_many :comments
  has_many :likes
  has_many :notifications

  enum tag_type: {
    work_opportunity: 0,
    funny: 1,
    student_help: 3
  }

  enum status: {
    active: 0,
    inactive: 1
  }

  def file_url
    if file.present? && file.start_with?("http")
      file
    elsif file_upload.attached?
      Rails.application.routes.url_helpers.rails_blob_path(file_upload, only_path: true)
    end
  end

  def tag_name
    case tag_type
    when 'work_opportunity' then 'Oportunidad de trabajo'
    when 'funny' then 'Diversión'
    when 'student_help' then 'Ayuda estudiantil'
    else 'Desconocido'
    end
  end
end
