# frozen_string_literal: true

require_relative "form_builder/version"

module FormBuilder
  autoload :Tag, "form_builder/tag"
  autoload :Form, "form_builder/form"

  class Error < StandardError; end
  class UnknownTagError < Error; end

  class << self
    def from_for(entity, url: "#")
      form = Form.new(entity)
      yield form
      Tag.build("form", action: url, method: "post") do
        form.schema.empty? ? "" : render_fields(form)
      end
    end

    private

    def render_fields(form)
      form.schema.map do |field|
        case field[:type]
        when :input
          Tag.build("input", **field[:attrs])
        when :text
          value = field[:attrs][:value]
          attrs = field[:attrs].except :value
          Tag.build("textarea", **attrs) { value }
        when :label
          value = field[:attrs][:value].capitalize
          attrs = field[:attrs].except :value
          Tag.build("label", **attrs) { value }
        when :submit
          Tag.build("input", **field[:attrs])
        else
          raise UnknownTagError, "Unknown tag #{field[:type]}"
        end
      end.join("")
    end
  end
end
