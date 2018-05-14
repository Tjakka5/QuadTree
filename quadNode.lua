local Ffi = require("ffi")

Ffi.cdef([[
   typedef struct quadNode {
      struct quadNode *parent;
      struct quadNode *children[4];
      int    capacity;
      bool   divided;
      int    objects[?];
   } quadNode_t;
]])

local QuadNode   = {}
QuadNode.proto   = Ffi.metatype("quadNode_t", QuadNode)
QuadNode.__index = QuadNode

function QuadNode.new(capacity)
   local quadNode = QuadNode.proto(capacity)

   quadNode.capacity = capacity

   return quadNode
end

function QuadNode:add()
end   

return setmetatable(QuadNode, {
   __call = function(_, ...) return QuadNode.new(...) end,
})