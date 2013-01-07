local compose = require("../compose")

print("Run tests for `compose`")

local greet = function(name) return "hi: " .. name end
local exclaim = function(statement) return statement .. "!" end
local welcome = compose(exclaim, greet)

print("both functions in computation called in right order")
assert(welcome("moe") == "hi: moe!")

local a = function(...) return { "a", ... } end
local b = function(...) return { "b", ... } end
local c = compose(a, b)

local r1 = c()

assert(r1[1] == "a")
assert(r1[2][1] == "b")

local r2 = c("c")
assert(r2[1] == "a")
assert(r2[2][1] == "b")
assert(r2[2][2] == "c")

local r3 = c(nil, "c")
assert(r3[1] == "a")
assert(r3[2][1] == "b")
assert(r3[2][2] == nil)
assert(r3[2][3] == "c")

local r4 = c(nil, nil, "d")
assert(r4[1] == "a")
assert(r4[2][1] == "b")
assert(r4[2][2] == nil)
assert(r4[2][3] == nil)
assert(r4[2][4] == "d")
