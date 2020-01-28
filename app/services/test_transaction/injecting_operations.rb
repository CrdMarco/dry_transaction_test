module TestTransaction
  require "dry/transaction"

  class InjectingOperations
    include Dry::Transaction(container: Container)

    step :prepare
    step :validate, with: "languages.validate"
    step :validaten, with: "languages.validaten"
    step :create, with: "languages.create"

    private

    def prepare(input)
      # p "----> 123"
      Success(input)
    end
  end
end
