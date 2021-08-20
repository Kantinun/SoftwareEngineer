def ancestor(args)
    # if args == BasicObject
    #     return "nil"
    # elsif [Integer , String , Float , Array , TrueClass ,FalseClass ].include? args.class
    #     return args.class.name + ">" +ancestor(args.class)
    # else
    #     return args.superclass.name + ">" +ancestor(args.superclass)
    # end
    
    if args == BasicObject
        return nil
    else 
        return args.class.ancestors
    end
end

puts ancestor(a)