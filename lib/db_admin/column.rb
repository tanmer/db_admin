module DbAdmin
  class Column
    attr_reader :name, :owner, :schema
    def initialize(info)
      info = info.symbolize_keys
      %i/name owner schema/.each do |k|
        instance_variable_set "@#{k}", info[k]
      end
    end
  end
end
