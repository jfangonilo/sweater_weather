class BackgroundFacade
  attr_reader :id

  def initialize(location)
    @location = location
    @id = nil
  end

  def url
    background_collection.sample.img_url
  end

  def background_collection
    service.backgrounds[:photos][:photo].map do |data|
      Background.new(data)
    end
  end

  def service
    @service ||= FlickrService.new(@location)
  end
end