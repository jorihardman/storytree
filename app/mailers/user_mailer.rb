class UserMailer < ActionMailer::Base
  default :from => "nustorytree@gmail.com"

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => 'Welcome to Storytree!')
  end

  def subtree_update_email(branch)
    @user = branch.author
    @branch = branch
    mail(:to => @user.email, :subject => 'Story Update')
  end
end
