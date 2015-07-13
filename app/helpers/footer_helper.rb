module FooterHelper
  def admin_logger
    if admin_signed_in?
      return link_to 'Log out Admin', destroy_admin_session_path, :method => :delete
    else
      return link_to 'Login as Admin', new_admin_session_path
    end
  end
end
