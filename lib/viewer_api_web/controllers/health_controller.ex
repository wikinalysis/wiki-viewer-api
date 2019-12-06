defmodule ViewerApiWeb.HealthController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Wiki

  action_fallback ViewerApiWeb.FallbackController

  def index(conn, _params) do
    json(conn, "ok")
  end
end
