use Mix.Config

# REVIEW not sure I want to call this `info`

config :nerves_firmware, info: [
  id:         :stem,
  version:    Mix.Project.config[:version],
  built_at:   :os.system_time(:seconds),
  author:     "Garth Hitchens <ghitchens@me.com>"
]

#import_config "#{Mix.Project.config[:target]}.exs"