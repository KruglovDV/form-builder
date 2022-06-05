module HexletCode
  module Tag
    class << self
      def build(tag_name, **attrs)
        if SINGLE_TAGS.include? tag_name
          build_single_tag tag_name, attrs
        elsif PAIR_TAGS.include? tag_name
          body = yield if block_given?
          build_pair_tag tag_name, attrs, body
        else
          raise HexletCode::UnknownTagError.new "Unknown tag #{tag_name}"
        end
      end

      private
      SINGLE_TAGS = %w[br img input a]
      PAIR_TAGS = %w[label div span form]

      def build_single_tag(tag_name, attrs)
        "<#{tag_name}#{build_attrs(attrs)}>"
      end

      def build_pair_tag(tag_name, attrs, body = "")
        "<#{tag_name}#{build_attrs(attrs)}>#{body}</#{tag_name}>"
      end

      def build_attrs(attrs)
        return "" if attrs.empty?
        " " + attrs.entries.map do |pair|
          key, value = pair
          "#{key}=\"#{value}\""
        end.join(' ')
      end
    end
  end
end