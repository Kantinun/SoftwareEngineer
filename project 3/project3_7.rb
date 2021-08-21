module Enumerable
    def each_with_custom_index(start,step)
        index = start
        self.each{|val|
            yield  val , index
            index += step
        }
    end
end

%w(alice bob carol).each_with_custom_index(3,3)do |person,index|
    puts ">> #{person} is number #{index}"
end
 