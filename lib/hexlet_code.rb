# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'

  class Error < StandardError; end
  class UnknownTagError < Error; end

  class << self
    def form_for(entity, url: '#')
      form = Form.new(entity)
      yield form if block_given?
      Tag.build('form', action: url, method: 'post') do
        form.schema.empty? ? '' : render_fields(form)
      end
    end

    private

    TYPE_TO_RENDER = {
      input: ->(field) { Tag.build('input', **field[:attrs]) },
      text: lambda do |field|
        value = field[:attrs][:value]
        attrs = field[:attrs].except :value
        Tag.build('textarea', **attrs) { value }
      end,
      label: lambda do |field|
        value = field[:attrs][:value].capitalize
        attrs = field[:attrs].except :value
        Tag.build('label', **attrs) { value }
      end,
      submit: ->(field) { Tag.build('input', **field[:attrs]) }
    }.freeze

    def render_fields(form)
      form.schema.map do |field|
        type = field[:type]
        render = TYPE_TO_RENDER[type]

        raise UnknownTagError, "Unknown tag #{type}" if render.nil?

        render.call(field)
      end.join
    end
  end
end
