class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :forest
  belongs_to :branch

  default_scope :joins
end
