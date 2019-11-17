Hanami::Model.migration do
  change do
    create_table :job_events do
      primary_key :id

      column :event, String, null: false

      column :job_id, String, null: false
      foreign_key :task_id, :tasks, on_delete: :restrict, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
