Fabricator(:scraping_schedule) do
  time { Time.now }
  interval { 1000 }
end