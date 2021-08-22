class Fibonacci 
    include Enumerable
    def initialize(num)
        @num_li = Array.new
        for i in 1..num do
            @num_li.push(fibonacci(i))            
        end
    end
    def fibonacci(n)
        if n === 1 || n === 2
            return 1
        else
            return fibonacci(n-1)+fibonacci(n-2)
        end
    end
    def each
        @num_li.each{|num|
            yield num
        }
    end
  
end
f = Fibonacci.new(6)
f.each { |s| print(s,":") }
puts ""
print f.reject{|s| s.odd?}
puts ""
print f.reject(&:odd?)
puts ""
print f.map{|x| 2*x}