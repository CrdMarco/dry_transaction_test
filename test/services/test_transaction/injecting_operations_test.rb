require 'test_helper'

module TestTransaction
  class InjectingOperationsTest < ActiveSupport::TestCase
    include Dry::Monads::Result::Mixin

    def setup
    end


    test "Injecting operations" do

      currency = Currency.first

      prepare = -> input { Success(input.merge(name: "#{input[:name]}!!")) }
      validate  = -> input { Failure([:could_not_create, input]) }

      create_language = TestTransaction::InjectingOperations.new(prepare: prepare, validate: validate)

      params = {name: "1234", currency: currency}

      assert_equal  Failure([:could_not_create, {name: "#{params[:name]}!!", currency: params[:currency]}]), create_language.call(params)

    end



  end
end
