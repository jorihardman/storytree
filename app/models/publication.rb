class Publication < ActiveRecord::Base
  include PointManagement

  belongs_to :user
  belongs_to :forest
  belongs_to :branch
  has_many :points_received, :class_name => 'PointTransaction', :foreign_key => 'receiver_id'

  default_scope includes(:user, :branch).select('publications.*, users.login, branches.title')
end
