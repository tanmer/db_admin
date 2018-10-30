require 'rails_helper'

module DbAdmin
  RSpec.describe Database do
    let(:conn_string) { ENV['DB_CONN_STRING'] || ENV['PG_CONN_STRING'] || raise("Please set ENV DB_CONN_STRING to test connection\n\nExample: postgres://postgres:@localhost:5432") }
    let(:database) do
      conn = Connection.establish_connection(conn_string)
    end

    context "instance" do
      subject {
        Database.new(
          name: 'postgres',
          encoding: 'UTF-8',
          owner: 'owner',
          collate: 'zh_CN.UTF-8',
          ctype: 'en_US.utf8'
        )
      }

      it 'name = "postgres"' do
        expect(subject.name).to eq 'postgres'
      end

      it 'encoding = "UTF-8"' do
        expect(subject.encoding).to eq 'UTF-8'
      end

      it 'owner = "owner"' do
        expect(subject.owner).to eq 'owner'
      end

      it 'collate = "zh_CN.UTF-8"' do
        expect(subject.collate).to eq 'zh_CN.UTF-8'
      end

      it 'ctype = "en_US.utf8"' do
        expect(subject.ctype).to eq 'en_US.utf8'
      end

    end


    # context "default database" do
    #   it "databases only contains 'postgres'" do
    #     expect(adapter.databases.map(&:name)).to match_array(["postgres"])
    #   end

    #   it "schemas" do
    #     expect(adapter.schemas('postgres')).to match_array(['information_schema'])
    #   end

    #   it "tables" do
    #     expect(adapter.tables('postgres').length).to be > 0
    #   end
    # end

    # context "user database" do
    #   let(:db_name) { "account_rspec_#{Time.now.to_i}"}
    #   before do
    #     adapter.exec(" CREATE DATABASE #{db_name}; ")
    #     adapter.exec(" CREATE TABLE users(username varchar (50)); ")
    #   end
    #   after do
    #     adapter.exec(" DROP DATABASE #{db_name}; ")
    #   end

    #   it "databases contains 'postgres' and 'account'" do
    #     expect(adapter.databases).to match_array(['postgres', 'account'])
    #   end
    # end

  end
end
