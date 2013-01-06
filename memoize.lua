local identity = require("./identity")

return function(lambda, hash)
  --[[
  Memoizes a given function by caching the computed result. Useful for
  speeding up slow-running computations. If passed an optional `hash` function,
  it will be used to compute the hash key for storing the result, based on
  the arguments to the original function. The default `hash` just uses
  the first argument to the memoized function as the key.
  ]]--

  local memo = { __mode = "k" }
  hash = hash or identity
  return function(...)
    local key = hash(...)
    local value = memo[key]
    if not value then
      value = {lambda(...)}
      memo[key] = value
    end
    return unpack(value)
  end
end
