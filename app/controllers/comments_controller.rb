class CommentsController < ApplicationController
  before_action :set_publication
  before_action :authenticate_user!

  def create
    @comment = @publication.comments.create(emisor_user: current_user, comment: params[:comment])
    if @comment.save
      flash[:notice] = "Has comentado a la publicación."
    else
      flash[:alert] = "No se pudo comentar la publicación. #{@comment.errors.full_messages.to_sentence}"
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  private

  def set_publication
    @publication = Publication.find(params[:publication_id])
  end
end