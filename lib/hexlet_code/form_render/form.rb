# frozen_string_literal: true

module HexletCode
  module FormRender
    autoload :Input, 'hexlet_code/form_render/input'
    autoload :Submit, 'hexlet_code/form_render/submit'
    autoload :Text, 'hexlet_code/form_render/text'
    autoload :Label, 'hexlet_code/form_render/label'

    class Form
      class << self
        def render(schema)
          form_attrs = schema[:attrs]
          action = form_attrs.fetch(:url, '#')
          prepared_attrs = { action: action, method: 'post', **form_attrs.except(:url) }
          Tag.build('form', **prepared_attrs) do
            schema[:children].map { |child| HexletCode::FormRender.const_get(child[:type]).render(child[:attrs]) }.join
          end
        end
      end
    end
  end
end
