class Leaf < ActiveRecord::Base
  has_ancestry
  belongs_to :user
  before_create :parent_point

  def story
    ancestors.inject(""){ |outcome, cur| outcome + "#{cur.leaf_text}\n" } + leaf_text
  end

  def add_points!
    self.points += 1
    self.save
  end

  private

  def parent_point
    parent.add_points! unless is_root?
  end
end
