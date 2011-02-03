class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.fbook_id = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
