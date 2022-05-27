# .files

### Using GNU Stow to manage dotfiles
- Create a `~/.dotfiles` directory and move all the dotfiles you want to have in that file and craete symlinks for.
  ```bash
  mkdir ~/.dotfiles
  ```
- Use stow to create symlinks for the files using the following command:
  ```bash
  stow .
  ```
  - **NOTE**: the above command create symlinks in the parent directory of the directory it's ran in.
  - If you have the `.dotfiles` directory in some other folder use the following command as such
  ```bash
  stow --dir=~/.dotfiles --target=~/
  # OR
  stow -d ~/.dotfiles -t ~/
  ```
  - **NOTE**: stow create symlinks in the exact same manner as it's stored in the source directory. e.g if you have a file as `./config/myconfig` it will create symlink in the target directory in the config folder.
  - Also make sure before running the command for the first time you don't have the exact same name in the target, on preceding iterations stow will not throw any error and continue to work.

- To remove all the symlinks create by stow use the following command:
  ```bash
  # within the source dotfiles directory
  stow -D .
  ```
> For more info visit [this](https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/) article. 

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
