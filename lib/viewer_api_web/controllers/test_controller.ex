defmodule ViewerApiWeb.TestController do
  use ViewerApiWeb, :controller

  alias ViewerApi.Wiki

  action_fallback ViewerApiWeb.FallbackController

  def index(conn, _params) do
    text(conn, "Everything is working.")
  end
end
