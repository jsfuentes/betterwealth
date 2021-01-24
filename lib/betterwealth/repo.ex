defmodule Betterwealth.Repo do
  use Ecto.Repo,
    otp_app: :betterwealth,
    adapter: Ecto.Adapters.Postgres
end
