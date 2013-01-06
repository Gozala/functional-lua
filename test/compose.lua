local compose = require("../compose")

print("Run tests for `compose`")

local greet = function(name) return "hi: " .. name end
local exclaim = function(statement) return statement .. "!" end
local welcome = compose(exclaim, greet)

print("both functions in computation called in right order")
assert(welcome("moe") == "hi: moe!")
