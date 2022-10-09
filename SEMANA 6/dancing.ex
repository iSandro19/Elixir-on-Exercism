defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(options :: opts()) :: {:ok, opts()} | {:error, error()}
  @callback handle_frame(dot :: dot(), frame_number :: pos_integer(), options :: opts()) :: dot()

   defmacro __using__(_opts) do
    quote do
      @behaviour DancingDots.Animation
      @impl DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation
  alias DancingDots.Dot

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, _opts) when rem(frame_number, 4) === 0 do
    %Dot{dot | opacity: dot.opacity / 2}
  end

  @impl DancingDots.Animation
  def handle_frame(dot, _frame_number, _opts), do: dot
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation
  alias DancingDots.Dot

  @impl DancingDots.Animation
  def init(options) do
    velocity = Keyword.get(options, :velocity)
    cond do
      is_number(velocity) ->
        {:ok, options}
      true ->
        {:error,
         "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
    end
  end

  @impl DancingDots.Animation
  def handle_frame(dot = %Dot{radius: radius}, frame_number, options) do
    velocity = Keyword.fetch!(options, :velocity)
    %Dot{dot | radius: radius + (frame_number - 1) * velocity}
  end
end

#https://exercism.org/mentoring/external_requests/d2ef1eeaa32d4806bc2b870e53eaf330
