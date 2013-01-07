local table = require("table")

return function(...)
  --[[
  Returns the composition of a list of functions, where each function
  consumes the return value of the function that follows. In math terms,
  composing the functions `f()`, `g()`, and `h()` produces `f(g(h()))`.

  # Examples

    local greet = function(name) return "hi: " .. name end
    local exclaim = function(statement) return statement .. "!" end
    local welcome = compose(exclaim, greet)

    welcome("moe")
    // => "hi: moe!"
  ]]--

  local lambdas = {...}
  local count = #lambdas
  return function(...)
    local state = table.pack(...)
    local index = count
    while index > 0 do
      state = { lambdas[index](unpack(state)) }
      index = index - 1
    end
    return unpack(state)
  end
end
