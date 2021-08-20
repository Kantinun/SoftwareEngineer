class Fixnum
    def seconds  ; self ; end
    def minutes  ; self * 60 ; end
    def hours    ; self * 60 * 60 ; end
    def days     ; self * 60 * 60 * 24 end
    def ago      ; Time.now - self ; end
    def from_now ; Time.now + self ; end
  end

class Time
    def at_beginning_of_year
        return Time.new(self.year,1 ,1)
    end 
end
  puts Time.now.at_beginning_of_year + 5.days