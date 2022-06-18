# frozen_string_literal: true

module HexletCode
  module FormRender
    class Input
      class << self
        def render(attrs)
          name = attrs[:name]
          label = Tag.build('label', for: name) { name.capitalize }
          input = if attrs[:as] == :text
                    Tag.build('textarea', **{ cols: 20, rows: 40, **attrs }.except(:as, :value)) do
                      attrs[:value]
                    end
                  else
                    Tag.build('input', **{ type: 'text', **attrs })
                  end
          "#{label}#{input}"
        end
      end
    end
  end
end
