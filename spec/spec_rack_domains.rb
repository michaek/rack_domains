require File.join(File.dirname(__FILE__), 'spec_helper')

describe Rack::Domains do
  
  it "should send the process to the right app" do
    app = Rack::Builder.new do
      use Rack::Lint
      use Rack::Domains, {"app1" => TestApp.new}
      run TestApp404.new
    end

    response = Rack::MockRequest.new(app).get('/', {'SERVER_NAME' => "app1"})
    response.body.should == 'Hello, World!'
    response.status.should == 200

    response = Rack::MockRequest.new(app).get('/', {'SERVER_NAME' => "app2"})
    response.status.should == 404
  end

  it "should match domains with regular expressions" do
    app = Rack::Builder.new do
      use Rack::Lint
      use Rack::Domains do
        map /^app.*$/, TestApp.new
      end
      run TestApp404.new
    end
    response = Rack::MockRequest.new(app).get('/', {'SERVER_NAME' => "app1"})
    response.body.should == 'Hello, World!'
    response.status.should == 200

    response = Rack::MockRequest.new(app).get('/', {'SERVER_NAME' => "bpp1"})
    response.status.should == 404
  end
  
end