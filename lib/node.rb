class Node
  include Comparable
  
  attr_accessor :distance, :sample
  def initialize distance, sample
    @distance = distance
    @sample = sample
  end

  def <=>(other)
    other.distance <=> self.distance
  end
end
