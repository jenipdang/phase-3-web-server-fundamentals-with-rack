require 'rack'
require 'pry'

class App
  def call(env)
    path = env["PATH_INFO"]

    if path == "/"
      [200, { "Content-Type" => "text/html" }, ["<h2>Hello <em>World</em>!</h2>"]]
    elsif path == "/potato"
      [200, { "Content-Type" => "text/html" }, ["<p>Boil 'em, mash 'em, stick 'em in a stew</p>"]]
    else
      [404, { "Content-Type" => "text/html" }, ["Page not found"]]
    end
  end
end

#http://localhost:9292/
#http://localhost:9292/potato
#http://localhost:9292/home

#This conditional logic based on the path (and also the HTTP verb, as we'll see later) is known as routing, and it's is basically what web servers do all day long. Rails, Sinatra, any web programming framework you can name: one of their key features is to simplify and standardize how routing works so we can focus on working with data and generating responses

run App.new