defmodule Sequence2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, initial_number) do
    {:ok, _pid} = Sequence2.Supervisor.start_link(initial_number)
  end
end
