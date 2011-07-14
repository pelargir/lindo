require 'test/unit'
require 'lindo/browser'

module Lindo
  TMP = File.join(Rails.root, "tmp", "lindo")
  RESPONSE_TXT = File.join(TMP, "response.txt")
  RESPONSE_HTML = File.join(TMP, "response.html")
  ASSETS = %w(images stylesheets javascripts)

  def vr(format=:web)
    create_tmp_dir
    copy_assets
    if format.is_a?(Symbol)
      case format
        when :web  then open_from_file(@response.body, RESPONSE_HTML)
        when :html then open_from_file(@response.body, RESPONSE_TXT)
      end
    else
      open_from_file(format, RESPONSE_HTML)
    end
  end
  
  def create_tmp_dir
    FileUtils.rm_r(TMP) if File.exists?(TMP)
    FileUtils.mkdir_p(TMP)
  end
  
  def copy_assets
    ASSETS.each do |e|
      dir = File.join(Rails.root, "public", e)
      FileUtils.cp_r(dir, TMP) if File.exists?(dir)
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
end

Test::Unit::TestCase.send(:include, Lindo)
