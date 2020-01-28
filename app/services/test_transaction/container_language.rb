module TestTransaction
  class ContainerLanguage
    include Dry::Transaction(container: Container)

    step :validate, with: "languages.validate"
    step :validaten, with: "languages.validaten"
    step :create, with: "languages.create"


    # private


    # Wrapping operations

    # def validaten(input)
    #   input[:name] = "1234"
    #   super(input)
    # end
  end
end
