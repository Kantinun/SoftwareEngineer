
module Enumerable
    def each_with_flattening()
        self.flatten.each{|val|
            yield val
        }
    end
end

[1, [2, 3], 4, [[5, 6], 7]].each_with_flattening { |s| print "#{s}," }

