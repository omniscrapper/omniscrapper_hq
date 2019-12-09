module Domain
  module Statistics
    class Task
      def call(task_id)
        @task_id = task_id

        {
          counters: jobs_statistics,
          exceptions: exceptions,
          messages: messages,
          traces: traces
        }
      end

      private

      def job_statuses
        @job_statuses ||= repo.page_statuses(@task_id).to_a
      end

      def exceptions
        @exceptions ||= repo.exceptions(@task_id).map(&:to_h)
      end

      def messages
        @messages ||= repo.messages(@task_id).map(&:to_h)
      end

      def traces
        @traces ||= repo.traces(@task_id).map(&:to_h)
      end

      def jobs_statistics
        failed_jobs = job_statuses.find { |j| j.event_type == 'failure' }
        success_jobs = job_statuses.find { |j| j.event_type == 'success' }

        failed_count = failed_jobs&.count || 0
        success_count = success_jobs&.count || 0

        {
          failed_count: failed_count,
          success_count: success_count,
          total_count: failed_count + success_count,
          success_rate: (success_count.to_f / (failed_count + success_count)).round(2)
        }
      end

      def repo
        @repo ||= Scrapping::StartEventRepository.new
      end
    end
  end
end
