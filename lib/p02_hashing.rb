class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
  endval = 1
  self.each_with_index do |val , idx|
    endval += (val * idx)
  end
    endval.hash
  end
end

class String

  def hash
    sum = 0
    self.chars.each_with_index do |ch, idx|
      sum += ch.ord * idx
    end
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.values.each do |val|
      sum += val.hash
    end
    sum.hash
  end
end
