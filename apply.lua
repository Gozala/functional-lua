return function(lambda, ...)
  --[[
  Applies `lambda` to the argument list formed by prepending intervening
  arguments to `args`.
  ]]--

  local params = {...}
  local packed = params[#params]
  if (type(packed) == "table") then
    offest = #params - 1
    for index, item in ipairs(packed) do
      params[offest + index] = item
    end
  end
  return lambda(unpack(params))
end
