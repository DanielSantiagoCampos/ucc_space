class Notification < ApplicationRecord
  belongs_to :emisor_user, class_name: 'User'
  belongs_to :receptor_user, class_name: 'User'
  belongs_to :publication

  enum notification_type: { like: 0, comment: 1 }
end

