local apply = require("../apply")

print("Run tests for `apply`")

apply(function(a, b)
  print("first argument is 1")
  assert(a == 1)
  print("second argument is 2")
  assert(b == 2)
end, 1, 2)

apply(function(a, b)
  print("array argument is unpacked")
  assert(a == 1)
  assert(b == 2)
end, {1, 2})

apply(function(a, b, c, d)
  print("last array argument is unpacked")
  assert(a == 1)
  assert(b == 2)
  assert(c == 3)
  assert(d == 4)
end, 1, 2, {3, 4})
