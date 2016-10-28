module Adapter
  class GratefulDogRescue < Adapter::Base

    def dogs
      parse_dogs(css: '.pet')
    end

    def dog_attrs(node)
      attrs = {}

      attrs[:name] = node.css('.name').first.text
      attrs[:image_url] = node.css('img').first.attr('src')
      attrs[:url] = node.css('a').first.try(:attr, 'href')

      return attrs
    end

  end
end
