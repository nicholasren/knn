class KNN

  def initialize
    @samples = []
  end

  def train file_path
    @samples = from_file(file_path)
  end

  def categorize candidate, k
    neighbours = nearest_neighbours_for candidate, k
    value_with_max_vote neighbours
  end
  
  private

  def nearest_neighbours_for candidate, k
    heap = MaxHeap.new
    @samples.each do |sample|
      distance = distance_between(sample[:vector], candidate)
      heap.insert Node.new(distance, sample)
    end
    heap.take_top(k).compact.map(&:sample)
  end

  def distance_between a, b
    a.zip(b).map {|x| x[0] - x[1]}.inject(0){|sum, x| sum += x*x}
  end

  def value_with_max_vote xs
    value_with_votes = xs.group_by{ |x| x[:value]}.map{ |value, group| {:value => value, :votes => group.length}}
    value_with_votes.max_by { |x| x[:votes] }[:value]
  end


  def from_file file_path
    data = []
    File.open(file_path, 'r') do |file|
      while(line = file.gets)
        data << parse(line)
      end
    end
    data
  end

  def parse formated_data
    splited = formated_data.split '|'
    vector = splited[0].split(',').map {|e| e.to_f}
    {:vector => vector, :value => splited[1].strip}
  end
end
