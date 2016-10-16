module Adapter
  class CoopersDream < Adapter::Base

    def dogs
      parse_dogs(css: '.wsite-multicol-col')
    end

    def dog_attrs(node)
      attrs = {}
      image_node = node.try(:css,'img[alt="Picture"]')
      attrs[:name]        = node.try(:css,'.accordion .accordion__item:first-child  .accordion__title .paragraph').try(:text).try(:titleize)
      attrs[:image_url]   = image_node.try(:attr, 'src').try(:value) if image_node.present?
      attrs[:description] = node.try(:css,'.accordion .accordion__content .paragraph').try(:text)

      if attrs[:name] && attrs[:name].match(/adopted/i)
        attrs[:name] = nil
      end

      if attrs[:image_url].present? && !attrs[:image_url].match(/^http/i)
        base_uri = URI(url)
        attrs[:image_url] = "#{base_uri.scheme}://#{base_uri.host}#{attrs[:image_url]}"
      end

      attrs
    end

  end
end
