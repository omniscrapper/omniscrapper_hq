module Scrapping
  class StartEventRepository < Hanami::Repository
    self.relation = :scrapping_started_events

    def tasks_statuses
      root.read <<-SQL
        SELECT
            task_id,
            job_id,
            schema_id,
            url,
            finished_at - started_at AS elapsed_time,
            CASE
                WHEN status IS NULL THEN 'running'
                ELSE status
            END

        FROM (
            SELECT
            "tasks"."id" AS task_id,
            "tasks"."schema_id" AS schema_id,

            "scrapping_started_events"."job_id" AS job_id,
            "scrapping_started_events"."url" AS url,
            "scrapping_finished_events"."event_type" AS status,

            "scrapping_started_events"."created_at" AS started_at,
            "scrapping_finished_events"."created_at" AS finished_at

            FROM "scrapping_started_events"

            INNER JOIN "tasks"
            ON "tasks"."id" = "scrapping_started_events"."task_id"

            LEFT OUTER JOIN "scrapping_finished_events"
            ON (
                "scrapping_started_events"."job_id" = "scrapping_finished_events"."job_id"
                AND
                "scrapping_started_events"."task_id" = "scrapping_finished_events"."task_id"
                AND
                "scrapping_started_events"."url" = "scrapping_finished_events"."url"
            )

            ORDER BY "scrapping_started_events"."created_at" DESC
        ) AS events
        LIMIT 20
SQL
    end
  end
end
