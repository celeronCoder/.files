# .files

### Important things to change on new os setup 💻
- Run the command below to enable autocd i.e you won't have to prepend the directory name with cd when you want to chage to that direcotry.
  ```bash
  shopt -s autocd
  ```
 - Add aliases for remove `rm` and move `mv` and the copy command `cp` command that prompts us with a conformation before performing the action.
    ```bash
    alias rm="rm -i"
    alias mv="mv -i"
    alias cp="cp -i"
    ```
- Ignore duplicates when using `history` command to view bash history
  ```bash
  export HISTCONTROL=ignoreboth
  ```
- Remove that user and host crap from the `PS1` prompt but keeping that when the propmt is not a `color_propmpt`.
  ```bash
  if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}[\033[92m\w\033[0m]$ '
  else
      PS1='${debian_chroot:+($debian_chroot)}\u@\h:[\w]$ '
  fi
  ```
