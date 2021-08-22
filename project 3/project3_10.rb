module Enumerable
    def each_permuted()
        self.shuffle.each{|val|
            yield val
        }
    end
end

[1,2,3,56,7,43,2].each_permuted { |num|
    puts ">>  #{num} "
}
