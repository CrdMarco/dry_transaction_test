require 'test_helper'

module TestTransaction
  class CreateReusableTransactionTest < ActiveSupport::TestCase

    def setup
    end

    test "case 1" do
      currency = Currency.first
      test = TestTransaction::CreateReusableTransaction.new.call({name: "123"})

      assert_not test.success?
    end

    test "case 2" do
      currency = Currency.first
      test = TestTransaction::CreateReusableTransaction.new.call({name: "123", currency: currency})

      assert_not test.success?
    end

    test "case 3" do
      currency = Currency.first
      test = TestTransaction::CreateReusableTransaction.new.call({name: "1234", currency: currency})



      assert test.success?
    end

    test "Calling a correct transaction" do

      currency = Currency.first

      assert_equal test_call({name: "new_test_1234", currency: currency}), Language.find_by(name: "new_test_1234")

    end

    test "Calling a correct transaction failing validate" do
      validation = test_call(name: "123")

      assert_equal validation.messages, {:currency=>["must exist"]}
    end

    test "Calling a correct transaction failing validaten" do
      currency = Currency.first

      validation = test_call({name: "123", currency: currency})

      assert_equal validation, "Wrong name"
    end





    private

    def test_call(params)
      create_transaction = TestTransaction::CreateReusableTransaction.new
      create_transaction.call(params) do |m|

        m.success do |language|
          # puts "------> Created language for #{language.name}!"
          language
        end

        m.failure :validate do |validation|
          # Runs only when the transaction fails on the :validate step
          # puts "------> Please provide a valid language."
          validation
        end

        m.failure :validaten do |validation|
          # Runs only when the transaction fails on the :validate step
          # puts "------> Please provide a valid name."
          validation
        end

        m.failure do |error|
          # Runs for any other failure
          puts "------> Couldn’t create this language."
          error
        end
      end
    end



  end
end
