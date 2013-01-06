local wrap = require("../wrap")

print("Run tests for `wrap`")

local hi = function(name) return "hi: " .. name end
local greet = wrap(hi, function(f, name)
  return f(name) .. "!!"
end)

print("wrapped function is passed along with args")
assert(greet("moe") == "hi: moe!!")

function noop() end
local wrapped = wrap(noop, function(...) return ... end)

local f, table, vector, victor = wrapped({"whats", "your"}, "vector", "victor")

assert(f, noop)
assert(#table, 2)
assert(table[1], "whats")
assert(table[2], "your")
assert(victor, "victor")
assert(vector, "vector")
