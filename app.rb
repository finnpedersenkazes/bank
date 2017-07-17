require_relative 'account'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'
require "awesome_print"
require 'byebug'
require 'date'

csv_file   = File.join(__dir__, 'transactions.csv')
account   = Account.new(csv_file)
controller = Controller.new(account)
router = Router.new(controller)

# Start the app
router.run
