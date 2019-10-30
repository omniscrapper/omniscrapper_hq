class SiteRepository < Hanami::Repository
  associations do
    has_many :tasks
  end
end
