class Final
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def upload(username,access_key)

    string = %x{curl -u "#{username}:#{access_key}" -X POST "https://api-cloud.browserstack.com/app-automate/upload" -F "file=#{@path}" }
    url = JSON.parse(string)
    return url['app_url'] 
  end


end