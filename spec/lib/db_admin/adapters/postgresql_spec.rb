require 'rails_helper'

module DbAdmin
  RSpec.describe Adapters::Postgresql do
    let(:conn_string) { ENV['PG_CONN_STRING'] || raise("Please set ENV PG_CONN_STRING to test PostgerSQL adapter\n\nExample: postgres://postgres:@localhost:5432") }
    let(:connection) { Connection.establish_connection conn_string }

    before do
      connection.commit_transaction
      connection.execute <<-SQL
        create database a_test_db;
      SQL
    end

    after do
      connection.rollback_transaction
    end

    it "return all databases" do
      expect(connection.databases.map(&:name)).to be_include('postgres')
    end

    %i{name encoding owner collate ctype}.each do |attr|
      it "database.#{attr} is not nil" do
        database = connection.databases.first
        expect(database.send(attr)).to_not be_nil
      end
    end

    context 'schemas' do
      let(:database) do
        database = connection.databases.first
        database.connect! connection.config
      end
      it 'list contains "public"' do
        expect(database.schemas.map(&:name)).to be_include('public')
      end

      context '> schema' do
        let(:schema) do
          database.schemas.first
        end
        %i{name owner database_name}.each do |attr|
          it "schema.#{attr} is not nil" do
            expect(schema.send(attr)).to_not be_nil
          end
        end
      end

      context "> table" do
        let(:table) do
          database.tables(schema_name: 'public').first
        end

        %i{name owner database_name schema_name}.each do |attr|
          it "table.#{attr} is not nil" do
            expect(table.send(attr)).to_not be_nil
          end
        end
      end

    end

  end
end
