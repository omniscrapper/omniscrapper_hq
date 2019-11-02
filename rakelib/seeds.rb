class Seeds
  include Import[
    task_repo: 'repositories.task',
    schema_repo: 'repositories.schema',
    site_repo: 'repositories.site'
  ]

  def call(repos = {})
    @repos = repos
    seed_all
  end

  private

  def seed_all
    site = seed_sites
    schema = seed_schemas
    seed_tasks(site, schema)
  end

  def seed_sites
    site_repo.create(
      name: 'cmlt.ru',
      url: 'https://www.cmlt.ru/'
    )
  end

  def seed_schemas
    schema_repo.create(
      name: 'real estate ads',
      definition: schema_definition
    )
  end

  def seed_tasks(site, schema)
    task_repo.create(
      site_id: site.id,
      schema_id: schema.id,
      crawler: 'gallery',
      crawler_params: crawler_params,
      scrapper_params: scrapper_params
    )
  end

  def schema_definition
    {
      "type": "object",
      "required": ["name", "description"],
      "properties": {
        "name": {"type": "string"},
        "phone": {"type": "string"},
        "description": {"type": "string"}
      }
    }
  end

  def crawler_params
    {
      "page_link": "//*[@id=\"ans-list-box\"]/div[*]/div/a",
      "entrypoint": "https://www.cmlt.ru/ads--rubric-88",
      "id_within_site": "ad-(.+)",
      "next_page_link": "//*[@id=\"MainContentTable\"]/div[6]/a[9]"
    }
  end

  def scrapper_params
    {
      "name": "//*[@id=\"MainContentTable\"]/div[1]/table/tbody/tr/td[1]/h1/span",
      "phone": "",
      "description": "//*[@id=\"MainContentTable\"]/div[1]/div/div[1]/div/div[4]"
    }
  end
end
