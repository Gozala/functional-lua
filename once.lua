return function(lambda)
  --[[
  Creates a version of the function that can only be called one time. Repeated
  calls to the modified function will have no effect, returning the value from
  the original call. Useful for initialization functions, instead of having to
  set a boolean flag and then check it later.
  ]]--
  local result = nil
  return function(...)
    if result == nil then
      result = {lambda(...)}
    end
    return unpack(result)
  end
end
