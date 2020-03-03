class Background
  attr_reader :id,
              :owner,
              :secret,
              :server,
              :farm,
              :title

  def initialize(data)
    @id = data[:id]
    @owner = data[:owner]
    @secret = data[:secret]
    @server = data[:server]
    @farm = data[:farm]
    @title = data[:title]
  end

  def img_url
    "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
  end
end