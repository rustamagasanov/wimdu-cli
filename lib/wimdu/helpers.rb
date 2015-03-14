module Helpers
  def generate_property_slug
    loop do
      random_slug = SecureRandom.hex(5)[0..8].upcase
      break random_slug unless Property.exists?(slug: random_slug)
    end
  end

  def ask_for(property, attr)
    case attr
    when :title
      property.awaits = 'title'
      property.title = ask('Title: ')
    when :address
      property.awaits = 'address'
      property.address = ask('Address: ')
    when :rate
      property.awaits = 'rate'
      property.rate = ask('Nightly rate in EUR: ')
    when :max_guests
      property.awaits = 'max_guests'
      property.max_guests = ask('Max guests: ')
    when :email
      property.awaits = 'email'
      property.email = ask('Email: ')
    when :phone
      property.awaits = 'phone'
      property.phone = ask('Phone: ')
    else
    end

    if property.valid?
      property.save
    else
      puts property.errors.full_messages
      ask_for(property, attr)
    end
  end
end
