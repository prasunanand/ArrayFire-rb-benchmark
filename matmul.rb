require 'java'
java_import 'java.util.Random'
require_relative './ext/ArrayFire.jar'
require 'benchmark'

java_import 'com.arrayfire.Array'
java_import 'com.arrayfire.Util'
java_import 'com.arrayfire.Data'
java_import 'com.arrayfire.Blas'


A = Array.new()
B = Array.new()
C = Array.new()

total = 25_000_000
n = 5000

dims = Java::int[2].new;
dims[0] = n
dims[1] = total/n
puts A.class

rand = Random.new


left = Java::float[total].new
right = Java::float[total].new

(0...total).each do |i|
  left[i] = 2
  right[i] = 3
end

Util.info();

Data.createArray(A, dims, left)
Data.createArray(B, dims, right)

(0...10).each do |i|
  puts Benchmark.measure{
    Blas.matmul(C, A, B)
  }
end

# res = Data.getFloatArray(C).to_a
# puts res[5000]
