# frozen_string_literal: true

module HexletCode
  module Tag
    class << self
      def build(tag_name, **attrs)
        if SINGLE_TAGS.include? tag_name
          build_single_tag tag_name, attrs
        elsif PAIR_TAGS.include? tag_name
          body = ''
          body = yield if block_given?
          build_pair_tag tag_name, attrs, body
        else
          raise FormBuilder::UnknownTagError, "Unknown tag #{tag_name}"
        end
      end

      private

      SINGLE_TAGS = %w[br img input a].freeze
      PAIR_TAGS = %w[label div span form textarea].freeze

      def build_single_tag(tag_name, attrs)
        "<#{tag_name}#{build_attrs(attrs)}>"
      end

      def build_pair_tag(tag_name, attrs, body = '')
        "<#{tag_name}#{build_attrs(attrs)}>#{body}</#{tag_name}>"
      end

      def build_attrs(attrs)
        return '' if attrs.empty?

        result = attrs.entries.map do |pair|
          key, value = pair
          "#{key}=\"#{value}\""
        end.join(' ')
        " #{result}"
      end
    end
  end
end
