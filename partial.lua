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

  local curried = {...}
  return function(...)
    local params = {unpack(curried)}
    params[#params + 1] = {...}
    return apply(lambda, unpack(params))
  end
end
