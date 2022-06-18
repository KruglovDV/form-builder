# frozen_string_literal: true

module HexletCode
  module FormRender
    class Text
      class << self
        def render(attrs)
          Label.render(attrs[:name]) do
            Tag.build('textarea', **{ cols: 20, rows: 40, **attrs }.except(:as, :value)) do
              attrs[:value]
            end
          end
        end
      end
    end
  end
end
