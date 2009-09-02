class AdvancedArray < Array
  
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


