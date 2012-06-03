class Branch < ActiveRecord::Base
  include PointManagement

  has_ancestry
  belongs_to :forest
  belongs_to :user
  has_many :points_received, :class_name => 'PointTransaction', :foreign_key => 'receiver_id'
  has_many :publications

  validates_presence_of :leaf_text
  validates_length_of :leaf_text, :minimum => 10

  before_create :init

  def story
    text = ''
    ancestors.each { |ancestor| text << ancestor.leaf_text }
    text << leaf_text
  end

  def last_page
    [ancestors.count / 5 + 1, 1].max
  end

  private

  def init
    debugger
    unless is_root?
      self.title = parent.title
      parent.child_count += 1
      unless PointTransaction.already_given?(UserSession.find.user, parent) or parent.user_id == UserSession.find.user.id
        parent.give_point!(user)
        parent.user.give_point!(user)
      end
      spawn do #send email in background
        UserMailer.subtree_update_email(parent).deliver
      end
    end
  end
end
