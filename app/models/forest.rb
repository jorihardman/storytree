class Forest < ActiveRecord::Base
  has_many :branches
  has_many :publications

  validates_presence_of :name, :description

  def seeds
    branches.where({:type => 'seed'})
  end
end
