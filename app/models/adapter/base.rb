module Adapter
  class Base
    attr_accessor :url

    def initialize(url)
      @url = url
    end

  end
end
