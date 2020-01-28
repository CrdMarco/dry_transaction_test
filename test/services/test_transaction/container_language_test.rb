require 'test_helper'

module TestTransaction
  class ContainerLanguageTest < ActiveSupport::TestCase
    def setup
    end

    test "case 1" do
      currency = Currency.first
      test = TestTransaction::ContainerLanguage.new.call({name: "123"})

      assert_not test.success?
    end

    test "case 2" do
      currency = Currency.first
      test = TestTransaction::ContainerLanguage.new.call({name: "123", currency: currency})

      assert_not test.success?
    end

    test "case 3" do
      currency = Currency.first
      test = TestTransaction::ContainerLanguage.new.call({name: "1234", currency: currency})

      assert test.success?
    end





  end
end
