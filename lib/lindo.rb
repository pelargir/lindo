require 'test/unit'
require 'lindo/browser'

module Lindo
  ASSETS = %w(images stylesheets javascripts)

  def vr(format=:web)
    create_tmp_dir
    copy_assets
    if format.is_a?(Symbol)
      case format
        when :web  then open_from_file(@response.body, response_html)
        when :html then open_from_file(@response.body, response_txt)
      end
    else
      open_from_file(format, response_html)
    end
  end
  
  def create_tmp_dir
    FileUtils.rm_r(tmp_dir) if File.exists?(tmp_dir)
    FileUtils.mkdir_p(tmp_dir)
  end
  
  def copy_assets
    ASSETS.each do |e|
      dir = File.join(::Rails.root, "public", e)
      FileUtils.cp_r(dir, tmp_dir) if File.exists?(dir)
    end
  end

  def open_from_file(data, file)
    scrub(data)
    File.open(file, File::CREAT|File::TRUNC|File::WRONLY) { |f| f << data }
    Browser.open(file)
  end
  
  def scrub(data)
    ASSETS.each { |e| data.gsub!("=\"/#{e}/", "=\"#{e}/") }
  end
  
  def tmp_dir
    File.join(::Rails.root, "tmp", "lindo")
  end
  
  def response_txt
    File.join(tmp_dir, "response.txt")
  end
  
  def response_html
    File.join(tmp_dir, "response.html")
  end
end

Test::Unit::TestCase.send(:include, Lindo)
