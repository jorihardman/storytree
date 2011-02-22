module ApplicationHelper
  def login
    html = ''
    html << '<div id="login">'
    if current_user
      html << "Welcome #{current_user.login} [#{link_to 'My Account', my_account_path}"
      html << " | #{link_to 'Logout', session_path, :method => :delete}]"
    else
      html << "[#{link_to 'Login', new_session_path}"
      html << " | #{link_to 'Register', new_author_path}]"
    end
    return html << '</div>'
  end
end
