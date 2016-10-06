import arrayfire as af
import time

n = 500
A = af.identity(n, n)


for x in range(0, 10):
  start = time.time()
  d = af.det(A)
  end = time.time()
  print(end - start)

  # print(d)