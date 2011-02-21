module UsersHelper
  def follow
    if UserRelationship.where({:follower_id => current_user.id, :guide_id => params[:id]}).first.nil?
      "#{button_to 'Follow', follow_author_path(params[:id]), :remote => true}"
    else
      "#{button_to 'Unfollow', unfollow_author_path(params[:id]), :remote => true, :method => :delete}"
    end
  end
end
