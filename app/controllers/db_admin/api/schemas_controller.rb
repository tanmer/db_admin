require_dependency "db_admin/api/base_controller"

module DbAdmin
  class Api::SchemasController < Api::BaseController
    include ActionController::MimeResponds
    before_action :setup_db, only: [:index]

    def index
      schemas = @database.schemas
      respond_to do |format|
        format.json { render json: schemas }
        format.xml  { render xml: schemas }
      end
    end

    private

    def setup_db
      @database = switch_db(params[:database_id])
    end
  end
end
