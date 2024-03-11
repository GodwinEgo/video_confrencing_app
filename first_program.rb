def calculate_average
  sum = 0.0
  count = 0

  loop do
    puts "Enter a number (or 'exit' to finish):"
    input = gets.chomp

    if input.downcase == 'exit'
      break
    end

    unless valid_number?(input)
      puts "Invalid input. Please enter a number."
      break
    end

    sum += input.to_f
    count += 1
  end

  if count > 0
    average = sum / count
    puts "The average is #{average}"
  else
    puts "No numbers were entered."
  end
end

def valid_number?(str)
  Float(str) != nil rescue false
end

calculate_average