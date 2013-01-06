return function(lambda, wrapper)
  --[[
  Returns the first function passed as an argument to the second,
  allowing you to adjust arguments, run code before and after, and
  conditionally execute the original function.

  ## Example

      local hello = function(name) return "hello: " .. name end
      local greet = wrap(hello, function(f)
        return "before, " .. f("moe") .. ", after"
      end)

      greet() // => "before, hello: moe, after"
  ]]--
  return function(...)
    return wrapper(unpack({lambda, ...}))
  end
end
