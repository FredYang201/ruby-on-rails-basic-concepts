def foo
  puts 'hello foo'
  yield 2
end

foo {|i| puts i}

proc = Proc.new {|i| puts i}
puts proc.class

def goo(&block)
  puts "I am in goo"
  block.call("I am in block")
end

# goo {|x| puts x}

def each_start_with(array, word)
  array.each do |i|
    if i.index(word) == 0
      yield i
    end
  end
end

arr = ['abcd', 'axyz', 'able', 'xyzab', 'qrst']
word = 'ab'

# each_start_with(arr, word) {|s| puts s}

class MyFirstClass
  attr_accessor :x, :y, :z
  def initialize(x, y, z)
    @x, @y, @z = x, y, z
  end
end

fc = MyFirstClass.new(1, 2, 3)
puts fc.x

module Helper
  def self.distance(p1, p2)
    Math.sqrt((p1.x - p2.x) ** 2 + (p1.y - p2.y) ** 2)
  end

  def shift_right(x, y, z=0)
    return x + 3, y, z
  end
end


class Point
  include Helper
  attr_accessor :x, :y

  @@center = 1
  VERSION = '1.0'
  def initialize(x=0, y=0)
    @x, @y = x, y
  end

  def +(point)
    Point.new(@x + point.x, @y + point.y)
  end
end

p1 = Point.new(1, 2)
p2 = Point.new(2, 3)

puts Helper.distance(p1, p2)
puts p1.shift_right(1, 2)
# p3 = p1 + p2
# puts p3.x, p3.y

# puts Point::VERSION
# puts Point::center
#

def sum_pair(arr)
  sum = 0
  arr.each_slice(2) do |pair|
    begin
      puts pair[0] + pair[1]
    rescue TypeError => e
      puts "Type Error"
    ensure
      sum += 1
    end
  end
end

arr = [1, 2, 3, 'a', 4, 5, 'sring', 2, 2, 8]
# sum_pair arr


class Person
  attr_reader :name
  include Comparable

  def initialize(name)
    @name = name
  end

  def <=>(other)
    @name <=> other.name
  end
end

p1 = Person.new('Jack')
p2 = Person.new('Bob')

p1 < p2
