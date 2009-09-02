require File.dirname(__FILE__) + '/array'
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
    return self.children.bijection?(node.children) do |self_child, node_child|
      self_child == node_child
    end
  end
  
end