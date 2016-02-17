class Animal 
 def eat(food)
  puts "Easting #{food}"
  digest(food)
  @hungry = false
  puts "Digesting #{food}"
end

module Sellable
  def sell(price)
    puts "Продано за #{price}"
  end
end


class Bunny
  attr_reader :name
  attr_writer :name

def Bunny.make10(name)
  10.times.map{Bunny.new(name)}
end


  def initialize(name)
    @name = name
    @hungry = true
  end

  def great(who)
    puts "#{@name}: Hi, #{who}!"
  end

  def feed(what)
    puts "Eating #{what}.Thanks"
    @hungry = false
  end
end

b = Bunny.new('Jerry')

p b
b.feed('Carrot')
p b
#method for particular object
def b.say_hi
  puts 'Hello'
end

b.say_hi

module Birthable
  def make3(name)
    3.times.map{new(name)}
  end
end

#композиция
module Mammals
  class Tiger < Animal
    include Sellable
    extend Birthable 

    def eat(food) #частично изменить родительский метод
      if food =="carrot"
        raise(ArgumentError,"Я не ем морковки!")
      else 
        super(food)
      end
    end
  end
end



a = Mammals::Tiger.make3

