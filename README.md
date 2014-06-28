# Huffmanrb

Implements a Huffman encoder/decoder in ruby.

This Project was created for the data compression course at FH-Aachen.

## Installation

```shell
$ git clone https://github.com/pandaant/huffmanrb.git
$ cd huffmanrb
$ rake all
```

## Example usage:

Create input to encode. 50% a's, 33.33% b's, 16.66% c's.

```shell
$ ruby -e "puts %w[a a a b b c].map{ |c| [c]*10000 }.flatten.shuffle.join" > testinput
```

Compress input to file

```shell
$ huffrb < testinput > enc.testinput
```

Decompress encoded file to file

```shell
$ huffrb -d < enc.testinput > dec.testinput
```

Compare file sizes

```shell
$ du -h testinput enc.testinput
```

Possible output:

```shell
60K testinput
16K enc.testinput
```

Compare md5 checksums of original and the decoded file

```shell
$ md5sum testinput dec.testinput
```

Possible output:

```shell
7de2762f5bd59a7f95796d3fa43b23d1  testinput
7de2762f5bd59a7f95796d3fa43b23d1  dec.testinput
```
