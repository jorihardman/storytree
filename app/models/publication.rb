class Publication < ActiveRecord::Base
  belongs_to :user
  belongs_to :forest
  belongs_to :branch

  default_scope includes(:user, :branch).select('publications.*, users.login, branches.title')
end
