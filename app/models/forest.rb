class Forest < ActiveRecord::Base
  has_many :leaves

  def seeds
    leaves.where({:type => 'seed'})
  end
end
