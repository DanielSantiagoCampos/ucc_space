class PublicationsController < ApplicationController
  def create
    @publication = Publication.new(publication_params.merge!(user: current_user))

    if @publication.save
      @publication.update(file: @publication.file_upload.filename.to_s)
    else
      flash.now[:alert] = @publication.errors.full_messages.to_sentence
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  private

  def publication_params
    params.require(:publication).permit(:description, :tag_type, :file_upload)
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
