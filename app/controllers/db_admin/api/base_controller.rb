module DbAdmin
  class Api::BaseController < ActionController::API
    before_action :fetch_db_connection_info

    def fetch_db_connection_info
      # TODO: 方便调试，固定参数
      params[:conn] = "postgres://postgres:@localhost:5432/postgres"
      RequestStore.store[:db_connection] ||= Connection.establish_connection(params[:conn])
    end

    def db_connection
      RequestStore.store[:db_connection]
    end

    def switch_db(database_name)
      database = db_connection.databases.find{ |db| db.name == database_name }
      raise ActiveRecord::RecordNotFound if database.nil?
      database.connect!(db_connection.config)
      RequestStore.store[:db_connection] = database.connection
      database
    end
  end
end
