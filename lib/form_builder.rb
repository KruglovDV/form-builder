# frozen_string_literal: true

require_relative "form_builder/version"
require_relative "form_builder/tag"

module FormBuilder
  class Error < StandardError; end
  class UnknownTagError < Error; end
end
