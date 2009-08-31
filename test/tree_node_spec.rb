require File.dirname(__FILE__) + '/../src/tree_node'

describe TreeNode do

  it "should take subnodes" do
    parent = TreeNode.new
    child1 = TreeNode.new
    child2 = TreeNode.new
    
    parent << child1 << child2
    
    parent.children.size.should == 2
    parent.children.should include(child1)
    parent.children.should include(child2)
  end
  
  describe "tree-o-morphisms" do

    before(:each) do
      @tree1 = TreeNode.new
      @tree2 = TreeNode.new
      
      @tree1leaf1 = TreeNode.new
      @tree1leaf2 = TreeNode.new
      @tree1leaf3 = TreeNode.new
      @tree2leaf1 = TreeNode.new
      @tree2leaf2 = TreeNode.new
      @tree2leaf3 = TreeNode.new
    end
    
    it "should be equal to another tree when they are both leaves" do
      @tree1 = TreeNode.new
      @tree2 = TreeNode.new
    
      @tree1.should == @tree2
    end
  
    it "should not be equal when one tree has a leaf and the other tree does not" do
      @tree1 << TreeNode.new
      
      @tree1.should_not == @tree2
    end
  
    it "should be equal to another tree with a single leaf" do
      @tree1 << TreeNode.new
      @tree2 << TreeNode.new
      
      @tree1.should == @tree2
    end
    
    it "should be equal to another tree if they have the same number of leaves" do
      @tree1 << TreeNode.new << TreeNode.new << TreeNode.new
      @tree2 << TreeNode.new << TreeNode.new << TreeNode.new
      
      @tree1.should == @tree2
    end
    
    it "should not be equal to another tree if their grandchildren are different" do
      @tree1leaf1 << TreeNode.new
      
      @tree1 << @tree1leaf1
      @tree2 << @tree2leaf1
      
      @tree1.should_not == @tree2
    end
    
    it "should be equal to another tree if they have the same grandchildren, but in a different order" do
      @tree1leaf1 << TreeNode.new << TreeNode.new
      @tree1leaf2 << TreeNode.new
      @tree1 << @tree1leaf1 << @tree1leaf2
      
      @tree2leaf1 << TreeNode.new
      @tree2leaf2 << TreeNode.new << TreeNode.new
      @tree2 << @tree2leaf1 << @tree2leaf2
      
      @tree1.should == @tree2
    end
    
    it "should not be equal to a tree that has a different grandchild" do
      @tree1leaf1 << TreeNode.new << TreeNode.new
      @tree1leaf2 << TreeNode.new
      @tree1leaf3 << TreeNode.new
      @tree1 << @tree1leaf1 << @tree1leaf2 << @tree1leaf3
      
      @tree2leaf1 << TreeNode.new
      @tree2leaf2 << TreeNode.new << TreeNode.new << TreeNode.new
      @tree2leaf3 << TreeNode.new << TreeNode.new
      @tree2 << @tree2leaf1 << @tree2leaf2 << @tree2leaf3
      
      @tree1.should_not == @tree2
    end
    
  end
end