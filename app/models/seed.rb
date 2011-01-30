class Seed < ActiveRecord::Base
  inherits_from :leaf
  has_ancestry
end
