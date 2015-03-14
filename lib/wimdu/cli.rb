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
      property.remaining_fields.each { |field| ask_for(property, field) }
      say "Great job! Listing #{property.slug} is complete!"
    end

    desc 'continue', 'Continues property creation'
    def continue(slug)
      property = Property.find_by(slug: slug)

      if property.nil?
        say "Such property doesn't exist"
        return
      end

      remaining_fields = property.remaining_fields
      if remaining_fields.empty?
        say 'This property is already completed.'
      else
        remaining_fields.each { |field| ask_for(property, field) }
        say "Great job! Listing #{property.slug} is complete!"
      end
    end
  end
end
