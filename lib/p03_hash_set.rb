require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    mod = key.hash % num_buckets
    unless @store[mod].include?(key) || key == nil
      @store[mod] << key
      @count += 1
    end
    resize! if @count > num_buckets
  end

  def include?(key)
    mod = key.hash % num_buckets
    return true if @store[mod].include?(key)
    false
  end

  def remove(key)
    mod = key.hash % num_buckets
    if @store[mod].include?(key)
      @store[mod].delete(key)
      @count -= 1
    end
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
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
