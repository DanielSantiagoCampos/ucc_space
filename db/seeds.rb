# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Crear usuarios de ejemplo
usernames = [
  "brilliant_unicorn", "mighty_phoenix", "happy_panda",
  "sneaky_fox", "radiant_star", "daring_explorer",
  "charming_pirate", "playful_dolphin", "wise_owl",
  "bold_tiger"
]

users = usernames.map do |username|
  User.create!(
    email: "#{username}@campusucc.edu.co",
    username: username,
    password: "daniel@campusucc.edu.co",
    password_confirmation: "daniel@campusucc.edu.co"
  )
end

# Crear publicaciones de ejemplo
publications = []

10.times do |i|
  publications << Publication.create!(
    user: users.sample,
    description: "Descripción de la publicación #{i + 1}",
    file: "https://via.placeholder.com/600x400",
    status: Publication.statuses.keys.sample, # Establecer estado aleatorio
    tag_type: Publication.tag_types.keys.sample # Establecer tag_type aleatorio
  )
end

# Crear comentarios para las publicaciones
publications.each do |publication|
  rand(1..5).times do
    Comment.create!(
      publication: publication,
      emisor_user: users.sample,
      comment: "Comentario aleatorio sobre la publicación."
    )
  end
end

# Crear likes para las publicaciones
publications.each do |publication|
  rand(1..5).times do
    Like.create!(
      user: users.sample,
      publication: publication
    )
  end
end

# Crear notificaciones para cada like y comentario
publications.each do |publication|
  publication.likes.each do |like|
    Notification.create!(
      emisor_user: like.user,
      receptor_user: publication.user,
      publication: publication,
      notification_type: :like # Notificación de tipo like
    )
  end

  publication.comments.each do |comment|
    Notification.create!(
      emisor_user: comment.emisor_user,
      receptor_user: publication.user,
      publication: publication,
      notification_type: :comment # Notificación de tipo comentario
    )
  end
end
