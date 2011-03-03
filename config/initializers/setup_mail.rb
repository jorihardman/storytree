# Right now, this is set up to use a gmail account gmailusername@gmail.com
# with password 'gmailpassword'.
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => 'storytr.ee',
  :user_name => 'gmailusername',
  :password => 'gmailpassword',
  :authentication => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
