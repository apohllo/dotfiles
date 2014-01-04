parse_git_branch ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                gitver="[$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')]" 
        else
                return 0
        fi
        echo -e $gitver
}
branch_color ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          color="" 
          if git diff --quiet 2>/dev/null >&2 
          then
                  color='\033[01;32m'
          else
                  color='\033[01;31m'
          fi
  else
          return 0
  fi
  echo -ne $color
}
#source ~/.profile
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[$(branch_color)\]$(parse_git_branch) \[\033[01;34m\]\$\[\033[00m\] '
export PS1
