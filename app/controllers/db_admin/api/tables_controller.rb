require_dependency "db_admin/api/base_controller"

module DbAdmin
  class Api::TablesController < Api::BaseController
    include ActionController::MimeResponds
    before_action :setup_db, only: [:index]

    def index
      options = {}
      options[:schema] = params[:schema_id] if params[:schema_id].present?
      tables = @database.tables(options)
      respond_to do |format|
        format.json { render json: tables }
        format.xml  { render xml: tables }
      end
    end

    def setup_db
      @database = switch_db(params[:database_id])
    end
  end
end
