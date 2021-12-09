$max = 1000

def printField(field)
  field.each do |row|
    puts "#{row}"
  end
end

field = Array.new($max) { |i| Array.new($max) { |j| 0 }}

File.foreach("input.txt") do |line|
  vals = line.gsub("\n","").split(" -> ")
  start_point = vals[0].split(",").map {|x| x.to_i}
  end_point = vals[1].split(",").map {|x| x.to_i}
  puts "start_point: #{start_point}"
  puts "end_point: #{end_point}"

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
  end
  #printField(field)
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
