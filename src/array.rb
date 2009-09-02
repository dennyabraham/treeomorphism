class Array
  
  # bijection? takes another enumerable and determines if they are related by the function
  # described by the containment condition passed in the block. 
  # example:  
  #   arr = [1, 2, 3, 4]
  #   other = [2, 4, 6, 8]
  #   arr.bijection? other do |x, y|
  #     2*x == y
  #   end
  
  def bijection? other
    return false if self.size != other.size
    
    mapped_to = Hash.new(false)
    return self.all? do |self_child|
      maps_correctly = false
      other.each_with_index do |other_child, index|
        unless maps_correctly then
          if (yield self_child, other_child) && (not mapped_to[index]) then
            mapped_to[index] = true
            maps_correctly = true
          end
        end
      end
      maps_correctly
    end

  end

end


