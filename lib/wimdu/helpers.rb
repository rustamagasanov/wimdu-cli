module Helpers
  def generate_property_slug
    loop do
      random_slug = SecureRandom.hex(5)[0..8].upcase
      break random_slug unless Property.exists?(slug: random_slug)
    end
  end
end
