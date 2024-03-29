module ApplicationHelper
  def login
    html = '<div id="login">'
    if current_user
      html << "Welcome #{current_user.login} [#{link_to 'My Account', my_account_path}"
      html << " | #{link_to 'Logout', session_path, :method => :delete}]"
    else
      html << "[#{link_to 'Login', new_session_path}"
      html << " | #{link_to 'Register', new_user_path}]"
    end
    return html << '</div>'
  end

  def login_link
    if current_user
      return "#{link_to 'Logout', session_path, :method => :delete}"
    else
      return "#{link_to 'Login', new_session_path}"
    end
  end
end
