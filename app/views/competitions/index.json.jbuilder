json.array!(@competitions) do |competition|
  json.extract! competition, :id, :comp_name, :points_flag, :sets_flag, :mvp_flag
  json.url competition_url(competition, format: :json)
end
