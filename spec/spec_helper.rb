require 'rubygems'
require 'rack'
require 'rack_domains'

class TestApp
  def call(env)
    response = "Hello, World!"
    ["200", {'Content-Type' => 'text/plain', 'Content-Length' => response.length.to_s}, [response]]
  end
end

class TestApp404
  def call(env)
    response = "Bye, World!"
    ["404", {'Content-Type' => 'text/plain', 'Content-Length' => response.length.to_s}, [response]]
  end
end
