module Jekyll
  class StrictFrontMatterError < StandardError
  end

  Hooks.register :documents, :post_init do |document|
    if !document.site.config["strict_front_matter"]
      next
    end

    contents = File.read(document.path)

    match_data = Document::YAML_FRONT_MATTER_REGEXP.match(contents)
    if match_data
      yaml = match_data[1]
      begin
        SafeYAML.load(yaml)
      rescue => e
        Jekyll.logger.error "Error:", "YAML Exception reading #{document.path}: #{e.message}"
        raise StrictFrontMatterError
      end
    end
  end
end
