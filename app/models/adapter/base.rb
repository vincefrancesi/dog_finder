module Adapter
  class Base
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    def page
      return @_page if @_page.present?
      response = HTTParty.get(url)
      @_page = Nokogiri::HTML(response.body)
    end

    def parse_dogs(selector)
      page.css(selector).inject([]) do |dogs, node|
        attrs = dog_attrs(node)

        if attrs[:name].present?
          dogs << attrs
        end

        dogs
      end
    end

  end
end
