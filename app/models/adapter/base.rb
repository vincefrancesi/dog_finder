module Adapter
  class Base
    attr_accessor :url

    def initialize(url)
      @url = URI.encode(url).to_s
    end

    def page
      return @_page if @_page.present?
      response = HTTParty.get(url)
      @_page = Nokogiri::HTML(response.body)
    end

    def parse_dogs(css: nil, xpath: nil)
      results = (css.present? ? page.css(css) : page.xpath(xpath))

      results.inject([]) do |dogs, node|
        attrs = dog_attrs(node)

        if attrs[:name].present?
          dogs << attrs
        end

        dogs
      end
    end

  end
end
