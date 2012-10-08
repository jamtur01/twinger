require 'net/http'
require 'json'

class Twinger
  def initialize(user)
    output = JSON.parse(Net::HTTP.get 'api.twitter.com', "/1/users/show.json?screen_name=#{user}")
    if output.has_key?("errors")
      puts "The Twitter user doesn't exist or an error has occured."
    else
      finger = "[#{output['screen_name']}@twitter.com]\n" \
             "User\tReal Name\tWhat\n" \
             "#{output['screen_name']}\t#{output['name']}\t#{output['description']}\n"
      puts finger
    end
  end
end
