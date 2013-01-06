local memoize = require("../memoize")

print("Run tests for `memoize`")

function fib(n)
  if n < 2 then
    return n
  else
    return fib(n - 1) + fib(n - 2)
  end
end

local fibnitro = memoize(fib)

print("a memoized version of fibonacci produces identical results")
assert(fib(10) == 55)
assert(fibnitro(10) == 55)

function o(key, value) return value end

local oo = memoize(o)
local v1 = {}
local v2 = {}


print("on first call memoize")
assert(oo(1, v1) == v1)

print("on second call just returns memoized")
assert(oo(1, v2) == v1)

print("memoize by table key")
assert(oo(v1, v2) == v2)
print("memoized new value")
assert(oo(v1) == v2)

print("values do not override")
assert(oo(1) ~= oo(v1))

print("returns same value as un-memoized")
assert(o(3, v2) == oo(v1, 3))
