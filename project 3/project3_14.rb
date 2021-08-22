def my_swap(a,b)
    b,a = a,b
end
  
class Foo
    attr_accessor :a, :b
    def my_swap_2()
        @b,@a = @a,@b
    end
end
  
def my_string_replace_1(s)
    s.gsub( /Hi/, 'Hello')
end
  
def my_string_replace_2(s)
    s.gsub!( /Hi/, 'Hello')
end

a = 1 
b = 4
my_swap(a,b)
puts "use my_swap a = #{a} , b = #{b}"

foo = Foo.new
foo.a = 15
foo.b = 30
foo.my_swap_2
puts "use my_swap_2 foo.a = #{foo.a} , foo.b = #{foo.b}"

strHi = "HiHi"
my_string_replace_1(strHi)
puts "use my_string_replace_1(strHi) strHi = #{strHi}"

my_string_replace_2(strHi)
puts "use my_string_replace_2(strHi) strHi = #{strHi}"
