module Wimdu
  class Cli < Thor
    include Helpers

    desc 'list', 'Lists existing properties'
    def list
      offers = Property.offers
      if offers.empty?
        say 'No properties found.'
      else
        say "Found #{offers.count} offer(s):"
        say
        offers.each do |offer|
          say "#{offer.slug}: #{offer.title}"
        end
      end
    end

    desc 'new', 'Creates new properties'
    def new
      slug = generate_property_slug
      property = Property.create(slug: slug)

      say "Starting with new property #{slug}."

      loop do
        property.awaits = 'title'
        property.title = ask('Title: ')
        if property.valid?
          property.save
          break
        else
          puts property.errors.full_messages
        end
      end

      loop do
        property.awaits = 'address'
        property.address = ask('Address: ')
        if property.valid?
          property.save
          break
        else
          puts property.errors.full_messages
        end
      end

      loop do
        property.awaits = 'rate'
        property.rate = ask('Nightly rate in EUR: ')
        if property.valid?
          property.save
          break
        else
          puts property.errors.full_messages
        end
      end

      loop do
        property.awaits = 'max_guests'
        property.max_guests = ask('Max guests: ')
        if property.valid?
          property.save
          break
        else
          puts property.errors.full_messages
        end
      end

      loop do
        property.awaits = 'email'
        property.email = ask('Email: ')
        if property.valid?
          property.save
          break
        else
          puts property.errors.full_messages
        end
      end

      loop do
        property.awaits = 'phone'
        property.phone = ask('Phone: ')
        if property.valid?
          property.save
          break
        else
          puts property.errors.full_messages
        end
      end
    end
  end
end
