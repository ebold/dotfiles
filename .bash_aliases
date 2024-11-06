# gsi
alias lxpool='ssh lxpool' # log in to lxpool
alias tsl101='ssh tsl101' # log in to tsl101
alias asl751='ssh asl751' # log in to asl751

# tos
alias cd_bel='cd $HOME/gsi_prj/bel_projects'
alias cd_bg='cd $HOME/gsi_prj/bel_projects/modules/burst_generator'
alias cd_fbas='cd $HOME/gsi_prj/bel_projects/modules/fbas'
alias ps_saftd='ps aux | grep saftd'
ebmon_tcp() { eb-mon -gily "tcp/${1}.acc"; }

# popular, created by dan_nanni
alias please='sudo !!'     # re-run the last command with sudo
alias ..='cd ..'           # move up one directory level
alias ...='cd ../..'       # move up two directory levels
alias ....='cd ../../..'   # move up three directory levels
alias lt='ls -ltr'         # list files sorted by modification time in increasing order
mkd() { mkdir -p "$1" && cd "$1"; } # make a new directory and jump
alias f='find . -type f -name'      # find files by name
alias chown='chown --preserve-root' # prevent it from being applied to/by accident
alias chmod='chmod --preserve-root' # prevent it from being applied to/by accident
alias chgrp='chgrp --preserve-root' # prevent it from being applied to/by accident
alias ports='sudo ss -tulanp'       # show all open ports system-wide
alias rsync='rsync -Pauvh'          # syncing files to another location
alias du='du -ch --max-depth=1'     # summarize disk usage by directory
alias mem='free -h'                 # summarize memory usage
alias topcpu='ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head' # list cpu hoggers
alias topmem='ps -eo pid,cmd,%mem,%cpu --sort=-%mem | head' # list memory hoggers
alias psg='ps aux | grep -v grep | grep -i'                 # find processes by name or keyword
alias update='sudo apt update && sudo apt upgrade'          # update Debian-based system
alias clean='sudo apt autoremove && sudo apt clean'         # clean up unused deb packages
alias agent='eval $(ssh-agent); ssh-add'                    # start SSH agent
ipa() { ip -4 a show "$1" | grep -oP '(?<=inet\s)\d+(\.\d+){3}'; } # show interface IP address
