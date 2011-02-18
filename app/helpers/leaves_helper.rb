module LeavesHelper
  def branch(leaf)
    <<-block
      <div id="#{leaf.id}" class="branch">
        <div class="stats">
          [#{leaf.points} points]
          [#{leaf.children.count} branches]
          [by #{link_to leaf.author.login, author_path(leaf.author.id)}]
        </div>
        #{leaf.leaf_text}
      </div>
    block
  end
end
