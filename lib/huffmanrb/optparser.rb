require 'ostruct'
require 'optparse'

module Huffmanrb
    class OptParser
        def self.parse(args)
            options = OpenStruct.new
            options.mode = :encode

            opt_parser = OptionParser.new do |opts|
                opts.banner = "Usage: huffrb [options]"
                opts.separator ''
                opts.separator 'Specific options:'

                opts.on('-d', '--decode', 
                        'Decode input data.') do |v|
                    options.mode = :decode
                end

                opts.on("-h", "--help", "Prints this help") do |v|
                    puts opts
                    exit
                end
            end

            opt_parser.parse! args
            options
        end
    end
end
