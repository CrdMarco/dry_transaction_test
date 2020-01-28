require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

module TestTransaction
  class Validate
    include Dry::Transaction::Operation

    def call(language_params)
      language = Language.new(language_params)

      if language.valid?
        Success(language_params)
      else
        Failure(language.errors)
      end
      # returns Success(valid_data) or Failure(validation)
    end
  end

  class Validaten
    include Dry::Transaction::Operation

    def call(language_params)
      if language_params[:name]=="123"
        Failure("Wrong name")
      else
        Success(language_params)
      end
      # returns Success(valid_data) or Failure(validation)
    end
  end

  class Create
    include Dry::Transaction::Operation

    def call(language_params)
      language = Language.create(language_params)
      Success(language)
      # returns Success(user)
    end
  end

  class Container
    extend Dry::Container::Mixin

    namespace "languages" do

      register "validate" do
        TestTransaction::Validate.new
      end

      register "validaten" do
        TestTransaction::Validaten.new
      end

      register "create" do
        TestTransaction::Create.new
      end
    end
  end
end

