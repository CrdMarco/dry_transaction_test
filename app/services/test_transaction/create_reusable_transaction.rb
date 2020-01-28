module TestTransaction
  class CreateReusableTransaction
    include TestTransaction::ReusableModule::Transaction

    # Operations will be resolved from the `Container` specified above
    step :validate, with: "languages.validate"
    step :validaten, with: "languages.validaten"
    step :create, with: "languages.create"
  end
end
