class Foo
    attr_accessor_with_history :bar
  end
f = Foo.new     # => #<Foo:0x127e678>
f.bar = 3       # => 3
f.bar = :wowzo  # => :wowzo
f.bar = 'boo!'  # => 'boo!'
f.history(:bar) # => [3, :wowzo, 'boo!']

