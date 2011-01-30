class Leaf < ActiveRecord::Base
  has_ancestry
  before_create :parent_point, :init_values

  def add_points!
    self.points += 1
    self.save
  end

  def max_length
    root.seed_detail.branch_length
  end

  private

  def parent_point
    parent.add_points! unless is_root?
  end

  def init_values
    self.level = parent.level + 1 unless is_root?
  end
end
