class Property < ActiveRecord::Base
  attr_writer :awaits

  validates :slug, presence: true
  validates :title, presence: true, if: -> { awaits?('title') }
  validates :address, presence: true, if: -> { awaits?('address') }
  validates :rate, presence: true, numericality: true, if: -> { awaits?('rate') }
  validates :max_guests, presence: true, numericality: true, if: -> { awaits?('max_guests') }
  validates :email, presence: true, email: true, if: -> { awaits?('email') }
  validates :phone, presence: true, phone: true, if: -> { awaits?('phone') }

  def awaits?(attr)
    @awaits == attr
  end

  class << self
    def offers
      where.not(slug: nil, title: nil, address: nil,
        rate: nil, max_guests: nil, email: nil, phone: nil)
    end
  end
end
