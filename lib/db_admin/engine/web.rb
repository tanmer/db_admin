module DbAdmin::Engine
  class Web < ::Rails::Engine
    isolate_namespace DbAdmin
  end
end
