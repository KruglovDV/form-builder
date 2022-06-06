# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :schema

    def initialize(entity)
      @entity = entity
      @schema = []
    end

    def input(field, **kwargs)
      attrs = { **kwargs.except(:as), name: field, value: @entity.public_send(field) }
      tag_type = kwargs.fetch :as, :input
      attrs[:type] = "text" if tag_type == :input
      attrs = attrs.merge({ cols: 20, rows: 40 }) if tag_type == :text
      @schema << { type: :label, attrs: { for: field, value: field } }
      @schema << { type: tag_type, attrs: attrs }
    end

    def submit(text = "Save")
      @schema << { type: :submit, attrs: { name: "commit", type: "submit", value: text } }
    end
  end
end
