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

      ask_for(property, :title)
      ask_for(property, :address)
      ask_for(property, :rate)
      ask_for(property, :max_guests)
      ask_for(property, :email)
      ask_for(property, :phone)

      say "Great job! Listing #{property.slug} is complete!"
    end

    desc 'continue', 'Continues property creation'
    def continue(slug)
      property = Property.find_by(slug: slug)

      remaining_fields = property.remaining_fields

      if remaining_fields.empty?
        say 'This property is already completed.'
      else
        remaining_fields.each do |field|
          ask_for(property, field)
        end

        say "Great job! Listing #{property.slug} is complete!"
      end
    end
  end
end
