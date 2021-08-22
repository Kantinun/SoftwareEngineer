class Class
 
  def attr_accessor_with_history(*args)
      args.each do |arg|
          attr_name = arg.to_s #converse symbol to string
          attr_hist_name = attr_name +'_history'
      
    #getter
          self.class_eval("def #{attr_name};@#{attr_name};end") # method for get value of attribute
 
    #setter
          self.class_eval %Q{ 
          def #{attr_name}=(val)  #create method for set value of attribute
          # add to history
              @#{attr_hist_name} = [] if @#{attr_hist_name}.nil? #create list for collect history of attribute
              @#{attr_hist_name} << val   #collect value in history list
 
        # set the value itself
              @#{attr_name}=val  #set value of attribute
          end
 
          def #{attr_hist_name};@#{attr_hist_name};end  #create method that get history of value of attribute
 
                    }
          class_eval do
              def history(name) #create method that when call history(nameofattribute) this method will call method that give history of value of attribute
                  instance_variable_get("@#{name}_history") #call method that get history  of value
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