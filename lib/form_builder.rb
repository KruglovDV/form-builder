# frozen_string_literal: true

require_relative "form_builder/version"
require_relative "form_builder/tag"

module FormBuilder
  class Error < StandardError; end
  class UnknownTagError < Error; end

  class << self
    def from_for(entity, url: "#")
      Tag.build "form", action: url, method: "post"
    end
  end
end
