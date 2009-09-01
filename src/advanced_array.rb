class AdvancedArray < Array
  
  def bijection? other
    return false if self.children.size != other.size
    mapped_to = Hash.new(false)
    return self.all? do |self_child|
      maps = false
      other.each_with_index do |other_child, index|
        if not maps then
          if (yield self_child, other_child) && (not mapped_to[index]) then
            mapped_to[index] = true
            maps = true
          end
        end
      end
      maps
    end

  end

end