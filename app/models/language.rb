class Language < ApplicationRecord
  INTERFACE_LANGUAGE_CODES = ['en', 'it', 'ru', 'es', 'fr', 'de', 'pl', 'pt'].freeze
  belongs_to :currency

  scope :non_english, -> { where.not(code: 'en') }

  def self.interface_languages
    Language.where(code: INTERFACE_LANGUAGE_CODES)
  end

  def self.english
    @english ||= find_by(code: 'en')
  end

  def english?
    self.code == 'en'
  end

  def interface_language?
    INTERFACE_LANGUAGE_CODES.include? self.code
  end



end
