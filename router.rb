class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    print `clear`
    puts "Welcome to your bank account!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.create_expected
    when 4 then @controller.destroy
    when 5, 0 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all transactions"
    puts "2 - Add a new transaction"
    puts "3 - Add an expected transaction"
    puts "4 - Remove transaction"
    puts "5 - Stop and exit the program"
  end
end
