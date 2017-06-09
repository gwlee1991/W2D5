class MaxIntSet
  def initialize(max)
    @store = Array.new(max + 1) { false }
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      return true
    end
    false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    mod = num % num_buckets
    @store[mod] << num
  end

  def remove(num)
    mod = num % num_buckets
    @store[mod].delete(num)
  end

  def include?(num)
    mod = num % num_buckets
    return true if @store[mod].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    mod = num % num_buckets
    unless @store[mod].include?(num) || num == nil
      @store[mod] << num
      @count += 1
    end
    resize! if @count > num_buckets
  end

  def remove(num)
    mod = num % num_buckets
    if @store[mod].include?(num)
      @store[mod].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    mod = num % num_buckets
    return true if @store[mod].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    dupe = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    dupe.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end
  end
end
