require 'csv'

class Account # this is my repository ie database
  def initialize(csv_file)
    @csv_file = csv_file
    @transactions =  []
    csv_to_account
  end

  def all
    @transactions = []
    csv_to_account
    @transactions
  end

  def add_transaction(transaction)
    @transactions << transaction
    account_to_csv
  end

  def remove_transaction(transaction_index)
    @transactions.delete_at(transaction_index)
    account_to_csv
  end

  private

  def account_to_csv
    csv_options = { col_sep: ";", force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file, 'wb', csv_options) do |csv|
      @transactions.each do |transaction|
        csv << transaction.to_csv
      end
    end
  end

  def csv_to_account
    csv_options = { col_sep: ';', quote_char: '"', headers: false }
    CSV.foreach(@csv_file, csv_options) do |row|
      # transaction = Transaction.new(row[0], row[1], row[2], row[3])
      transaction = Transaction.from_csv(row)
      @transactions << transaction
    end
  end
end
