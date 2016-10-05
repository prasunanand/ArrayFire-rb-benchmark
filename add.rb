require 'java'
java_import 'java.util.Random'
require_relative './ext/ArrayFire.jar'
require 'benchmark'

java_import 'com.arrayfire.Array'
java_import 'com.arrayfire.Util'
java_import 'com.arrayfire.Data'
java_import 'com.arrayfire.Arith'


A = Array.new()
B = Array.new()
C = Array.new()

total = 100000000

dims = Java::int[2].new;
dims[0] = 1
dims[1] = total
puts A.class

rand = Random.new


left = Java::float[total].new
right = Java::float[total].new

(0...total).each do |i|
  left[i] = i
  tmp = (rand.nextDouble() * 10) / 10
  right[i] = tmp
end

Util.info();

Data.createArray(A, dims, left)
Data.createArray(B, dims, right)

(0...10).each do |i|
  puts Benchmark.measure{
    Arith.add(C, A, B)
  }
end
# res = Data.getFloatArray(C).to_a

# puts left.to_a
# puts "=============="
# puts right.to_a
# puts "================="
# puts res