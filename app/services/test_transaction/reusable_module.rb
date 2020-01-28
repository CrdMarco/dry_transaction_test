module TestTransaction
  module ReusableModule
    Transaction = Dry::Transaction(container: Container)
  end
end
