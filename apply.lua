local table = require("table")

return function(lambda, ...)
  --[[
  Applies `lambda` to the argument list formed by prepending intervening
  arguments to `args`.
  ]]--

  local params = table.pack(...)
  local count = params.n
  local offest = count - 1
  local packed = params[count]

  if (type(packed) == "table") then
    params[count] = nil
    for index, item in pairs(packed) do
      if (type(index) == "number") then
        count = offest + index
        params[count] = item
      end
    end
  end

  return lambda(unpack(params, 1, count))
end
