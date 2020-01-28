# standard
module TestTransaction
  require "dry/transaction"

  class CreateLanguage
    include Dry::Transaction

    step :validate
    step :create

    private

    def validate(language_params)
      # returns Success(valid_data) or Failure(validation)
      language = Language.new(language_params)

      if language.valid?
        Success(language_params)
      else
        Failure(language.errors)
      end

    end

    def create(language_params)
      # returns Success(user)
      language = Language.create(language_params)
      Success(language)
    end
  end
end
