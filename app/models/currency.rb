class Currency < ApplicationRecord

  enum pos: {
    left: 0,
    right: 1
  }

  def self.euro
    Currency.find_by(code: 'EUR')
  end

  def euro?
    code == 'EUR'
  end

end
