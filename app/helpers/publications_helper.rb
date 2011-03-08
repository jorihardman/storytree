module PublicationsHelper
  def upvote(pub)
    if PointTransaction.already_given?(current_user, pub)
      return button_to 'Upvote', upvote_publication_path(pub.id),
        :method => :post,
        :remote => true,
        :id => 'upvote',
        :disabled => true
    else
      return button_to 'Upvote', upvote_publication_path(pub.id),
        :method => :post,
        :remote => true,
        :id => 'upvote'
    end
  end

  def points(amount)
    return "<p><b>Points:</b> #{amount}</p>"
  end
end
