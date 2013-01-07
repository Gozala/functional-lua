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

function params(...) return {...} end
function f() end
local wrapped = wrap(f, params)

print("nils in the argument don't shorten")
local r1 = wrapped(nil, nil, 1, nil, 2)
assert(r1[1] == f)
assert(r1[2] == nil)
assert(r1[3] == nil)
assert(r1[4] == 1)
assert(r1[5] == nil)
assert(r1[6] == 2)
