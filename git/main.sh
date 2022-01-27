#!/bin/bash

git config --global user.name "${USER_EMAIL}"
git config --global user.email "${USER_EMAIL}"

git config --global alias.unstage "reset HEAD --"
git config --global alias.ci "commit"
git config --global alias.cia "commit --amend"
git config --global alias.cim "commit -m"
git config --global alias.co "checkout"
git config --global alias.d "diff"
git config --global alias.newb "checkout -b"
git config --global alias.tree "log --graph --oneline --all"
git config --global alias.undo "reset --mixed HEAD^"