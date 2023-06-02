# :fzf-tab:complete:(\\|*/|)(pkill:o-argument-rest|killall:argument-1) --preview-window=down:5:wrap
ps -p$(pgrep -d ',' $word) -wocommand | bat --color=always -plsh
