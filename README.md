huffmanrb
=========

Implements a minimal Huffman encoder/decoder in ruby.
This Project was created for the data compression course at FH-Aachen.

Example usage:
========
Create input to encode. 50% a's, 33.33% b's, 16.66% c's.
    ruby -e "puts %w[a a a b b c].map{ |c| [c]*10000 }.flatten.shuffle.join" > testinput

Compress input to file
    ./encoder < testinput > enc.testinput

Decompress encoded file to file
    ./decoder < enc.testinput > dec.testinput

Compare file sizes
    du -h testinput enc.testinput

Possible output:
    60K testinput
    16K enc.testinput

Compare md5 checksums of original and the decoded file
    md5sum testinput dec.testinput

Possible output:
    7de2762f5bd59a7f95796d3fa43b23d1  testinput
    7de2762f5bd59a7f95796d3fa43b23d1  dec.testinput
