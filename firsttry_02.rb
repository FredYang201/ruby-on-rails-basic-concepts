a = 100

puts "hello" if a >= 100

i = 1
while i <5
    puts i
    i = i + 1
end


begin
    a = 10
    b = 0
    puts a / b

rescue
    puts "can not divided by zero"

end

 
class Student
    def initialize(name, age, id)
        @name=name
        @age=age
        @id=id
    end

    def sayHi()
        puts "#{@name} -- #{@age} -- #{@id}"
    end

    def name
        puts @name
        return @name
    end
end

student = Student.new("fred", 10, 1)
student.sayHi()
puts student.name

class Grade1 < Student
    def initialize(name, age, id, grade)
        super(name, age, id)
        @grade = grade