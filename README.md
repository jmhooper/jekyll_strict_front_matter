[![Gem Version](https://badge.fury.io/rb/jekyll_strict_front_matter.svg)](https://badge.fury.io/rb/jekyll_strict_front_matter)

**This feature is now available in Jekyll 3.5.0 and later by adding `strict_front_matter: true` to `_config.yml`.**

By default, if a page or a post in a Jekyll site has a syntax error in the front matter, Jekyll logs an error, does not render anything for the given document, and continues. The result is a site without any content for the page with the syntax errors.

This can be confusing for people who build sites without looking at the CLI, such as those of us whose sites build in a CI. In these cases, we may wish for our build to fail if there are front matter syntax errors. [This PR](https://github.com/jekyll/jekyll/pull/5832/files) seeks to add a config option for that, but in the meantime this plugin exists to fill the gap. This plugin may also be used to add the option to sites using an older version of Jekyll.

# Using the plugin

To use this plugin, first add the plugin to your Gemfile and run `bundle install`.

```ruby
group :jekyll_plugins do
  gem "jekyll_strict_front_matter"
end
```

Next, enable `strict_front_matter` by adding the option to your `_config.yml`:

```yaml
strict_front_matter: true
```

Now, a syntax error in the YAML should raise an error, stop the build, and result in a non-zero exit code.
