tablearray = (0..999).to_a.repeated_permutation(2).to_a
$tablehash = {}

tablearray.each do |coords|
  $tablehash[coords] = 0
end

def identify_type(arr)
  if arr[0] == "turn"
      arr.shift
  end
  return arr
end

def split_string(str)
  str.split
end

def mapper(coord1, coord2)
  x1 = coord1[0].to_i
  y1 = coord1[1].to_i
  x2 = coord2[0].to_i
  y2 = coord2[1].to_i

  x_axis = (x1..x2).to_a
  y_axis = (y1..y2).to_a

  x_axis.product(y_axis)
end


def count_on(hash)
  hash.values.inject(:+)
end


def toggle(arr)
  arr.each do |coord|
    $tablehash[coord] = ($tablehash[coord] + 2)
  end
end

def turn_on(arr)
  arr.each do |coord|
    $tablehash[coord] = ($tablehash[coord] + 1)
  end
end

def turn_off(arr)
  arr.each do |coord|
    if $tablehash[coord] > 0
      $tablehash[coord] = ($tablehash[coord] - 1)
    end
  end
end

File.open("day6input.txt", "r") do |f|
  f.each_line do |a|

    array = identify_type(split_string(a))
    coord1 = array[1].split(",")
    coord2 = array[3].split(",")
    a_map = mapper(coord1, coord2)

    if (array[0] == "toggle")
      toggle(a_map)
    end
    if (array[0] == "on")
      turn_on(a_map)
    end
    if (array[0] == "off")
      turn_off(a_map)
    end
    p count_on($tablehash)
  end
end
