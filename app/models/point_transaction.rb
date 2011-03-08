class PointTransaction < ActiveRecord::Base
  belongs_to :receiver, :polymorphic => true
  belongs_to :giver, :polymorphic => true

  def self.already_given?(giver, receiver)
    trans = PointTransaction.where({
      :giver_type => giver.class,
      :giver_id => giver.id,
      :receiver_type => receiver.class,
      :receiver_id => receiver.id,
      }).first
    return trans.nil? ? false : true
  end
end
