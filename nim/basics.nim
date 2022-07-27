#!/home/per/.nimble/bin/nim r 
import sequtils, sugar, strutils, tables

echo "Hello world"

# Constant is computed at compilation time
#const constant = toSeq(0..10).map(x => 1 div x) # Compilation error
const constant = 3.14
echo constant

# Regular constant using let
let constant2 = 123
echo constant2

# Variable
var string = "foo"
string.add("bar")
#string += "baz" # does not compile
echo string

# There is a difference between a range/list and a sequence
# => lambda syntax requires 'sugar' import
let foo = toSeq(1..10).map(x => x mod x)
echo foo

# Easy counter object
var wordFrequencies = initCountTable[string]()

for line in ["hey"]:
#for line in stdin.lines:
  for word in line.split(", "):
    wordFrequencies.inc(word)

echo "The most frequent word is '", wordFrequencies.largest, "'"
echo wordFrequencies

# Case statements
case 'h':
  of 'a', 'e', 'i', 'o', 'u':
    echo "Vowel"
  of '\127'..'\255':
    echo "Unknown"
  else:
    echo "Consonant"

# Gives runtime error
#echo high(int) + 1

echo toSeq(1..4)
iterator `..<`*[T](a: T, b: T) : T = # The * denotes visibility
  var res = T(a)
  while res <= b:
    yield res
    inc res
echo toSeq(1..<4)

# Infix procedures
proc `@@@`*(a: int, b: int) =
  echo "This prints ", a, " and ", b, "."
1@@@2+3

# Block scope
let a = 1
block this_block_has_a_label:
  let a = 2
  echo a
echo a

# Bitwise operators have english names: xor, and, or, shr, shl
echo toHex (0b10_10_10_10 xor 0xff)

# Discard lets you use expressions as statements
discard 0 * 7

# Custom types?
type CustomInt = int
echo 2 + CustomInt(5)

# Read file at compile time
const test = toSeq(staticRead("basics.nim")).allIt(it != '7' or it == '7')
echo test
discard readFile("basics5.nim")
