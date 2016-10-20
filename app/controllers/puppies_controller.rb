class PuppiesController < ApplicationController

  def index
    @websites = Website.includes(:puppies).all
  end

end
