class LikesController < ApplicationController
  before_action :set_publication
  before_action :authenticate_user!

  def create
    # Intenta encontrar el like existente para evitar duplicados
    @like = @publication.likes.find_by(user: current_user)

    if @like
      flash[:alert] = "Ya le has dado like a esta publicación."
    else
      @like = @publication.likes.create(user: current_user)
      notification = Notification.create!(
        emisor_user_id: current_user.id,
        receptor_user_id: @publication.user.id,
        publication_id: @publication.id,
        notification_type: :like
      )

      NotificationMailer.send_notification(notification).deliver_now

      flash[:notice] = "Te gustó la publicación."
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