Hanami::Model.migration do
  change do
    create_table :scrapping_finished_events do
      primary_key :id

      # Common fields
      column :event_type, String, null: false
      column :job_id, String, null: false
      column :url, String, null: false
      foreign_key :task_id, :tasks, on_delete: :restrict, null: false

      # Exception fields
      column :exception, String, null: true
      column :message, String, null: true
      column :trace, String, null: true

      # Success fields
      column :hash, String, null: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
