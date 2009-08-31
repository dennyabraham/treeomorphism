class TreeNode
  
  attr_reader :children
  
  def initialize
    @children = []
  end
  
  def << child
    @children << child
  end
  
  # i could precompute hashes on << to avoid recursion
  def == node
    return false if @children.size != node.children.size
    return @children.all? do |self_child|
      node.children.any? do |param_child|
        self_child == param_child
      end
    end

  end
  
end