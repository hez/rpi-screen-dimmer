defmodule BacklightAutomation.InputDevice do
  @default_screen_names [
    # Raspberry pi touchscreens
    "raspberrypi-ts",
    "generic ft5x06 (79)",
    # Dell laptop touchscreen
    "G2Touch Multi-Touch by G2TSP"
  ]

  def start_link(opts \\ []) do
    opts
    |> Keyword.get(:screen_names, @default_screen_names)
    |> all()
    |> Enum.each(&InputEvent.start_link/1)
  end

  @spec all(list(String.t())) :: list(InputEvent.Info.t())
  def all(screen_names) do
    InputEvent.enumerate()
    |> Enum.filter(fn {_name, info} -> Enum.member?(screen_names, info.name) end)
    |> Enum.map(&elem(&1, 0))
  end
end
