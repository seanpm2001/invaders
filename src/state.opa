@client State = {{

  blink_text(ctx, txt:string) =
    t = Date.now() |> Date.in_milliseconds
    t = t / 100
    t = t - (t/10)*10
    if t > 3 then
      do Canvas.save(ctx)
      do Canvas.set_font(ctx, "bold 38px Arial")
      do Canvas.set_text_align(ctx, {align_center})
      do Canvas.set_fill_style(ctx, {color=Color.green})
      do Canvas.fill_text(ctx, txt, 512, 365)
      Canvas.restore(ctx)

  draw(ctx:Canvas.context, s:OpaInvaders.game_state) =
    match s with
    | {pause} -> blink_text(ctx, "PAUSED")
    | {game_over} ->
      blink_text(ctx, "GAME OVER - 'r' to restart")
    | _ -> void

}}
