class Class
  def attr_accessor_with_history(name)
    attri_name = name
    attri_his = "history(#{attri_name})"
    his = []
    #getter
    self.class_eval("def #{attri_name} 
                      @#{attri_name} 
                    end")
    # #setter
    # self.class_eval %Q{
    #                 def #{attri_name}=(val)
    #                   @#{attri_name} = val
    #                   #{his} << val
    #                 end
    #                 def #{attri_his}; return #{his}; end
    #                 }
    
    self.class_eval %Q{
      def #{attri_name}=(val)
        # add to history
        @#{attri_his} = [nil] if @#{attri_his}.nil?
        @#{attri_his} << val
 
        # set the value itself
        @#{attri_name}=val
      end
 
      def #{attri_his};@#{attri_his};end
 
                    }
  end
end
class Foo
    attr_accessor_with_history :bar
  end
f = Foo.new     # => #<Foo:0x127e678>
f.bar = 3
puts f.bar
puts f.history(:bar)

