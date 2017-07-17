class Transaction
  attr_reader :date, :description, :amount, :expected

  def initialize(date, amount, description, expected = false)
    @date = date
    @amount = amount
    @description = description
    @expected = expected
  end

  def to_csv
    [@date, @amount, @description, @expected]
  end

  def self.from_csv(row)
    # self.new(row[0], row[1], row[2], row[3])
    new(*row)
  end

  def to_s
    "#{date} #{amount} #{description} #{@expected ? "" : " expected"}"
  end
end
