Pod::Spec.new do |s|
  s.name = "Inflection"
  s.version = "0.2.1"
  s.summary = "The Optimus Prime of string inflection"
  s.description = <<-DESC
                   * The Optimus Prime of string inflection
                   DESC
  s.homepage = "https://github.com/zenangst/Inflection"
  s.license = {
    :type => 'MIT',
    :file => 'LICENSE.md'
  }
  s.author = { "Christoffer Winterkvist" => "christoffer@winterkvist.com" }
  s.social_media_url = "https://twitter.com/zenangst"
  s.platform = :ios, '6.0'
  s.source = {
    :git => 'https://github.com/zenangst/Inflection.git',
    :tag => s.version.to_s
  }
  s.source_files = 'Source/*.*'
  s.frameworks = 'Foundation'
  s.requires_arc = true
end
