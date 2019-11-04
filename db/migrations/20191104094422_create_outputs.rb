Hanami::Model.migration do
  change do
    create_table :outputs do
      primary_key :id

      column :adapter, String, null: false
      column :adapter_params, 'jsonb', null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
