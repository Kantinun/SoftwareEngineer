class Class
 
  def attr_accessor_with_history(*args)
      args.each do |arg|
          attr_name = arg.to_s
          attr_hist_name = attr_name +'_history'
      
    #getter
          self.class_eval("def #{attr_name};@#{attr_name};end")
 
    #setter
          self.class_eval %Q{
          def #{attr_name}=(val)
          # add to history
              @#{attr_hist_name} = [] if @#{attr_hist_name}.nil?
              @#{attr_hist_name} << val
 
        # set the value itself
              @#{attr_name}=val
          end
 
          def #{attr_hist_name};@#{attr_hist_name};end
 
                    }
          class_eval do
              def history(name)
                  instance_variable_get("@#{name}_history")
              end
          end
      end
  end
 
end
class Foo
  attr_accessor_with_history :bar, :el
end
   
f = Foo.new
f.bar = 3
f.bar = :wowzo
f.bar = 'boo!'

f.el = 2
f.el = :ezy
f.el = "Woww!"

print f.history(:bar)
print f.history(:el)