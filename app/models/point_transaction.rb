class PointTransaction < ActiveRecord::Base
  belongs_to :receiver, :polymorphic => true
  belongs_to :giver, :polymorphic => true
end
