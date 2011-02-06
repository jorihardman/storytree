class Leaf < ActiveRecord::Base
  has_ancestry
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
  has_many :points_received, :class_name => 'PointTransaction', :foreign_key => 'receiver_id'
  before_create :parent_point

  def story
    ancestors.inject(""){ |outcome, cur| outcome + "#{cur.leaf_text}\n" } + leaf_text
  end

  def give_point!(giver)
    if PointTransaction.where({:receiver_id => id, :giver_id => giver.id}).empty?
      self.points += 1
      self.save
      point = PointTransaction.new
      point.amount = 1
      point.receiver = self
      point.giver = giver
      point.save
      self.author.give_point!(giver)
    end
  end

  def parent_point
    unless is_root?
      parent.give_point!(author)
    end
  end
end
