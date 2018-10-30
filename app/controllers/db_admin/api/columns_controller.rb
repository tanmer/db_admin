require_dependency "db_admin/api/base_controller"

module DbAdmin
  class Api::ColumnsController < Api::BaseController
    include ActionController::MimeResponds
    before_action :setup_db, only: [:index]

    def index
      columns = @table.columns
      respond_to do |format|
        format.json { render json: columns }
        format.xml  { render xml: columns }
      end
    end

    def setup_db
      @database = switch_db(params[:database_id])
      @table = @database.tables.find{|t| t.name == params[:table_id]}
    end
  end
end
