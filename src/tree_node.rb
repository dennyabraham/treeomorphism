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
    # return self.children.bijection?(node.children) do |self_child, node_child|
    #   self_child == node_child
    # end
    return false if self.children.size != node.children.size
    mapped_to = Hash.new(false)
    return self.children.all? do |self_child|
      maps = false
      node.children.each_with_index do |node_child, index|
        if not maps then
          if (self_child == node_child) && (not mapped_to[index]) then
            mapped_to[index] = true
            maps = true
          end
        end
      end
      maps
    end

  end
  
end