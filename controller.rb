require_relative 'view'
require_relative 'transaction'

class Controller
  def initialize(account)
    @account = account
    @view = View.new
  end

  def list
    @view.display_transactions(@account)
  end

  def create
    date = @view.ask_user_for_date
    amount = @view.ask_user_for_amount
    description = @view.ask_user_for_description
    transaction = Transaction.new(date, amount, description, false)
    @account.add_transaction(transaction)
  end

  def create_expected
    date = @view.ask_user_for_date
    amount = @view.ask_user_for_amount
    description = @view.ask_user_for_description
    transaction = Transaction.new(date, amount, description, true)
    @account.add_transaction(transaction)
  end

  def destroy
    list
    index = @view.ask_user_for_index
    @account.remove_transaction(index)
  end
end
