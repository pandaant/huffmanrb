require 'huffmanrb/node'

module Huffmanrb
    def self.encode str
        bytes = str.bytes
        src = bytes.inject(Hash.new(0)){|h,c|h[c]+=1;h}.
            map{ |e| Node[nil,nil,*e] } # populate leafs

        # build tree
        until src.size.eql? 1
            src.sort!
            pair = src.shift 2
            src << Node[*pair,nil,pair.map{|e|e.freq}.reduce(:+)]
        end

        root    = src.first
        bytestr = bytes.map{ |e| root.table[e] }.join
        header  = [Marshal.dump(root.to_a), bytestr.length.to_s]

        "%s\n%d\n" % header << [bytestr].pack('B*')
    end

    def self.decode str
        output_buffer = String.new
        src = str.lines.map &:chomp
        tree, blength, data = src[0], src[1].to_i, src[2..-1].join
        table = Node.from_s(Marshal.load( tree )).table.invert
        data = data.unpack('B*')[0][0..blength - 1]

        # decompression
        while !data.empty?
            e,d = *table.select{|e|data.end_with? e}.max
            data=data[0..(-e.length-1)]
            output_buffer << d.chr
        end

        output_buffer.reverse
    end
end
