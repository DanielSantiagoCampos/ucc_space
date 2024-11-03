class Like < ApplicationRecord
  # Relaciones
  belongs_to :user
  belongs_to :publication
end

