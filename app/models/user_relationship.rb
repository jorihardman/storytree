class UserRelationship < ActiveRecord::Base
  belongs_to :follower, :class_name => 'User'
  belongs_to :guide, :class_name => 'User'

  validates_uniqueness_of :guide_id, :scope => :follower_id
end
