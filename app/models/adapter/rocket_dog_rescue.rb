module Adapter
  class RocketDogRescue < Adapter::Base

    def dogs
      parse_dogs(css: 'ul.dog-list li')
    end

    def dog_attrs(node)
      attrs = {}

      attrs[:name] = node.css('h3').first.text
      attrs[:image_url] = node.css('img').first.attr('src')

      return attrs
    end

  end
end
