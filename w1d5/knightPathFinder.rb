require_relative "00_tree_node.rb"

class KnightPathFinder
  DELTA = [
    [+1, +2],
    [-1, +2],
    [-1, -2],
    [+1, -2],
    [+2, +1],
    [+2, -1],
    [-2, +1],
    [-2, -1]

  ]
  def initialize(pos)
    @visited_positions = [pos]
    @root = build_move_tree(pos)

    @move_tree = nil
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos)
    new_moves.select! do |move|
      move unless @visited_positions.include?(move)
    end
    @visited_positions += new_moves
    new_moves

  end

  def build_move_tree(pos)
    root = PolyTreeNode.new(pos)
    queue = [root]
    # new_moves = new_move_positions(root.value)
    # new_moves.each do |move|
    #   new_child = PolyTreeNode.new(move, root)
    #   root.add_child(new_child)
    #   queue.push(new_child)
    # end
    until queue.empty?
      first_child = queue.shift
      next_moves = new_move_positions(first_child.value)
      next_moves.each do |next_move|
        next_child = PolyTreeNode.new(next_move, first_child)
        first_child.add_child(next_child)
        queue.push(next_child)

      end
    end
    root
  end

  def find_path(array)
    found_node = @root.dfs(array)
    result = []
    if not found_node.nil?
      result << found_node.value
      until found_node.parent.nil?
        parent = found_node.parent
        result.unshift(parent.value)
        found_node = parent
      end

    end
    result
  end

  def self.valid_moves(pos)
    valid_moves = DELTA.map{|x, y| [pos[0] + x, pos[1] + y]}
    valid_moves.select do |array|
      array[0].between?(0, 7) && array[1].between?(0, 7)
    end


  end



end
