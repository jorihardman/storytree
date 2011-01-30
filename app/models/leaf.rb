class Leaf < ActiveRecord::Base
  has_ancestry
  before_create :parent_point

  def add_points!
    self.points += 1
    self.save
  end

  def parent_point
    parent.add_points! unless is_root?
  end
end
