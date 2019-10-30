# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :scraping_tasks do
      primary_key :id
      foreign_key :schema_id, :schemas, on_delete: :cascade, null: false
      foreign_key :site_id, :sites, on_delete: :cascade, null: false

      column :crawler, String, null: false
      column :name, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
