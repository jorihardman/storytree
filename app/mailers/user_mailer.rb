class UserMailer < ActionMailer::Base
  default :from => "storytree@storytr.ee"
  
  def welcome_email(user)
    @user = user
    
    mail(:to => user.email,
         :subject => 'Welcome to Storytree!')
  end
  
  # Composes an email to User 'user' about a new Branch 'branch'
  # added to one of his subtrees.
  def subtree_update_email(user, branch)
    @user = user
    @branch = branch
    
    #mail(:to => user.email,
    #     :subject => 'Story Update')
    mail(:to => @user.email,
         :subject => 'Story Update')
  end
end
