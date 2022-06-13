# frozen_string_literal: true

require_relative 'input'
require_relative 'submit'

module HexletCode
  class Form
    class << self
      def render(schema)
        form_attrs = schema[:attrs]
        form_attrs[:action] = form_attrs.delete :url if form_attrs[:url]
        prepared_attrs = { action: '#', method: 'post' }.merge(form_attrs)
        Tag.build('form', **prepared_attrs) do
          schema[:children].map { |child| HexletCode.const_get(child[:type]).render(child[:attrs]) }.join
        end
      end
    end
  end
end
