# :fzf-tab:complete:(\\|*/|)(kill|ps):argument-rest --preview-window=down:5:wrap
[[ $group == 'process ID' ]] && ps -p$word -wo command | bat --color=always -plsh
