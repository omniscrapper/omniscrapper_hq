module Operations
  module SingleRun
    # Cleans single run results table
    class Clear < Base
      include Import[
        test_result_repo: 'repositories.test_result',
      ]

      def call
        test_result_repo.clear
      end
    end
  end
end
