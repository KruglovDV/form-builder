module FormBuilder
  class Form
    attr_reader :schema

    def initialize(entity)
      @entity = entity
      @schema = []
    end

    def input(field, as: :input)
      @schema << { name: field, type: as, value: @entity.public_send(field) }
    end
  end
end