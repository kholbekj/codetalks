defmodule GitHub do
  use OAuth2.Strategy

  # Public API

  def new do
    [client_id: id, client_secret: secret, redirect_uri: uri] = Application.get_env(:oauth, GitHub)
    OAuth2.new([
      strategy: __MODULE__,
      client_id: id,
      client_secret: secret,
      redirect_uri: uri,
      site: "https://api.github.com",
      authorize_url: "https://github.com/login/oauth/authorize",
      token_url: "https://github.com/login/oauth/access_token"
    ])
  end

  def authorize_url!(params \\ []) do
    new()
    |> put_param(:scope, "user,public_repo")
    |> OAuth2.Client.authorize_url!(params)
  end

  # you can pass options to the underlying http library via `options` parameter
  def get_token!(params \\ [], headers \\ [], options \\ []) do
    OAuth2.Client.get_token!(new(), params, headers, options)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
