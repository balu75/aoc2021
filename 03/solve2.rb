input = File.readlines('input.txt').map do |s|
  s.gsub("\n","")
end

def most_common(ones, zeros)
  return ones >= zeros
end

def least_common(ones, zeros)
  return ones < zeros
end

def run(input, method)
  pos = 0
  while input.length > 1 do
    ones = 0;
    zeros = 0;

    input.each do |line|
      ones +=1 if line[pos] == "1"
      zeros +=1 if line[pos] == "0"
    end

    s = ""
    if method.call(ones, zeros)
      s = "1"
    else
      s = "0"
    end

    input = input.select do |line|
      line[pos] == s
    end

    pos += 1
  end
  return input[0].to_i(2)
end

puts "result: #{run(input, method(:most_common)) * run(input, method(:least_common))}"
