class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next if self.prev != nil
    self.next.prev = self.prev if self.next != nil
    self.next = nil
    self.prev = nil

    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_reader :list
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
    # @link = link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @tail.prev == @head
  end

  def get(key)
    each do |link| #return link.val if link.key == key }
      if link.key == key
        return link.val
      end
    end
    nil
  end

  def include?(key)
    each do |link|
      if link.key == key
        return true
      end
    end
    false
  end

  def append(key, val)
    link = Link.new(key, val)
    @tail.prev.next = link # setting before reassigning tails values
    link.prev = @tail.prev
    link.next = @tail
    @tail.prev = link
  end

  def update(key, val)
    each do |link|
      if link.key == key
        link.val = val
      end
    end
  end

  def remove(key)
    each do |link|
      if link.key == key
        link.remove
        break
      end
    end
  end

  def each(&prc)
    first = @head.next
    while first != @tail
      prc.call(first)
      first = first.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
