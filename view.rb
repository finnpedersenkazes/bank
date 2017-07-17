class View
  def display_transactions(account)
    sum = 0.0
    puts "Welcome to your bank account!"
    puts "           --           "
    puts "###   #{'DATE'.ljust(14, ' ')} AMOUNT: DESCRIPTION"
    puts "#{'--------------------------'.ljust(27, ' ')}: -----------------------------------------"

    account.all.each_with_index do |transaction, index|
      display_amount = "#{'%.02f' % transaction.amount}".rjust(10, ' ')
      line_to_print =
        "#{index.to_s.rjust(3, ' ')} " +
        "#{transaction.date.rjust(12, ' ')} " +
        "#{display_amount}: " +
        "#{transaction.description} " +
        "#{transaction.expected == 'true' ? "(expected)" : ""}"
      puts line_to_print
      sum += transaction.amount.to_f
    end
    puts "----------------------------------------------------------------------"
    puts "###   #{'TOTAL'.ljust(13, ' ')} #{'%.02f' % sum}"
    puts "----------------------------------------------------------------------"
  end

  def ask_user_for_date
    puts "What is the date of your transaction? 2017-mm-dd"
    answer = gets.chomp
    return Date.parse(answer)
  end

  def ask_user_for_amount
    puts "What is the amount of your transaction?"
    return gets.chomp.to_f
  end

  def ask_user_for_description
    puts "Please give a discription of your transaction:"
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    return gets.chomp.to_i - 1
  end
end
