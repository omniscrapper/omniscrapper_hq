module Operations
  module Site
    class Destroy < Base
      include Import[
        site_repo: 'repositories.site'
      ]

      def call(site)
        return Failure(:site_not_deleted) unless valid?(site)

        site_repo.delete(site.id)
        Success(:success)
      end

      private

      def valid?(site)
        site.tasks.empty?
      end
    end
  end
end
