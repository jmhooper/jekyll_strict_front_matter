require "rspec"
require "jekyll"

require_relative "../lib/jekyll_strict_front_matter.rb"

DEFAULT_CONFIG = {
  quiet: true,
  source: File.join(Dir.pwd(), "spec", "source"),
  destination: File.join(Dir.pwd(), "tmp", "_site"),
}

buffer = StringIO.new
Jekyll.logger = Logger.new(buffer)

describe "jekyll strict front matter option" do
  def site_config(overrides)
    Jekyll.configuration(DEFAULT_CONFIG.merge(overrides))
  end

  context "enabled" do
    it "should raise if the site has syntax errors" do
      config = site_config(
        strict_front_matter: true,
        collections: %w( broken_collection ),
      )
      site = Jekyll::Site.new(config)
      expect { site.process }.to raise_error(Jekyll::StrictFrontMatterError)
    end

    it "should not raise if the site does not have syntax errors" do
      config = site_config(
        strict_front_matter: true,
        collections: %w( collection ),
      )
      site = Jekyll::Site.new(config)
      expect { site.process }.not_to raise_error
    end
  end

  context "disabled" do
    it "should not raise if the site has syntax errors" do
      config = site_config(
        strict_front_matter: false,
        collections: %w( broken_collection ),
      )
      site = Jekyll::Site.new(config)
      expect { site.process }.not_to raise_error
    end

    it "should not raise if the site does not have syntax errors" do
      config = site_config(
        strict_front_matter: true,
        collections: %w( collection ),
      )
      site = Jekyll::Site.new(config)
      expect { site.process }.not_to raise_error
    end
  end
end
