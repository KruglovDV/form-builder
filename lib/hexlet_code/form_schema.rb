# frozen_string_literal: true

module HexletCode
  class FormSchema
    attr_reader :schema

    def initialize(entity, form_attrs)
      @entity = entity
      @schema = { type: :Form, attrs: form_attrs, children: [] }
    end

    def input(name, **attrs)
      type = attrs.fetch(:as, :input).capitalize
      add_child({ type: type, attrs: { **attrs, name: name, value: get_value(name) } })
    end

    def submit(name = '', **attrs)
      prepared_attrs = { **(name.empty? ? {} : { name: name }), **attrs }
      add_child({ type: :Submit, attrs: prepared_attrs })
    end

    private

    def add_child(child)
      @schema[:children].append(child)
    end

    def get_value(field)
      @entity.public_send(field)
    end
  end
end
