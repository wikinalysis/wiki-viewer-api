defmodule ViewerApi.Repo do
  use Ecto.Repo,
    otp_app: :viewer_api,
    adapter: Ecto.Adapters.MyXQL
end
