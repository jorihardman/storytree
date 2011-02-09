class User < ActiveRecord::Base
	acts_as_authentic
  has_many :leaves
  has_many :points_received, :class_name => 'PointTransaction', :foreign_key => 'receiver_id'
  has_many :points_given, :class_name => 'PointTransaction', :foreign_key => 'giver_id'

  def self.create_with_omniauth(auth)
    create! do |user|
      user.fbook_id = auth['uid']
      user.name = auth['user_info']['name']
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

  private

  # workaround for mongomapper bug
  # http://bit.ly/bcQn3z
  def to_key
    [id.to_s]
  end
end
