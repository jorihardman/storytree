class Branch < ActiveRecord::Base
  #relationships
  has_ancestry
  belongs_to :forest
  belongs_to :user
  has_many :points_received, :class_name => 'PointTransaction', :foreign_key => 'receiver_id'
  has_many :publications

  #validations
  validates_presence_of :leaf_text
  validates_length_of :leaf_text, :minimum => 10

  before_create :init

  def story
    text = ''
    ancestors.each { |ancestor| text << ancestor.leaf_text }
    text << leaf_text
  end

  def give_point!(giver)
    pointTransaction = PointTransaction.where({:receiver_id => id, :giver_id => giver.id}).first
    if pointTransaction.nil? and giver.id != user_id
      self.points += 1
      self.save
      point = PointTransaction.new
      point.amount = 1
      point.receiver = self
      point.giver = giver
      point.save
      self.user.give_point!(giver)
    end
  end

  def last_page
    [ancestors.count / 5 + 1, 1].max
  end

  private

  def init
    unless is_root?
      title = parent.title
      parent.child_count += 1
      parent.give_point!(user)
    end
  end
end
