Hanami::Model.migration do
  change do
    execute "ALTER TABLE job_events DROP CONSTRAINT job_events_task_id_fkey;"
    execute "ALTER TABLE job_events ADD CONSTRAINT job_events_task_id_fkey FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;"
  end
end
