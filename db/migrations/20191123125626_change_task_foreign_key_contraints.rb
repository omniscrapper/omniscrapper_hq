Hanami::Model.migration do
  change do
    execute "ALTER TABLE scrapping_finished_events DROP CONSTRAINT scrapping_finished_events_task_id_fkey;"
    execute "ALTER TABLE scrapping_started_events DROP CONSTRAINT scrapping_started_events_task_id_fkey;"

    execute "ALTER TABLE scrapping_finished_events ADD CONSTRAINT scrapping_finished_events_task_id_fkey FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;"
    execute "ALTER TABLE scrapping_started_events ADD CONSTRAINT scrapping_started_events_task_id_fkey FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE;"
  end
end
