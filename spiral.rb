class Spiral

  def make_zeroed_array(n_factor)
    (1..n_factor).inject([]) { |group, n| group << Array.new(n_factor, 0) }
  end

  def find_center(n_factor)
    coord = n_factor % 2 == 1 ? n_factor/2 : n_factor/2 - 1
    Array.new(2, coord)
  end

  def next_direction(current_direction)
    next_direction = { :up => :left, :left => :down, :down => :right, :right => :up }
    next_direction[current_direction]
  end

  def next_coord(next_direct, previous_coord)
    next_coordinate = [previous_coord[0], previous_coord[1]]
    case next_direct
    when :left
      next_coordinate[1] = next_coordinate[1] - 1
    when :up
      next_coordinate[0] = next_coordinate[0] - 1
    when :right
      next_coordinate[1] = previous_coord[1] + 1
    when :down
      next_coordinate[0] = next_coordinate[0] + 1
    end
    next_coordinate
  end

  def left_spiral(ary, n_factor)
    coordinate = find_center(n_factor)
    current_direction = :down

    ary[coordinate[0]][coordinate[1]] = 1

    2.upto(n_factor ** 2) do |n|
      change_of_direction = next_direction(current_direction)
      same_direction_next_coord = next_coord(current_direction, coordinate)
      change_direction_next_coord = next_coord(change_of_direction, coordinate)

      sd0 = same_direction_next_coord[0]
      sd1 = same_direction_next_coord[1]
      cd0 = change_direction_next_coord[0]
      cd1 = change_direction_next_coord[1]

      if ary[cd0][cd1] &&  ary[cd0][cd1] == 0
        ary[cd0][cd1] = n if cd0 >= 0 && cd1 >= 0
        coordinate = [cd0, cd1]
        current_direction = change_of_direction
      elsif ary[cd0][cd1]
        ary[sd0][sd1] = n if sd0 >= 0 && sd1 >= 0
        coordinate = [sd0, sd1]
      end
    end
    ary
  end

end
