class BinaryTree
    include Enumerable

    attr_accessor :value,:left,:right
      
    def initialize( value = nil )
        @value = value
        @left = nil
        @right = nil
    end
     
    def empty?
        return ( self.value == nil ) ? true : false
    end
         
    def insert(value)
        if @value
            if value < @value
                if @left == nil
                    @left = BinaryTree.new()
                    @left.value = value
                    # puts ("insert left")
                else
                    @left.insert(value)
                    
                end
            elsif value > @value
                if @right == nil
                    @right = BinaryTree.new()
                    @right.value = value
                    # puts ("insert right")
                else
                    @right.insert(value)
                    
                end
            end
        else
            @value = value
            # puts ("insert")
        end
    end

    def inorderTraversal (root)
        inOrderArray =[]
        if root
            inOrderArray = self.inorderTraversal(root.left)
            inOrderArray.push(root.value)
            inOrderArray = inOrderArray + self.inorderTraversal(root.right)
        end
        return inOrderArray
    end

    def each 
        self.inorderTraversal(self).each{|val|
            yield val
        }
    end
end

myTree = BinaryTree.new()
myTree.insert(0)
myTree.insert(7)
myTree.insert(7.5)
myTree.insert(15)
puts myTree.all?{|x| x.class == Integer}
puts myTree.any?{|x| x.class == Integer}
myTree.each{|x|
    print "#{x} , "
}
