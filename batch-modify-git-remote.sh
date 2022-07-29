
target_name="0xhuk"
old_name="hu-kunx"

change_github_remote_name() {
  cd $1 
  remote=$(git remote get-url --all origin)
  repo=${remote##*/}
  git remote set-url origin "git@github.com:$target_name/$repo"
}

# if is a git repository
is_inside_git_repo() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

# run
for repo in ~/developer/github/* ; do
  [ -d "$repo" ] || continue
  (
    cd "$repo"
    is_inside_git_repo || continue
    remote=$(git remote get-url --all origin)
    if [[ $remote =~ $old_name ]] ; then
      change_github_remote_name $repo
      now_remote=$(git remote get-url --all origin)
      echo "$remote >> $now_remote" 
    fi
  )
done


