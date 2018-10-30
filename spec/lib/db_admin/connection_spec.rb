require 'rails_helper'

module DbAdmin
  RSpec.describe Connection do
    let(:conn_string) { ENV['DB_CONN_STRING'] || ENV['PG_CONN_STRING'] || raise("Please set ENV DB_CONN_STRING to test connection\n\nExample: postgres://postgres:@localhost:5432") }

    it "self.establish_connection should defined" do
      expect(subject).to be_respond_to(:establish_connection)
    end

    context "self.establish_connection should return an adapter" do
      before do
        @conn = subject.establish_connection(conn_string)
      end
      it 'PostgreSQL' do
        expect(@conn).to be_a(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      end

      context "instance respond to" do
        it "switch_db!" do
          expect(@conn).to be_respond_to :switch_db!
        end
        it "config" do
          expect(@conn).to be_respond_to :config
        end
        it "databases" do
          expect(@conn).to be_respond_to :databases
        end
      end
    end
  end
end
