;;zoom in and out
(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

    (defhydra hydra-buffers (:color blue :hint nil)
              "
                                                                       ╭─────────┐
     Move to Window         Switch                  Do                 │ Buffers │
  ╭────────────────────────────────────────────────────────────────────┴─────────╯
           ^_k_^          [_b_] switch (ido)       [_d_] kill the buffer
           ^^↑^^          [_i_] ibuffer            [_r_] toggle read-only mode
       _h_ ←   → _l_      [_a_] alternate          [_u_] revert buffer changes
           ^^↓^^          [_s_] switch (helm)      [_w_] save buffer
           ^_j_^
  --------------------------------------------------------------------------------
              "
              ("<tab>" hydra-master/body "back")
              ("<ESC>" nil "quit")
              ("a" joe-alternate-buffers)
              ("b" ido-switch-buffer)
              ("d" joe-kill-this-buffer)
              ("i" ibuffer)
              ("h" buf-move-left  :color red)
              ("k" buf-move-up    :color red)
              ("j" buf-move-down  :color red)
              ("l" buf-move-right :color red)
              ("r" read-only-mode)
              ("s" helm-buffers-list)
              ("u" joe-revert-buffer)
              ("w" save-buffer))

    (defhydra hydra-window (:color blue :hint nil)
            "
                                                                       ╭─────────┐
     Move to      Size    Scroll        Split                    Do    │ Windows │
  ╭────────────────────────────────────────────────────────────────────┴─────────╯
        ^_k_^           ^_K_^       ^_p_^    ╭─┬─┐^ ^        ╭─┬─┐^ ^         ↺ [_u_] undo layout
        ^^↑^^           ^^↑^^       ^^↑^^    │ │ │_v_ertical ├─┼─┤_b_alance   ↻ [_r_] restore layout
    _h_ ←   → _l_   _H_ ←   → _L_   ^^ ^^    ╰─┴─╯^ ^        ╰─┴─╯^ ^         ✗ [_d_] close window
        ^^↓^^           ^^↓^^       ^^↓^^    ╭───┐^ ^        ╭───┐^ ^         ⇋ [_w_] cycle window
        ^_j_^           ^_J_^       ^_n_^    ├───┤_s_tack    │   │_z_oom
        ^^ ^^           ^^ ^^       ^^ ^^    ╰───╯^ ^        ╰───╯^ ^       
  --------------------------------------------------------------------------------
            "
            ("<tab>" hydra-master/body "back")
            ("<ESC>" nil "quit")
            ("n" joe-scroll-other-window :color red)
            ("p" joe-scroll-other-window-down :color red)
            ("b" balance-windows)
            ("d" delete-window)
            ("H" shrink-window-horizontally :color red)
            ("h" windmove-left :color red)
            ("J" shrink-window :color red)
            ("j" windmove-down :color red)
            ("K" enlarge-window :color red)
            ("k" windmove-up :color red)
            ("L" enlarge-window-horizontally :color red)
            ("l" windmove-right :color red)
            ("r" winner-redo :color red)
            ("s" split-window-vertically :color red)
            ("u" winner-undo :color red)
            ("v" split-window-horizontally :color red)
            ("w" other-window)
            ("z" delete-other-windows))

