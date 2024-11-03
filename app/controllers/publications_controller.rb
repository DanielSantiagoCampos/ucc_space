class PublicationsController < ApplicationController
  def index
    @publications = Publication.includes(:comments, :likes).all
    @hashtags = Publication.pluck(:tag_type).uniq.map { |tag| tag_enum_to_string(tag) }
    @users = User.all
    @notifications = Notification.includes(:emisor_user, :publication).all
  end

  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to publications_path, notice: 'Publicación creada con éxito.'
    else
      @publications = Publication.all
      redirect_to root_path
    end
  end

  private

  def publication_params
    params.require(:publication).permit(:description, :tag_type, :file)
  end

  def tag_enum_to_string(tag)
    case tag
    when 'work_opportunity' then 'Oportunidad de trabajo'
    when 'funny'            then 'Divertido'
    when 'student_help'     then 'Ayuda estudiantil'
    else 'Desconocido'
    end
  end
end
