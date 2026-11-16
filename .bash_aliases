# popular, created by dan_nanni
alias please='sudo !!'     # re-run the last command with sudo
alias lh='ls -lh'          # long list and human readability for sizes
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
alias du='du -ch'                   # summarize disk usage by directory
alias mem='free -h'                 # summarize memory usage
alias topcpu='ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head' # list cpu hoggers
alias topmem='ps -eo pid,cmd,%mem,%cpu --sort=-%mem | head' # list memory hoggers
alias psg='ps aux | grep -v grep | grep -i'                 # find processes by name or keyword
alias update='sudo apt update && sudo apt upgrade'          # update Debian-based system
alias clean='sudo apt autoremove && sudo apt clean'         # clean up unused deb packages
alias agent='eval $(ssh-agent); ssh-add'                    # start SSH agent
ipa() { ip -4 a show "$1" | grep -oP '(?<=inet\s)\d+(\.\d+){3}'; } # show interface IP address
alias ping='ping -c 1 -W 1'         # 1 attempt with time-out of 1 second
alias ps_all='ps xawf -eo pid,user,cgroup,args'             # list all processes
alias usb_maxpower='lsusb -v | egrep "^Bus|MaxPower"'  # power consumption of USB devices

# git commands
git-del-remote() { git push origin --delete $1; }      # delete a gvien branch from a remote repo
git-del-local()  { git branch -d $1; }                 # delete a fully merged local branch
alias git-check-unmerged='git branch --no-merged'      # list all branches that haven't been merged into the current branch
# List remote Git branches and the last commit date for each branch. Sort by most recent commit date.
# Credit: http://stackoverflow.com/a/2514279
git-sort-branches()
{
  for branch in `git branch -r | grep -v HEAD`; do
    echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch;
  done | sort -r
}
# Archive extractor, by AH
xc-ex()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1    ;;
      *.tar.gz)  tar xzf $1    ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xf $1     ;;
      *.tbz2)    tar xjf $1    ;;
      *.tgz)     tar xzf $1    ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *.xz)      unxz $1       ;;
      *)         echo "Error: $1 cannot be extracted via ex()!" ;;
    esac
  else
    echo "Error: $1 is not a valid file!"
  fi
}

# others
# dry-run to synchronize local folder with remote files newer than given date
# $1: date (eg., 2026-06-01)
# $2: remote path (eg, host:~/myfolder/)
rsync_newermt_dry() { find * -type f -newermt "$1" | while read file; do echo $file; rsync $2/$file . -n; done }

# pdf
# pdftotext -f <first_page> -l <last_page> -layout </pdf_file>
pdf_text() { pdftotext -f $1 -l $2 -layout $3; }

