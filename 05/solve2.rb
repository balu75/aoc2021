#$max = 1000
$max = 1000

def printField(field)
  return
  firstLine = "   "
  $max.times do |x|
    firstLine += x.to_s + "  "
  end
  puts firstLine
  field.each_with_index do |row, idx|
    puts "#{idx} #{row}"
  end
  gets
end

def insertDiag(start_point, end_point, field)
  puts "start_point: #{start_point}"
  puts "end_point: #{end_point}"

  point_x = start_point[0]
  point_y = start_point[1]

  field[point_y][point_x] += 1
  printField(field)
  while point_x != end_point[0]
    if start_point[0] > end_point[0]
      point_x -= 1
    else
      point_x += 1
    end
    if start_point[1] > end_point[1]
      point_y -= 1
    else
      point_y += 1
    end
    field[point_y][point_x] += 1
    printField(field)
  end
end


field = Array.new($max) { |i| Array.new($max) { |j| 0 }}

#insertDiag([1,1],[3,3], field)
#exit

File.foreach("input.txt") do |line|
  vals = line.gsub("\n","").split(" -> ")
  start_point = vals[0].split(",").map {|x| x.to_i}
  end_point = vals[1].split(",").map {|x| x.to_i}
  #puts "start_point: #{start_point}"
  #puts "end_point: #{end_point}"

  if (start_point[0] == end_point[0])
    startp = [start_point[1], end_point[1]].min
    endp = [start_point[1], end_point[1]].max

    (startp..endp).each do |j|
      field[j][start_point[0]] += 1
    end
  elsif (start_point[1] == end_point[1])
    startp = [start_point[0], end_point[0]].min
    endp = [start_point[0], end_point[0]].max

    (startp..endp).each do |j|
      field[start_point[1]][j] += 1
    end
  else
    insertDiag(start_point, end_point, field)
  end
end

def calc_result(field)
  sum = 0
  field.each do |row|
    row.each do |col|
      if col > 1
        sum += 1
      end
    end
  end 
  sum
end

puts "sum: #{calc_result(field)}"
