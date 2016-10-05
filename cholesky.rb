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

total = 9

dims = Java::int[2].new;
dims[0] = 3
dims[1] = 3
puts A.class

rand = Random.new


left = Java::float[total].new
# right = Java::float[total].new

# (0...total).each do |i|
#   left[i] = i+1
#   # right[i] = tmp
# end

left[0] = 4
left[1] = 12
left[2] = -16

left[3] = 12

left[4] = 37
left[5] = -43
left[6] = 16
left[7] = -43
left[8] = -98

Util.info();

Data.createArray(A, dims, left)

Lapack.cholesky(C, A)
puts left.to_a
puts "=============="
res = Data.getFloatArray(C).to_a
puts res.to_a