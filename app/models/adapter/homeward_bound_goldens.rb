module Adapter
  class HomewardBoundGoldens < Adapter::Base

    def dogs
      parse_dogs(css: '.person')
    end

    def dog_attrs(node)
      attrs = {}
      image_node = node.try(:css,'img.person-img')

      attrs[:name]        = node.try(:css,'.person-name').try(:text)
      attrs[:image_url]   = image_node.try(:attr, 'src').try(:value) if image_node.present?
      attrs[:description] = node.try(:css,'.person-description').try(:text)

      if attrs[:name] && attrs[:name].match(/adopted/i)
        attrs[:name] = nil
      end

      if attrs[:image_url].present? && !attrs[:image_url].match(/^http/i)
        base_uri = URI(url)
        attrs[:image_url] = "#{base_uri.scheme}:#{attrs[:image_url]}"
      end

      attrs
    end

  end
end
