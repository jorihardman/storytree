class Leaf < ActiveRecord::Base
  acts_as_superclass
  has_ancestry
end
