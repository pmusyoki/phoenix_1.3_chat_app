use Mix.Config

config :chat, ChatWeb.Endpoint,
  secret_key_base: "PrdQpCjiFKlBOYdqrHc/YGMd4c12Ta+J4sIp/qrCK4drwfeUmCiSAPa+N3x/1eRU"

config :chat, Chat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "chat_prod",
  pool_size: 15
