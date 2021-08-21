class Numeric
    def dollars;  self; end
    def yen; self*0.012; end
    def euro; self*1.3; end
    def in(currency)
        if currency.to_s =="euros"
            self*1.3
        elsif currency.to_s =="yen"
            self*0.012
        elsif currency.to_s =="dollars"
            self
        else
        end
    end
end
puts 5.dollars.in(:euros)
puts (1.euro - 50.yen).in(:dollars)
