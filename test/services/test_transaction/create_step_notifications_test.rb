require 'test_helper'

module TestTransaction
  class CreateStepNotificationsTest < ActiveSupport::TestCase
    include Dry::Monads::Result::Mixin

    def setup
    end

    def teardown
    end


    test "step notification" do
      create_step = TestTransaction::CreateStepNotifications.new
      create_step.subscribe(create: TestTransaction::NotificationsCreationListener)

      params = {name: "Jane", email: "jane@doe.com"}

      create_step.call(params)

      expected = [
        "Started creation of #{params[:email]}",
        "#{params[:email]} created"
      ]

      assert (expected & TestTransaction::NOTIFICATIONS).size == expected.size
    end

    test "step notification failed" do
      validate  = -> input { Failure(input) }

      create_step = TestTransaction::CreateStepNotifications.new(validate: validate)


      create_step.subscribe(validate: TestTransaction::NotificationsCreationListener)

      params = {name: "Jon", email: "Jon@doe.com"}

      create_step.call(params)

      expected = [
        "Started creation of #{params[:email]}",
        "#{params[:email]} creation failed"
      ]

      assert (expected & TestTransaction::NOTIFICATIONS).size == expected.size
    end



  end
end
