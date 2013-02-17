class Datum
  attr_reader :vector, :value
  def initialize vector = [], value = nil
    @vector = vector 
    @value = value
  end
end
