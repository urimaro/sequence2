defmodule Sequence2.Supervisor do
  use Supervisor

  def start_link(initial_number) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_number])
    start_workers(sup, initial_number)
    result
  end

  def start_workers(sup, initial_number) do
    # スタッシュワーカー開始
    {:ok, stash} = Supervisor.start_child(sup, worker(Sequence2.Stash, [initial_number]))
    # そして、実際の sequence サーパーのスーパーバイザを開始
    Supervisor.start_child(sup, supervisor(Sequence2.SubSupervisor, [stash]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end

