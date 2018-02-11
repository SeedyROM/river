
defmodule River.Application do
  @moduledoc false
  
  require Logger
  use Application

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(
        scheme: :http, 
        plug: River.Router, 
        options: [port: Application.get_env(:river, :port)]
      )
    ]

    Logger.info "Listening on port #{Application.get_env(:river, :port)}"

    opts = [strategy: :one_for_one, name: River.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
