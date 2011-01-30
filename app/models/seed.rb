class Seed < Leaf
  has_one :seed_detail, :dependent => :delete
  accepts_nested_attributes_for :seed_detail
end
