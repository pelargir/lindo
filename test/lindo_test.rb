require 'test/unit'
require 'fileutils'

require 'rubygems'
require 'mocha'

RAILS_ROOT = '.'
require 'lindo'

class LindoTest < Test::Unit::TestCase
  
  # class Response
  #   attr_accessor :body
  # end
  # 
  # def test_foo
  #   response = Response.new
  #   response.body = "<html>FOO</html>"
  #   @response = response
  #   vr(:html)
  # end
  
  def setup
    @response = stub(:body => "<html></html>")
  end
  
  def test_vr
    File.expects(:open).with(RESPONSE_HTML, File::CREAT|File::TRUNC|File::WRONLY)
    Browser.expects(:open).with("./tmp/lindo/response.html")
    vr
  end
  
  def test_vr_in_web
    File.expects(:open).with(RESPONSE_HTML, File::CREAT|File::TRUNC|File::WRONLY)
    Browser.expects(:open).with("./tmp/lindo/response.html")
    vr(:web)
  end
  
  def test_vr_in_html
    File.expects(:open).with(RESPONSE_TXT, File::CREAT|File::TRUNC|File::WRONLY)
    Browser.expects(:open).with("./tmp/lindo/response.txt")
    vr(:html)
  end
  
  def test_vr_with_raw_html
    File.expects(:open).with(RESPONSE_HTML, File::CREAT|File::TRUNC|File::WRONLY)
    Browser.expects(:open).with("./tmp/lindo/response.html")
    vr("<html></html>")
  end
  
end
