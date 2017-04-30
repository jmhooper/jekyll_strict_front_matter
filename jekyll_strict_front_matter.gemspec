Gem::Specification.new do |s|
  s.name        = 'jekyll_strict_front_matter'
  s.version     = '0.1.1'
  s.date        = '2017-04-30'
  s.summary     = "A jekyll plugin for raising for YAML front matter syntax errors"
  s.description = <<-EOL
    By default, if a page or a post in a Jekyll site has a syntax error in the
    front matter, Jekyll logs an error, does not render anything for the given
    page, and continues. The result is a site without any content for the
    page with the syntax error.

    This can be confusing for people who build sites without looking at the CLI,
    such as those of us whose sites build in a CI. In these cases, we may wish
    for our build to fail if there are front matter syntax errors.
    [This PR](https://github.com/jekyll/jekyll/pull/5832/files) seeks to add a
    config option for that, but in the meantime this plugin exists to fill the
    gap. This plugin may also be used to add the option to sites using an older
    version of Jekyll.
  EOL
  s.authors     = ["Jonathan Hooper"]
  s.email       = "jon9820@gmail.com"
  s.files       = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.homepage    = "http://rubygems.org/gems/jekyll-strict-front-matter"
  s.license     = 'MIT'

  s.add_runtime_dependency "jekyll", ">= 2.5.0"
end
