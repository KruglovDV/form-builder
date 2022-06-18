# frozen_string_literal: true

module HexletCode
  module Tag
    class << self
      SINGLE_TAGS = %w[br img input a].freeze

      private_constant :SINGLE_TAGS

      def build(tag_name, **attrs)
        open_tag = "<#{tag_name}#{build_attrs(attrs)}>"
        return open_tag if SINGLE_TAGS.include? tag_name

        body = yield if block_given?
        "#{open_tag}#{body}</#{tag_name}>"
      end

      private

      def build_attrs(attrs)
        return '' if attrs.empty?

        attrs.entries.map do |pair|
          key, value = pair
          " #{key}=\"#{value}\""
        end.join
      end
    end
  end
end
