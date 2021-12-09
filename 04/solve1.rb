$max=5

def create_results(num_boards)
  return Array.new(num_boards) do |i| 
    Array.new($max) do |i| 
      Array.new($max) do |i|
        0
      end
    end
  end
end

boards = []
random_order=""
File.open('input.txt') do |f|
  random_order = f.readline.gsub("\n", "").split(",")
  f.readline
  boardline = 0
  boardnum = 0
  board=[]
  while not f.eof?
    line = f.readline
    if line == "\n"
      boards[boardnum] = board
      board=[]
      boardline = 0
      boardnum += 1
    else
      board[boardline] = line.split(" ").each { |x| x.to_i }
      boardline+=1
    end
  end
end
#puts "random_order: #{random_order}"
#puts "boards: #{boards}"

results = create_results(boards.length)

def check_result(result)
  $max.times do |y|
    temp = 0
    $max.times do |x|
      temp += result[x][y] 
    end
    if temp == $max
      return true
    end
  end
  $max.times do |x|
    temp = 0
    $max.times do |y|
      temp += result[x][y] 
    end
    if temp == $max
      return true
    end
  end
  return false
end

def presult(result)
  $max.times do |y|
    puts "#{result[y]}"
  end
end

def calc_value(board, result)
  val = 0
  $max.times do |y|
    $max.times do |x|
      if result[x][y] == 0
        val += board[x][y].to_i
      end
    end
  end
  return val
end

random_order.each do |cur|
  boards.each_with_index do |board, board_idx|
    board.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if cell == cur
          results[board_idx][row_idx][col_idx]=1
        end
      end
    end
  end
  results.each_with_index do |result, result_idx|
    if check_result(result)
      puts "winner: #{result_idx}"
      puts "cur: #{cur}"
      presult(results[result_idx])
      val = calc_value(boards[result_idx], results[result_idx])
      puts "value: #{val}"
      puts "result: #{val*cur.to_i}"
      exit
    end
  end
end

