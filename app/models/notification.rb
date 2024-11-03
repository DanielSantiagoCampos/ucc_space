class Notification < ApplicationRecord
  # Relaciones
  belongs_to :emisor_user, class_name: 'User'
  belongs_to :receptor_user, class_name: 'User'
  belongs_to :publication

    # Enum para type
    enum notification_type: {
      like: 0,
      comment: 1
    }
end

