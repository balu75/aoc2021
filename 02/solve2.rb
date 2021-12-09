hor = dep = aim = 0

File.readlines('input.txt').each do |line|
  arr = line.split
  val = arr[1].to_i
  case arr[0]
  when "up" then aim -= val
  when "down" then aim += val
  when "forward"
    hor += val
    dep += aim * val
  end
end

puts hor * dep
