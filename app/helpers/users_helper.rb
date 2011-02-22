module UsersHelper
  def follow(guide_id)
    if current_user.id != guide_id
      if UserRelationship.where({:follower_id => current_user.id, :guide_id => params[:id]}).first.nil?
        return "#{button_to 'Follow', follow_author_path(params[:id]), :remote => true}"
      else
        return "#{button_to 'Unfollow', unfollow_author_path(params[:id]), :remote => true, :method => :delete}"
      end
    else
      return ''
    end
  end
end
