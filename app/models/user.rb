class User < ActiveRecord::Base
	acts_as_authentic
  has_many :branches
  has_many :publications

  has_many :points_received, :class_name => 'PointTransaction', :foreign_key => 'receiver_id'
  has_many :points_given, :class_name => 'PointTransaction', :foreign_key => 'giver_id'

	has_many :follower_relationships, :class_name => 'UserRelationship', :foreign_key => 'guide_id'
	has_many :guide_relationships, :class_name => 'UserRelationship', :foreign_key => 'follower_id'
	has_many :followers, :through => :follower_relationships, :class_name => 'User'
	has_many :guides, :through => :guide_relationships, :class_name => 'User'

  def self.create_with_omniauth(auth)
    create! do |user|
      user.fbook_id = auth[:uid]
      user.name = auth[:user_info][:name]
    end
  end

  def give_point!(giver)
    self.points += 1
    self.save
    point = PointTransaction.new
    point.amount = 1
    point.receiver = self
    point.giver = giver
    point.save
  end

  def guide_branches
    Branch.find_by_sql("select * from branches where user_id in (select guide_id from user_relationships where follower_id = #{id})")
  end

  # workaround for mongomapper bug
  # http://bit.ly/bcQn3z
  def to_key
    [id.to_s]
  end
end
