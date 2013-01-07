local table = require("table")
local apply = require("./apply")

return function(lambda, ...)
  --[[
  Function composes new function out of given `lambda` with rest of the
  arguments curried.

  ## Example

      function sum(x, y) { return x + y }
      var inc = partial(sum, 1)

      inc(5) // => 6
  ]]--

  local curried = table.pack(...)
  local offset = curried.n
  return function(...)
    local params = {unpack(curried, 1, offset)}
    params[offset + 1] = table.pack(...)
    return apply(lambda, unpack(params, 1, offset + 1))
  end
end
