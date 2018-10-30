require_dependency "db_admin/api/base_controller"

module DbAdmin
  class Api::DatabasesController < Api::BaseController
    include ActionController::MimeResponds

    def index
      databases = db_connection.databases
      respond_to do |format|
        format.json { render json: databases }
        format.xml  { render xml: databases }
      end
    end
  end
end
