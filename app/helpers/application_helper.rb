module ApplicationHelper
  def login
    if user_signed_in?
      link_to "log out", destroy_user_session_path, method: :delete
    else
      link_to "Sign in", new_user_session_path
    end
  end
end
