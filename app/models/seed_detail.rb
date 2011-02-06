class SeedDetail < ActiveRecord::Base
  belongs_to :seed
  default_scope :include => :seed
end
