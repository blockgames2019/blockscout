import Config

config :explorer, Explorer.ExchangeRates, enabled: false, store: :none

config :explorer, Explorer.KnownTokens, enabled: false, store: :none

config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: "example.com",
  client_id: "clien_id",
  client_secret: "secrets"

config :ueberauth, Ueberauth,
  logout_url: "example.com/logout",
  logout_return_to_url: "example.com/return"

variant =
  if is_nil(System.get_env("ETHEREUM_JSONRPC_VARIANT")) do
    "parity"
  else
    System.get_env("ETHEREUM_JSONRPC_VARIANT")
    |> String.split(".")
    |> List.last()
    |> String.downcase()
  end

Code.require_file("#{variant}.exs", "#{__DIR__}/../../../explorer/config/test")
Code.require_file("#{variant}.exs", "#{__DIR__}/../../../indexer/config/test")
