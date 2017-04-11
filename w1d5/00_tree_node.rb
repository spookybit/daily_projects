require "byebug"
class PolyTreeNode

  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(new_parent)
    parent.children.delete(self) if not @parent.nil?
    @parent = new_parent
    unless new_parent.nil? || new_parent.children.include?(self)
      new_parent.children.push(self)
    end
  end

  def add_child(kid)
    kid.parent = self
    children << kid unless children.include?(kid)

  end

  def remove_child(child)
    raise "Not a child" unless children.include?(child)
    children.delete(child)
    child.parent = nil
  end

  def dfs(target)
    #byebug
    return self if value == target
    nil if children.nil?
    result = nil
    children.each do |child|
      result = child.dfs(target)
      if result != nil
        break
      end
    end
    result
  end

  def bfs(target)
    return self if value == target
    queue = children.dup
    until queue.empty?
      if queue.first.value == target
        return queue.first
      else
        first = queue.shift
        queue += first.children
      end
    end

    nil

  end

end
