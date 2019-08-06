local class         = require(game.ReplicatedStorage.BehaviorTree.middleclass)
local Registry      = require(game.ReplicatedStorage.BehaviorTree.registry)
local Node          = class('Node')

local pairs = pairs -- slow right now, fast in the future

function Node:initialize(config)
  config = config or {}
  for k, v in pairs(config) do
    self[k] = v
  end

  if self.name ~= nil then
    Registry.register(self.name, self)
  end
end

function Node:start() end
function Node:finish() end
function Node:run() end

function Node:call_run(object)
  local success = function() self:success() end -- what are this and why do are it exist
  local fail = function()    self:fail() end
  local running = function() self:running() end
  self:run(object)
  success, fail, running = nil,nil,nil
end

function Node:setObject(object)
  self.object = object
end

function Node:setControl(control)
  self.control = control
end

function Node:running()
  if self.control then
    self.control:running(self)
  end
end

function Node:success()
  if self.control then
    self.control:success()
  end
end

function Node:fail()
  if self.control then
    self.control:fail()
  end
end

return Node
