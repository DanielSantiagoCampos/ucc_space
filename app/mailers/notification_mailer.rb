class NotificationMailer < ApplicationMailer
  def send_notification(notification)
    @notification = notification
    mail(
      to: @notification.receptor_user.email,
      subject: 'Tienes una nueva notificación en tu publicacion'
    )
  end
end
