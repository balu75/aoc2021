horizontal = 0;
depth = 0;

File.readlines('input.txt').each do |line|
  arr = line.split(" ")
  com = arr[0]
  val = arr[1].to_i
  puts "#{com} #{val}"

  case com
  when "up"
    depth = depth - val
  when "down"
    depth= depth + val
  when "forward"
    horizontal = horizontal + val
  end
end

puts horizontal * depth
