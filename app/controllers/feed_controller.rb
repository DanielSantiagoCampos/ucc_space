class FeedController < ApplicationController
  def index
    @publications = Publication.includes(:comments, :likes).all
    @popular_hashtags = Publication.pluck(:tag_type).uniq.map { |tag| tag_enum_to_string(tag) }
    @users = User.all
    @notifications = Notification.includes(:emisor_user, :publication).all

    @hashtags_count = @publications
      .group_by(&:tag_type) # Agrupa por tag_type
      .transform_values(&:count) # Cuenta cuántas publicaciones hay por cada tag_type
      .sort_by { |_, count| -count } # Ordena de mayor a menor
      .map{ |tag, count| [tag_enum_to_string(tag), count] } # Convierte el tag_type a string
  end

  private

  def tag_enum_to_string(tag)
    case tag
    when 'work_oportunity' then 'Oportunidad de trabajo'
    when 'funny'            then 'Divertido'
    when 'student_help'     then 'Ayuda estudiantil'
    else 'Desconocido'
    end
  end
end
