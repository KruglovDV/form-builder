# frozen_string_literal: true

module HexletCode
  class Submit
    class << self
      def render(attrs)
        attrs.delete :name if attrs[:name].empty?
        attrs[:value] = attrs[:name] if attrs.key? :name
        Tag.build('input', **{ name: 'commit', type: 'submit', value: 'Save', **attrs })
      end
    end
  end
end
