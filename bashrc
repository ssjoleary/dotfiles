export GPG_TTY=$(tty)

# Keep newest version of commands in history
export HISTCONTROL=ignoreboth:erasedups
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

alias np="ncmpcpp"

new_tmux_session() {
	tmux new -s "$1"
}

alias tn=new_tmux_session

attach_tmux_session() {
	tmux attach -t "$1"
}

alias ta=attach_tmux_session

list_tmux_sessions() {
	tmux ls
}

alias tl=list_tmux_sessions

show_help() {
	echo "
	ctrl-a      - move the cursor to the beginning of the current line
	ctrl-e      - move the cursor to the end of the current line
	alt-b       - move the cursor backwards one word
	alt-f       - move the cursor forward one word
	ctrl-k      - delete from cursor to the end of the line
	ctrl-u      - delete from cursor to the beginning of the line
	alt-d       - delete the word in front of the cursor
	ctrl-w      - delete the word behind of the cursor

	pbcopy      - copy to clipboard
	pbpaste     - paste from clipboard
	cd -        - change into most recently accessed directory
	pushd <dir> - add current directory to stack & move
	popd <dir>  - move to top directory in stack

	ctrl-z      - stops current job
	fg          - moves most recent job to foreground
	bg          - moves most recent job to background
	disown -h   - detach process from shell
	jobs -l     - lists jobs
	"
}

alias hint=show_help

git_hint() {
	echo "
	git pull origin develop --rebase        - whilst on you're on your feature branch
	git reset --hard origin/[branch]        - reset branch after someone else has git push -f
	"
}

alias git_hint=git_hint

alias prettyjson='python -m json.tool'

alias lein_what=lein_what

lein_what() {
  echo "
  ancient   - A Leiningen plugin to check your project for outdated dependencies and plugins.
  eastwood  - Eastwood is a Clojure lint tool that uses the tools.analyzer and tools.analyzer.jvm libraries to inspect namespaces and report possible problems.
  kibit     - kibit is a static code analyzer for Clojure, ClojureScript, cljx and other Clojure variants.
  bikeshed  - A Leiningen plugin designed to tell you your code is bad, and that you should feel bad.
  "
}
