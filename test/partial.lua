local partial = require("../partial")

print("Run tests for `partial`")

function sum(x, y) return x + y end

local add7 = partial(sum, 7)
local sum8and4 = partial(sum, 8, 4, 10)

print("partial application of one arguments")

assert(add7(2) == 9)

print("curry all arguments were curried")

assert(sum8and4(30, 11) == 12)

function serialize(...) return {...} end

print("nil arguments are curried")
local p1 = partial(serialize, 1, nil, 2)
local r1 = p1(4, 5)

assert(r1[1] == 1)
assert(r1[2] == nil)
assert(r1[3] == 2)
assert(r1[4] == 4)
assert(r1[5] == 5)

print("last nil argument is curried")
local p2 = partial(serialize, 1, nil, 2, nil)
local r2 = p2(4, 5)

assert(r2[1] == 1)
assert(r2[2] == nil)
assert(r2[3] == 2)
assert(r2[4] == nil)
assert(r2[5] == 4)
assert(r2[6] == 5)

print("last nil argument and first arguments is curried")
local p3 = partial(serialize, 1, nil)
local r3 = p3(nil, 4)

assert(r3[1] == 1)
assert(r3[2] == nil)
assert(r3[3] == nil)
assert(r3[4] == 4)

print("partial currying twice")
local p4 = partial(partial(serialize, 1, nil), nil, 3, nil)
local r4 = p4(nil, 4)

assert(r4[1] == 1)
assert(r4[2] == nil)
assert(r4[3] == nil)
assert(r4[4] == 3)
assert(r4[5] == nil)
assert(r4[6] == nil)
assert(r4[7] == 4)
