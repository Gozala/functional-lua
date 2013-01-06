local partial = require("../partial")

print("Run tests for `partial`")

function sum(x, y) return x + y end

local add7 = partial(sum, 7)
local sum8and4 = partial(sum, 8, 4, 10)

print("partial application of one arguments")

assert(add7(2) == 9)

print("curry all arguments were curried")

assert(sum8and4(30, 11) == 12)
