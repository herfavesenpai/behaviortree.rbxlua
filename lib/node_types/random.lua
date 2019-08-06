local class         = require(game.ReplicatedStorage.BehaviorTree.middleclass)
local BranchNode  	= require(game.ReplicatedStorage.BehaviorTree.node_types.branch_node)
local Random = class('Random', BranchNode)

function Random:start(object)
  BranchNode.start(self, object)
  local Value = math.random() * #self.nodes + 1
  self.actualTask = Value - Value % 1
end

function Random:success()
  BranchNode.success(self)
  self.control:success()
end

function Random:fail()
  BranchNode.fail(self)
  self.control:fail()
end

return Random
