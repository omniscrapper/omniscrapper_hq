class ScrapingTaskCreateValidator
  include Hanami::Validations

  predicates SchemaPredicate

  validations do
    required(:scraping_task).schema do
      required(:name).filled(:str?)

      required(:scraping_schedule).schema do
        required(:time).filled(:time?)
        required(:interval).filled(:int?)
      end

      required(:schema).schema do
        required(:metadata).filled(:schema?)
      end
    end
  end
end
