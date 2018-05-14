local QuadNode = require("quadNode")

local QuadTree   = {}
QuadTree.__index = QuadTree

function QuadTree.new(capacity)
   local quadTree = setmetatable({
      capacity = capacity,
      root     = QuadNode(capacity),
      objects  = {},
   }, QuadTree)

   return quadTree
end

function QuadTree:add(object)
   if objects[object] then
      error("You fucking suck")
   end

   self.root:add(object)
end

function QuadTree:remove(object)
   if not objects[object] then
      error("You fucking suck as well")
   end

   self.root:remove(object)
end

return setmetatable(QuadTree, {
   __call = function(_, ...) return QuadTree.new(...) end,
})