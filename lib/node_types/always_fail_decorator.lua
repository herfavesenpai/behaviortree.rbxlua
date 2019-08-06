local class         = require(game.ReplicatedStorage.BehaviorTree.middleclass)
local Decorator  	= require(game.ReplicatedStorage.BehaviorTree.node_types.decorator)
local AlwaysFailDecorator = class('AlwaysFailDecorator', Decorator)

function AlwaysFailDecorator:success()
  self.control:fail()
end

function AlwaysFailDecorator:fail()
  self.control:fail()
end

return AlwaysFailDecorator

