module BranchesHelper
  def branch(branch)
    <<-block
      <div id="#{branch.id}" class="branch">
        <div class="stats">
          [#{branch.points} points]
          [#{branch.child_count} branches]
          [by #{link_to branch.user.login, user_path(branch.user_id)}]
        </div>
        #{branch.leaf_text}
      </div>
    block
  end
end
