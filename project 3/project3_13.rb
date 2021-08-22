class Numeric
    @@currency = {'yen' => 0.012, 'euro' => 1.3, 'dollar' => 1}
    def dollar;  self*@@currency["dollar"]; end
    def yen; self*@@currency["yen"]; end
    def euro; self*@@currency["euro"]; end
    def in(currency)
        if currency.match(/euros?/i)
            self.euro
        elsif currency.match(/yen/i)
            self.yen
        elsif currency.match(/dollars?/i)
            self.dollar
        else
        end
    end
    def method_missing(method_id, *args, &block)
        singular_currency = method_id.to_s.gsub(/s$/, '')
        if @@currency.has_key?(singular_currency)
            if singular_currency.match(/yen/i)
                self.yen
            elsif singular_currency.match(/euros?/i)
                self.euro
            else
                self.dollar
            end
        else
            super
        end
    end
end
puts 5.dollar.in(:euro)
puts (1.euro - 50.yen).in(:dollar)
