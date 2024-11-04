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
  "daniel.campos", "juan.devia", "felipe.soto",
  "angelica.silva", "santi.pedraza", "german.lopez",
  "carlos.rodriguez", "james.garcia", "linda.gomez",
  "laura.zapata"
]


users = usernames.map do |username|
  User.create!(
    email: "#{username}@campusucc.edu.co",
    username: username,
    password: "#{username}@campusucc.edu.co",
    password_confirmation: "#{username}@campusucc.edu.co"
  )
end

real_publications = [
  {
    user: users[0],
    description: "En esta empresa buscan desarrolladores web para proyecto de e-commerce.",
    file: "https://media.licdn.com/dms/image/v2/D4E22AQEzH7vLSep0Ug/feedshare-shrink_1280/feedshare-shrink_1280/0/1729779188464?e=1733356800&v=beta&t=_BuDkokMC7FFuqlolx8Nrup_2GYeWhgj0Ov29cKsni8",
    status: :active,
    tag_type: :work_opportunity
  },
  {
    user: users[1],
    description: "Los invito a conocer el museo de botero!",
    file: "https://upload.wikimedia.org/wikipedia/commons/d/dd/Museo_Botero%2C_Boteromuseum_03.jpg",
    status: :active,
    tag_type: :funny
  },
  {
    user: users[2],
    description: "Hola! Necesito ayuda con un problema de álgebra, alguien me puede ayudar?",
    file: "",
    status: :active,
    tag_type: :student_help
  },
  {
    user: users[3],
    file: "https://razonpublica.com/wp-content/uploads/2023/05/estudiantes-universitarios-profesores-universidades-Francisco-Diaz.jpg",
    description: "Estudiantes universitarios en la universidad.",
    status: :active,
    tag_type: :funny
  },
  {
    user: users[4],
    file: "https://musica.uniandes.edu.co/files/2021/04/salon1.jpeg",
    description: "Clases de musica, escribeme para obtener mas informacion.",
    status: :active,
    tag_type: :work_opportunity
  },
  {
    user: users[5],
    file: "https://moria.aurens.com/content/blog_post/2125/1644416084-Induccio%CC%81n-850x475.jpeg",
    description: "Unete a nuestro grupo de estudio!",
    status: :active,
    tag_type: :student_help
  },
  {
    user: users[6],
    file: "https://www.etitulo.com/wp-content/uploads/2023/10/mundo-laboral-1024x692.jpg",
    description: "Felicitame por mi grado!",
    status: :active,
    tag_type: :funny
  },
  {
    user: users[7],
    file: "https://jesusfuenmayor.com/wp-content/uploads/2023/06/sobrevivir-universidad.jpg?w=1080",
    description: "Si necesitas ayuda con tus tareas, escribeme!",
    status: :active,
    tag_type: :student_help
  },
  {
    user: users[8],
    file: "https://static.wixstatic.com/media/28a08b_6af498a7b6dd4d4a936fc223d30c729b~mv2.jpg/v1/fill/w_714,h_410,al_c,lg_1,q_80,usm_0.66_1.00_0.01,enc_auto/Clases%20de%20Fotograf%C3%ADa%20y%20Edici%C3%B3n%20en%20La%20Mol.jpg",
    description: "Te gustaria aprender a tomar fotos como un pro?, escribeme!",
    status: :active,
    tag_type: :work_opportunity
  },
  {
    user: users[9],
    file: "https://st.depositphotos.com/2656329/4008/v/450/depositphotos_40089595-stock-illustration-theater-stage-vector-illustration.jpg",
    description: "Te gustaria aprender a tomar fotos como un pro?, escribeme!",
    status: :active,
    tag_type: :work_opportunity
  }
]

real_comments = [
  "Me interesa la oferta, me puedes dar mas información?",
  "Interesante, me gustaría saber más.",
  "Me encantaría unirme!.",
  "Quiero saber más.",
  "Estaba por decir lo mismo! apoyo la mocion.",
  "Quiero hacer parte de esto",
  "Necesito mas informacion",
  "Que alegria!"
]

publications = []
real_publications.each do |publication|
  publications << Publication.create!(publication)
end

# Crear comentarios para las publicaciones
publications.each do |publication|
  rand(1..20).times do
    comment = Comment.create!(
      publication: publication,
      emisor_user: users.sample,
      comment: real_comments.sample
    )

    Notification.create!(
      emisor_user: comment.emisor_user,
      receptor_user: publication.user,
      publication: publication,
      notification_type: :comment,
      comment: comment.comment
    )
  end
end

# Crear likes para las publicaciones
publications.each do |publication|
  rand(1..20).times do
    like = Like.create!(
      user: users.sample,
      publication: publication
    )

    Notification.create!(
      emisor_user: like.user,
      receptor_user: publication.user,
      publication: publication,
      notification_type: :like
    )
  end
end