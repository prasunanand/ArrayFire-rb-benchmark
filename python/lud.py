import arrayfire as af
import time

n = 5000
A = af.randu(n, n)


for x in range(0, 10):
  start = time.time()
  lud = af.lapack.lu(A)
  end = time.time()
  print(end - start)

  # print(lud)