Hanami::Model.migration do
  change do
    create_table :tasks do
      primary_key :id

      foreign_key :schema_id, :schemas, on_delete: :restrict, null: false
      foreign_key :site_id, :sites, on_delete: :restrict, null: false

      column :crawler, String, null: false
      column :fields, "jsonb", null: false
      column :crawler_options, "jsonb", null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
