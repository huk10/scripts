#!/usr/bin/env bash

# example：./batch-modify-git-remote ~/developer/github new_name

DIR="$1"
NEW_NAME="$2"

if [ -z "$DIR" ] || [ -z "$NEW_NAME" ]; then
  echo 'Missing required parameters'
  exit 2
fi

change_github_remote_name() {
  cd "$1" || exit
  remote_url=$(git remote get-url origin)
  repo_name=$(basename "$remote_url")

  if [[ "$remote_url" =~ ^git@github.com ]]; then
    git remote set-url origin "git@github.com:$NEW_NAME/$repo_name"
  fi
  if [[ "$remote_url" =~ ^https://github.com ]]; then
    git remote set-url origin "https://github.com/$NEW_NAME/$repo_name"
  fi
}

# if is a git repository
is_inside_git_repo() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1
  return $?
}

run() {

  TARGET_DIR="$1"
  # Remove the last slash
  if [[ "$TARGET_DIR" == */ ]]; then
    TARGET_DIR="${TARGET_DIR%?}"
  fi

  # If it's not a directory, return.
  if [ ! -d "$TARGET_DIR" ]; then
    return
  fi

  # Cycle treatment
  for entry in "$TARGET_DIR"/*; do
    # If it's not a directory, skip it.
    if [ ! -d "$entry" ]; then
      continue
    fi

    cd "$entry" || exit

    if ! is_inside_git_repo; then
      continue
    fi

    remote=$(git remote get-url --all origin)
    if [[ ! "$remote" =~ ^git@github.com ]] && [[ ! "$remote" =~ ^https://github.com ]]; then
      echo ["$entry"] Non-GitHub URL is not supported
      continue
    fi

    username=$(echo "$remote" | sed -E 's/.*[:/](.*)\/.*/\1/')
    if [ "$username" == "$NEW_NAME" ]; then
      continue
    fi

    change_github_remote_name "$entry"
    now_remote="$(git remote get-url origin)"

    echo "$remote >> ${now_remote}"
  done
}


run "$DIR"


