local class         = require(game.ReplicatedStorage.BehaviorTree.middleclass)
local Registry      = require(game.ReplicatedStorage.BehaviorTree.registry)
local Node          = require(game.ReplicatedStorage.BehaviorTree.node_types.node)
local BehaviorTree = class('BehaviorTree', Node)
 
BehaviorTree.Node                    = Node
BehaviorTree.Registry                = Registry
BehaviorTree.Task                    = Node
BehaviorTree.BranchNode              = require(game.ReplicatedStorage.BehaviorTree.node_types.branch_node)
BehaviorTree.Priority                = require(game.ReplicatedStorage.BehaviorTree.node_types.priority)
BehaviorTree.ActivePriority          = require(game.ReplicatedStorage.BehaviorTree.node_types.active_priority)
BehaviorTree.Random                  = require(game.ReplicatedStorage.BehaviorTree.node_types.random)
BehaviorTree.Sequence                = require(game.ReplicatedStorage.BehaviorTree.node_types.sequence)
BehaviorTree.Decorator               = require(game.ReplicatedStorage.BehaviorTree.node_types.decorator)
BehaviorTree.InvertDecorator         = require(game.ReplicatedStorage.BehaviorTree.node_types.invert_decorator)
BehaviorTree.AlwaysFailDecorator     = require(game.ReplicatedStorage.BehaviorTree.node_types.always_fail_decorator)
BehaviorTree.AlwaysSucceedDecorator  = require(game.ReplicatedStorage.BehaviorTree.node_types.always_succeed_decorator)

BehaviorTree.register = Registry.register
BehaviorTree.getNode = Registry.getNode

function BehaviorTree:run(object)
  if self.started then
    Node.running(self) --call running if we have control
  else
    self.started = true
    self.object = object or self.object
    self.rootNode = Registry.getNode(self.tree)
    self.rootNode:setControl(self)
    self.rootNode:start(self.object)
    self.rootNode:call_run(self.object)
  end
end

function BehaviorTree:running()
  Node.running(self)
  self.started = false
end

function BehaviorTree:success()
  self.rootNode:finish(self.object);
  self.started = false
  Node.success(self)
end

function BehaviorTree:fail()
  self.rootNode:finish(self.object);
  self.started = false
  Node.fail(self)
end

return BehaviorTree
