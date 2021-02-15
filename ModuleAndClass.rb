module Helper
  module InstanceMethod
    def instance_method
      puts "I am going to instance method of class"
    end
  end

  def class_method
    puts "I am going to class method of class"
  end

  def self.extended(kclass)
    kclass.include InstanceMethod
  end

  module ClassMethod
    def class_method
      puts "I am going to class method of class"
    end
  end

  # def self.included(kclass)
  #   kclass.extend ClassMethod
  # end
end

class Test
  # include Helper
  extend Helper
end


t = Test.new
t.instance_method
Test.class_method