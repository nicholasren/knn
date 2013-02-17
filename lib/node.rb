class Node
  include Comparable
  
  attr_accessor :distance, :value
  def initialize distance, value
    @distance = distance
    @value = value
  end

  def <=>(other)
    other.distance <=> self.distance
  end
end
