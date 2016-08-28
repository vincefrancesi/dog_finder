module Adapter
  class CoopersDream < Adapter::Base

    def dogs
      parse_dogs
    end

    private

    def page
      return @_page if @_page.present?
      response = HTTParty.get(url)
      @_page = Nokogiri::HTML(response.body)
    end

    def parse_dogs
      page.css('.wsite-multicol-col').inject([]) do |dogs, node|
        attrs = dog_attrs(node)
        if attrs[:name].present? && !attrs[:name].match(/adopted/i)
          dogs << attrs
        end

        dogs
      end
    end

    def dog_attrs(node)
      attrs = {}
      image_node = node.try(:css,'img[alt="Picture"]')
      attrs[:name]        = node.try(:css,'.accordion .accordion__item:first-child  .accordion__title .paragraph').try(:text).try(:titleize)
      attrs[:image_url]   = image_node.try(:attr, 'src').try(:value) if image_node.present?
      attrs[:description] = node.try(:css,'.accordion .accordion__content .paragraph').try(:text)

      attrs
    end

  end
end
