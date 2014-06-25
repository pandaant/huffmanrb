require 'test/unit'
require 'huffmanrb'

class TestNode < Test::Unit::TestCase
    include Huffmanrb

    def test_from_s
        root = Node.from_s([1,[2,3]])
        assert_equal 1, root.left.value
        assert_equal 2, root.right.left.value
        assert_equal 3, root.right.right.value

        root = Node.from_s([[4,1],[5,3]])
        assert_equal 4, root.left.left.value
        assert_equal 1, root.left.right.value
        assert_equal 5, root.right.left.value
        assert_equal 3, root.right.right.value
    end

    def test_table
        root = Node.from_s([[4,1],[5,[3,77]]])
        table=  root.table

        assert_equal '11', table[4] 
        assert_equal '01', table[1] 
        assert_equal '10', table[5] 
        assert_equal '100', table[3] 
        assert_equal '000', table[77] 
    end
end
