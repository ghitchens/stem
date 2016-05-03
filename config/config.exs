use Mix.Config

config :nerves_firmware, info: [
  id:         :stem,
  version:    Mix.Project.config[:version],
  built_at:   :os.system_time(:seconds),
  author:     "Garth Hitchens <ghitchens@me.com>"
]

#import_config "#{Mix.Project.config[:target]}.exs"