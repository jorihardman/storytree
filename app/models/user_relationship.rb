class UserRelationship < ActiveRecord::Base
  belongs_to :follower, :class_name => 'User'
  belongs_to :guide, :class_name => 'User'
end
