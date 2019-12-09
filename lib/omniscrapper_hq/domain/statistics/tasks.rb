module Domain
  module Statistics
    class Tasks
      def call
        job_statuses.reduce({}) do |result, (task_id, reports)|
          result.merge(task_id => task_statistics(reports))
        end
      end

      private

      def job_statuses
        Scrapping::StartEventRepository.new.job_statuses.to_a.group_by(&:task_id)
      end

      def task_statistics(reports)
        finished = reports.find { |r| r.event == 'finished' }
        failed = reports.find { |r| r.event == 'failed' }

        finished_count = finished&.count || 0
        failed_count = failed&.count || 0

        site_name = finished&.site_name || failed&.site_name

        {
          total_jobs: finished_count + failed_count,
          finished_jobs: finished_count,
          failed_jobs: failed_count,
          success_rate: (finished_count.to_f / (finished_count + failed_count)).round(2),
          site_name: site_name
        }
      end
    end
  end
end
