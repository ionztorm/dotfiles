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
    # source ~/.config/fish/themes/ashen.fish

    set -l __last_command_exit_status $status

    if not set -q -g __fish_arrow_functions_defined
        set -g __fish_arrow_functions_defined
    end

    # Arrow color (success or error)
    set -l arrow_color (set_color $fish_color_status)
    if test $__last_command_exit_status != 0
        set arrow_color (set_color $fish_color_error)
    end

    set -l arrow "$arrow_color➜ "
    if fish_is_root_user
        set arrow "$arrow_color# "
    end

    # CWD color
    set -l cwd_color (set_color $fish_color_keyword)
    set -l cwd "$cwd_color"(prompt_pwd | path basename)

    set -l repo_info
    set -l python_env ''
    set -l git_status ''

    # Python venv
    if set -q VIRTUAL_ENV
        set python_env (string join '' (set_color $fish_color_quote) ' 󰌠 ' (set_color normal))
    end

    if _is_git_repo
        # Git branch name
        set -l repo_branch (set_color $fish_color_error)(_git_branch_name)
        set repo_info (set_color $fish_color_end)" git:($repo_branch"(set_color $fish_color_end)")"

        # Git ahead/behind arrows
        set -l commits_to_push (_git_commits_to_push)
        if test "$commits_to_push" -gt 0
            set git_status "$cwd_color ↑$commits_to_push"(set_color normal)
        end

        set -l commits_to_pull (_git_commits_to_pull)
        if test "$commits_to_pull" -gt 0
            set git_status "$git_status $cwd_color↓$commits_to_pull"(set_color normal)
        end

        # Dirty marker
        if _is_git_dirty
            set git_status "$git_status "(set_color $fish_color_quote)"✗"
        end
    end

    echo -n -s $arrow ' ' $cwd $repo_info$git_status $python_env ' ' (set_color normal)
end
