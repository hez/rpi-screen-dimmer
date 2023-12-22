defmodule BacklightAutomation do
  # TODO Allow for ../intel_backlight/..
  # TODO read max_brightness

  def timestamp, do: System.monotonic_time(:second)
end
