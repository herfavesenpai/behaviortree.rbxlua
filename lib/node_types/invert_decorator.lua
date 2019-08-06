local class         = require(game.ReplicatedStorage.BehaviorTree.middleclass)
local Registry      = require(game.ReplicatedStorage.BehaviorTree.registry)
local Decorator = require(game.ReplicatedStorage.BehaviorTree.node_types.decorator)
local InvertDecorator = class('InvertDecorator', Decorator)

function InvertDecorator:success()
  self.control:fail()
end

function InvertDecorator:fail()
  self.control:success()
end

return InvertDecorator
