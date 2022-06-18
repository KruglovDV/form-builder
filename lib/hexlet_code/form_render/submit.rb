# frozen_string_literal: true

module HexletCode
  module FormRender
    class Submit
      class << self
        def render(attrs)
          value = attrs.fetch(:name, 'Save')
          Tag.build('input', **{ name: 'commit', type: 'submit', value: value, **attrs })
        end
      end
    end
  end
end
