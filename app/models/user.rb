class User < ActiveRecord::Base
  has_many :leaves

  def self.create_with_omniauth(auth)
    create! do |user|
      user.fbook_id = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
