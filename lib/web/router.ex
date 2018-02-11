defmodule River.Router do
    use Plug.Router

    plug Plug.Logger
    plug River.Static

    plug :match
    plug :dispatch

    get "/favicon.ico" do
        send_resp(conn, 200, '')
    end

    get "/hello" do
        send_resp(conn, 200, "world, existance is pain i want to die")
    end
end