use Mix.Config

config :nerves_cell, Mix.Project.config

config :logger,
        backends: [ :console, LoggerMulticastBackend ],
        level: :debug,
        format: "$time $metadata[$level] $message\n"
