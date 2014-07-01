class WelcomeController < ApplicationController
        require 'net/http'
        require 'uri'
        require 'json'
        require 'open-uri'

    def sendPostData
        username = 'recsy-team'
        password = 'SomeSeveral044'
        uri = URI('http://immense-escarpment-7957.herokuapp.com/admin/save-post')

        req = Net::HTTP::Post.new(uri.path)
        req.basic_auth username, password
        req.body = params
        
        
        res = Net::HTTP.new(uri.host, uri.port)
        res.start {|http|
           http.request(req)
        }
        @textToShow = res

    end

    def index


        uri = URI('http://immense-escarpment-7957.herokuapp.com/admin/')

        req = Net::HTTP::Get.new(uri.path)
        req.basic_auth 'recsy-team', 'SomeSeveral044'

        res = Net::HTTP.start(uri.hostname, uri.port) {|http|
           http.request(req)
        }





		#uri = URI('http://immense-escarpment-7957.herokuapp.com/admin/home.json')

		#req = Net::HTTP::Get.new(uri.path)
		#req.basic_auth 'recsy', 'recsy'

		#res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  		#	http.request(req)
		#}
		#@myResponse = res.body




=begin
uri = URI('http://hidden-caverns-8480.herokuapp.com/admin/save-post.json')


req = Net::HTTP::Post.new(uri.path)
req.basic_auth 'recsy-team', 'SomeSeveral044'

data = {
		"method" => "put",
		"post" => { "title" => "mytitleeee", "name" => "gjh", "content" => "hiiii" },
		"commit" => "Save",
		"ajax" => "true"
      }.to_json

req.content_type = 'application/json'
req.body = data
http = Net::HTTP.new(uri.host, uri.port)
@myResponse2 = http.start {|http| http.request(req) }
@myRequest = req.body
=end
=begin
uri = URI.parse("http://hidden-caverns-8480.herokuapp.com/admin/save-post")

# Full control
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Post.new(uri.request_uri)
request.basic_auth 'recsy-team', 'SomeSeveral044'
request.set_form_data({
        "method" => "put",
        "post" => { "title" => "mytitleeee", "name" => "gjh", "content" => "hiiii" },
        "commit" => "Save",
        "ajax" => "true"
      })

@myResponse2 = http.request(request)
=end
    username = "recsy-team"
    password = "SomeSeveral044"
    uri = URI('http://hidden-caverns-8480.herokuapp.com/admin/save-post')
req = Net::HTTP::Post.new(uri.path)
req.basic_auth username, password
data = {
"method" => "put",
"post" => { "title" => "mytitlklj;kjeeee", "name" => "gjh", "content" => "hiiii" },
"commit" => "Save",
"ajax" => "true"
}.to_json
req.content_type = 'application/json'
req.body = data
http = Net::HTTP.new(uri.host, uri.port)
@myResponse = http.start {|http| http.request(req) }

    #r = Request.new({:user => "username", :password => "password"})
    
    #response = RestClient.post 'http://hidden-caverns-8480.herokuapp.com/admin/join', :data => {name: "Marissa"}.to_json, :accept => :json, :user => "recsy-team", :password => "SomeSeveral044"
    #@myResponse2 = JSON.parse(response,:symbolize_names => true) 








        #uri = URI('http://hidden-caverns-8480.herokuapp.com/admin/save-post-json/put/jfklsdjflajs/mycontent')

        #req = Net::HTTP::Get.new(uri.path)
        #req.basic_auth 'recsy-team', 'SomeSeveral044'

        #res = Net::HTTP.start(uri.hostname, uri.port) {|http|
        #   http.request(req)
        #}
        #@myResponse2 = res


    end
    def plans

    end
    def about

    end
    def contact

    end
end
