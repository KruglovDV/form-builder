# frozen_string_literal: true

module HexletCode
  module FormRender
    class Submit
      class << self
        def render(attrs)
          Tag.build('input', **{ name: 'commit', type: 'submit', value: 'Save', **attrs })
        end
      end
    end
  end
end
