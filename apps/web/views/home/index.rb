module Web
  module Views
    module Home
      class Index
        include Web::View

        def task_status(task)
          if task[:success_rate] > 0.9
            'success'
          elsif task[:success_rate] < 0.9 && task[:success_rate] > 0.7
            'warning'
          else
            'failure'
          end
        end
      end
    end
  end
end
