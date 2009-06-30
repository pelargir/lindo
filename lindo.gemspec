Gem::Specification.new do |s|
  s.name     = "lindo"
  s.version  = "0.6"
  s.date     = "2009-06-30"
  s.summary  = "Enables rendering of the body of an HTTP response from inside a functional test."
  s.email    = "contact@adeptware.com"
  s.homepage = "http://github.com/adeptware/lindo"
  s.description = "Enables rendering of the body of an HTTP response from inside a functional test. " <<
                  "This makes it easy to diagnose problems when building assert_select statements " <<
                  "or just sanity check the output of the test."
  s.has_rdoc = true
  s.authors  = ["Adeptware"]
  s.files    = [
    "CHANGELOG",
    "MIT-LICENSE",
    "Rakefile",
		"README",
		"lindo.gemspec",
		"lib/lindo.rb",
		"lib/lindo/browser.rb",
		"test/lindo_test.rb",
		"test/lindo/browser_test.rb"
		]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
end
