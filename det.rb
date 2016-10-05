require 'java'
java_import 'java.util.Random'
require_relative './ext/ArrayFire.jar'
require 'benchmark'

java_import 'com.arrayfire.Array'
java_import 'com.arrayfire.Util'
java_import 'com.arrayfire.Data'
java_import 'com.arrayfire.Lapack'


A = Array.new()
B = Array.new()
C = Array.new()

total = 4

dims = Java::int[4].new;
dims[0] = 1
dims[1] = 1
dims[2] = 2
dims[3] = 2
puts A.class

rand = Random.new


left = Java::double[total].new

left[0] = 2
left[1] = 2
left[2] = 2

left[3] = 2

# left[6] = 0
# left[7] = 4
# left[8] = 2

Util.info();

Data.createArray(A, dims, left)

puts Benchmark.measure{
  Lapack.det(M, A)
}
m = 105
puts m
im =1
m = Lapack.det(A)
puts m
puts left.to_a