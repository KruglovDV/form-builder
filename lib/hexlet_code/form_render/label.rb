# frozen_string_literal: true

module HexletCode
  module FormRender
    class Label
      class << self
        def render(name)
          label = Tag.build('label', for: name) { name.capitalize }
          element = yield if block_given?
          "#{label}#{element}"
        end
      end
    end
  end
end
