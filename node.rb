require 'json'

#
# represents a node in the huffman tree. 
#
# left/right    children
# value         leafs store the bytevalue there
# freq          the frequency of that node
# 

class Node < Struct.new :left, :right, :value, :freq
    # generates the tree from an nested array
    def self.from_s s
        s.kind_of?(Array)? 
            Node[*s.map{|e|Node.from_s e},nil,0] : Node[nil,nil,s,0]
    end

    # generates a lookuptable for the generated
    # tree construct. left branch is associated
    # with 1 and right with 0.
    def table p = {}, tail = []
        p[value] = tail.reverse.join unless value.nil?
        unless leaf?
            left.table  p, tail + [1] 
            right.table p, tail + [0]
        end;p
    end

    def to_a # table in condensed format
        leaf?? value : [left.to_a,right.to_a]
    end

    def leaf?
        [left, right].any? &:nil?
    end

    def <=> n 
        freq <=> n.freq
    end
end
