class FeedController < ApplicationController
  def index
    @publications = Publication.includes(:comments, :likes).all
    @popular_hashtags = Publication.pluck(:tag_type).uniq.map { |tag| tag_enum_to_string(tag) }
    @users = User.all
    @notifications = Notification.includes(:emisor_user, :publication).all
  end

  private

  def tag_enum_to_string(tag)
    case tag
    when 0 then 'work_opportunity'
    when 1 then 'funny'
    when 2 then 'student_help'
    else 'unknown'
    end
  end
end
