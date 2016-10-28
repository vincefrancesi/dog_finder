module Adapter
  class NorcalGoldenRescue < Adapter::Base

    def dogs
      parse_dogs(xpath: '/html/body/table/tr[3]/td/table/tr[2]/td/table/tr[2]/td/table//table')
    end

    def dog_attrs(node)
      attrs = {}
      return attrs unless dog_available?(node)

      attrs[:name]        = dog_name(node)
      attrs[:image_url]   = node.xpath('tr/td/a/img').first.try(:attr, 'src')
      attrs[:url]         = node.xpath('tr/td/a').first.try(:attr, 'href')

      if attrs[:image_url].present? && !attrs[:image_url].match(/^http/i)
        base_uri = URI(url)
        attrs[:image_url] = "#{base_uri.scheme}://#{base_uri.host}/#{attrs[:image_url]}"
      end

      return attrs
    end

    private

    def dog_name(node)
      name_node = node.xpath('tr/td').first.children.detect { |node| node.text? && node.text.match(/^Name\:/).present? }
      return nil if name_node.blank?

      name_node.text.gsub(/^Name\:\s/, '')
    end

    def dog_available?(node)
      node.text.match(/Status\: Available/).present?
    end

  end
end
