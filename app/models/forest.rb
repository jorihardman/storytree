class Forest < ActiveRecord::Base
  has_many :branches

  validates_presence_of :name, :description

  def seeds
    branches.where({:type => 'seed'})
  end
end
