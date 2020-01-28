module TestTransaction

  NOTIFICATIONS = []

  class CreateStepNotifications
    include Dry::Transaction

    step :validate
    step :create

    private

    def validate(input)
      Success(input)
    end

    def create(input)
      Success(input)
    end
  end

  module NotificationsCreationListener
    extend self

    def on_step(event)
      language = event[:args][0]
      NOTIFICATIONS << "Started creation of #{language[:email]}"
    end

    def on_step_succeeded(event)
      language = event[:value]
      NOTIFICATIONS << "#{language[:email]} created"
    end

    def on_step_failed(event)
      language = event[:value]
      NOTIFICATIONS << "#{language[:email]} creation failed"
    end

  end


end
