# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :schema

    def initialize(entity)
      @entity = entity
      @schema = []
    end

    def input(field, **kwargs)
      tag_type = kwargs.fetch :as, :input
      attrs = DEFAULT_ATTRS[tag_type].merge({ **kwargs, name: field, value: get_value(field) }).except(:as)
      @schema << { type: :label, attrs: { for: field, value: field } }
      @schema << { type: tag_type, attrs: attrs }
    end

    def submit(text = 'Save')
      @schema << { type: :submit, attrs: { name: 'commit', type: 'submit', value: text } }
    end

    private

    DEFAULT_ATTRS = {
      input: { type: 'text' },
      text: { cols: 20, rows: 40 }
    }.freeze

    def get_value(field)
      @entity.public_send(field)
    end
  end
end
