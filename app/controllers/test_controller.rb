class TestController < ActionController::Base
  def index
    @a="pippo"

    # Language.create!({id: 1, name: 'ITALIANO', code: 'it', flag_code: 'it', display_name: 'Italiano', currency_id: @euro.id})

    @b = ::TestTransaction::CreateLanguage.new.call({name: 'ITALIANO', code: 'it', flag_code: 'it', display_name: 'Italiano', currency_id: @euro.id})


  end
end
