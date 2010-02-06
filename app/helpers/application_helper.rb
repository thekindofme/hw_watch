# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_or_admin_logged_in?
      admin_signed_in? || user_signed_in?
  end

  def current_user_or_admin
    current_user || current_admin
  end;

  def current_user_session_destroy_path
    if admin_signed_in?
      destroy_admin_session_path
    elsif
      destroy_user_session_path
    end
  end
end
