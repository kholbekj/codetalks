# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :codetalks, Codetalks.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "uMLbzWlnIsbgF4tZSp9G3Pu/PrNFDR+bcqyNO9PYJUM4fSNe2o/AQRdAjQPJxqJz",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Codetalks.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
case Mix.env do
  :dev ->
    import_config "credentials.exs"
  _ ->
    config :oauth, GitHub,
      client_id: System.get_env("GITHUB_CLIENT_ID"),
      client_secret: System.get_env("GITHUB_CLIENT_SECRET"),
      redirect_uri: System.get_env("GITHUB_REDIRECT_URI")
end
