local once = require("../once")

print("Run tests for `once`")

local n = 0
local increment = once(function() n = n + 1 end)

increment()
increment()
increment()
increment()

print("only called actual function once")
assert(n == 1)
