class HackernewsSeeds
  include Import[
    task_repo: 'repositories.task',
    schema_repo: 'repositories.schema',
    site_repo: 'repositories.site',
    output_repo: 'repositories.output'
  ]

  def call(repos = {})
    @repos = repos
    seed_all
  end

  private

  def seed_all
    site = seed_sites
    output = seed_outputs
    schema = seed_schemas
    seed_tasks(site, schema, output)
  end

  def seed_sites
    site_repo.create(
      name: 'HackerNews',
      url: 'https://news.ycombinator.com/'
    )
  end

  def seed_outputs
    output_repo.create(
      adapter: 'Kafka',
      adapter_params: {
        kafka_host: 'localhost',
        kafka_topic: 'hackernews'
      }
    ) 
  end

  def seed_schemas
    schema_repo.create(
      name: 'HackerNews posts',
      definition: schema_definition
    )
  end

  def seed_tasks(site, schema, output)
    task_repo.create(
      site_id: site.id,
      schema_id: schema.id,
      output_id: output.id,
      crawler: 'gallery',
      crawler_params: crawler_params,
      scrapper_params: scrapper_params
    )
  end

  def schema_definition
    {
      type: :object,
      required: [:id_within_site, :title, :url],
      properties: {
        id_within_site: {
          type: :string
        },
        title: {
          type: :string
        },
        url: {
          type: :string
        }
      }
    }
  end

  def crawler_params
    {
      "page_link": '//a[starts-with(@href, "item?id=")]',
      "entrypoint": "https://news.ycombinator.com/",
      "id_within_site": 'id=(\d+)',
      "next_page_link": '//a[normalize-space(.)="More"]'
    }
  end

  def scrapper_params
    {
      "title": {
        "selector": '//td[@class="title"]/a/text()'
      },
      "url": {
        "selector": '//td[@class="title"]/a/@href'
      }
    }
  end
end
