function _git_commits_to_push
    if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1
        git rev-list --count @{u}..HEAD
    else
        echo 0
    end
end

function _git_commits_to_pull
    if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1
        git rev-list --count HEAD..@{u}
    else
        echo 0
    end
end

function _git_branch_name
    set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
    if set -q branch[1]
        echo (string replace -r '^refs/heads/' '' $branch)
    else
        echo (git rev-parse --short HEAD 2>/dev/null)
    end
end

function _is_git_dirty
    not command git diff-index --cached --quiet HEAD -- &>/dev/null
    or not command git diff --no-ext-diff --quiet --exit-code &>/dev/null
end

function _is_git_repo
    type -q git
    or return 1
    git rev-parse --git-dir >/dev/null 2>&1
end

function fish_prompt
    source ~/.config/fish/themes/kanagawa.fish
    set -l __last_command_exit_status $status

    if not set -q -g __fish_arrow_functions_defined
        set -g __fish_arrow_functions_defined
    end

    set -l arrow_color (set_color $green)
    if test $__last_command_exit_status != 0
        set arrow_color (set_color $red)
    end

    set -l arrow "$arrow_color➜ "
    if fish_is_root_user
        set arrow "$arrow_color# "
    end

    set -l cwd_color (set_color $cyan)
    set -l cwd "$cwd_color"(prompt_pwd | path basename)

    set -l repo_info
    set -l python_env ''
    set -l git_status ''

    if set -q VIRTUAL_ENV
        set python_env (set_color $yellow)" 󰌠 "(set_color $normal)
    end

    if _is_git_repo
        set -l repo_branch (set_color red)(_git_branch_name)
        set repo_info (set_color $blue)" git:($repo_branch"(set_color $blue)")"

        set -l commits_to_push (_git_commits_to_push)
        if test "$commits_to_push" -gt 0
            set git_status "$cwd_color ↑$commits_to_push"(set_color normal)
        end

        set -l commits_to_pull (_git_commits_to_pull)
        if test "$commits_to_pull" -gt 0
            set git_status "$git_status $cwd_color↓$commits_to_pull"(set_color normal)
        end

        if _is_git_dirty
            set git_status "$git_status "(set_color yellow)"✗"
        end
    end

    echo -n -s $arrow ' ' $cwd $repo_info$git_status $python_env ' ' (set_color normal)
end
