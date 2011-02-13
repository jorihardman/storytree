class Forest < ActiveRecord::Base
  has_many :leaves

  validates_presence_of :name, :description

  def seeds
    leaves.where({:type => 'seed'})
  end
end
