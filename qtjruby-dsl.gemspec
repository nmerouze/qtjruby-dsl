Gem::Specification.new do |s|
  s.description = "Qt meets Java meets Ruby."
  s.files = ["LICENSE",
 "README.textile",
 "Rakefile",
 "lib/qtjruby-dsl",
 "lib/qtjruby-dsl.rb",
 "lib/qtjruby-dsl/builder.rb",
 "lib/qtjruby-dsl/qt",
 "lib/qtjruby-dsl/qt.rb",
 "lib/qtjruby-dsl/qt/ext",
 "lib/qtjruby-dsl/qt/ext/video_player.rb",
 "lib/qtjruby-dsl/qt/ext/web_view.rb"]
  s.rubygems_version = "1.2.0"
  s.platform = "ruby"
  s.date = "Wed Aug 06 00:00:00 +0200 2008"
  s.homepage = "http://qtjruby.org"
  s.add_dependency "qtjruby-core", ">= 0.2.1, runtime"
  s.bindir = "bin"
  s.summary = "Qt meets Java meets Ruby."
  s.specification_version = "2"
  s.email = "nicolas.merouze@gmail.com"
  s.version = "0.2.1"
  s.required_rubygems_version = ">= 0"
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 0"
  s.has_rdoc = "false"
  s.name = "qtjruby-dsl"
  s.authors = ["Nicolas Merouze"]
  s.loaded = "false"
end