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
    def reject
        tmp = Array.new
        for i in @num_li do
            if yield i
                tmp.push(i)
            end
        end
        print @num_li-tmp
    end
    def map
        tmp = Array.new
        @num_li.each{|e| tmp.push(yield e)}
        print tmp
    end
end
f = Fibonacci.new(6)
f.each { |s| print(s,":") }
puts ""
f.reject{|s| s.odd?}
puts ""
f.reject(&:odd?)
puts ""
f.map{|x| 2*x}