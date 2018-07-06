require 'rest-client'

class BingExample
# Type in any input when you make your call and the method will sub it into the URL for you
  def initialize(input)
    @query = input
    @url = "https://www.bing.com/search?q=#{@query.gsub(/\s/, "+")}"
  end
# This makes the GET request and populates the other variables
  def response
    @search = RestClient.get @url
    @status_code = @search.code
    return output
  end
# Not pretty, but it returns the body of text from the GET request.
  def output
    if @status_code.to_i == 200
      puts @search.body
    else
      puts status_code
    end
  end
end
BingExample.new("kitten").response
