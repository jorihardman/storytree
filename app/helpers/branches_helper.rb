module BranchesHelper
  def branch(branch)
    <<-block
      <div id="#{branch.id}" class="branch">
        <div class="stats">
          [#{branch.points} points]
          [#{branch.children.count} branches]
          [by #{link_to branch.author.login, author_path(branch.author.id)}]
        </div>
        #{branch.leaf_text}
      </div>
    block
  end
end
