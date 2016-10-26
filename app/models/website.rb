class Website < ApplicationRecord
  has_many :puppies

  def self.update_all_puppies
    all.each &:update_puppies
  end

  def update_puppies
    adapter = load_adapter
    dogs = adapter.dogs
    dogs.each do |dog|
      name      = dog[:name]
      image_url = dog[:image_url]

      puppy = puppies.where(name: name).first_or_create(image_url: image_url)
      puppy.update(description: dog[:description])
    end
    dog_names = dogs.collect { |d| d[:name] }

    puppies.where.not(name: dog_names).delete_all

    puppies
  end

  private

  def load_adapter
    return @_adapter if @_adapter.present?

    klass = adapter.constantize
    @_adapter ||= klass.new(url)
  end


end
