# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :schema

    def initialize(entity)
      @entity = entity
      @schema = []
    end

    def input(field, as: :input)
      attrs = { name: field, value: @entity.public_send(field) }

      attrs[:type] = "text" if as == :input
      attrs = attrs.merge({ cols: 20, rows: 40 }) if as == :text
      @schema << { type: :label, attrs: { for: field, value: field } }
      @schema << { type: as, attrs: attrs }
    end

    def submit(text = "Save")
      @schema << { type: :submit, attrs: { name: "commit", type: "submit", value: text } }
    end
  end
end
