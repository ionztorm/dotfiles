function _git_commits_to_push
    git rev-list --count @{u}..HEAD 2>/dev/null
end

function fish_prompt
    set -l __last_command_exit_status $status

    if not set -q -g __fish_arrow_functions_defined
        set -g __fish_arrow_functions_defined

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

        function _hg_branch_name
            echo (hg branch 2>/dev/null)
        end

        function _is_hg_dirty
            set -l stat (hg status -mard 2>/dev/null)
            test -n "$stat"
        end

        function _is_hg_repo
            fish_print_hg_root >/dev/null
        end

        function _repo_branch_name
            _$argv[1]_branch_name
        end

        function _is_repo_dirty
            _is_$argv[1]_dirty
        end

        function _repo_type
            if _is_hg_repo
                echo hg
                return 0
            else if _is_git_repo
                echo git
                return 0
            end
            return 1
        end
    end

    set -l arrow_color (set_color green)
    if test $__last_command_exit_status != 0
        set arrow_color (set_color red)
    end

    set -l arrow "$arrow_color➜ "
    if fish_is_root_user
        set arrow "$arrow_color# "
    end

    set -l cwd (set_color cyan)(prompt_pwd | path basename)

    set -l repo_info
    set -l python_env ''
    set -l git_status ''

    # Detect Python virtual environment
    if set -q VIRTUAL_ENV
        set python_env (set_color yellow)" 󰌠 "(set_color normal)
    end

    if set -l repo_type (_repo_type)
        set -l repo_branch (set_color red)(_repo_branch_name $repo_type)
        set repo_info (set_color blue)" $repo_type:($repo_branch"(set_color blue)")"

        # Git-specific additions: Check if there are commits to push
        if test $repo_type = git
            set -l commits_to_push (_git_commits_to_push)
            if test "$commits_to_push" -gt 0
                set git_status (set_color green)" ↑$commits_to_push"(set_color normal)
            end
        end

        # Check if repo is dirty
        if _is_repo_dirty $repo_type
            set git_status "$git_status "(set_color yellow)"✗"
        end
    end

    # Combine all parts
    echo -n -s $arrow ' ' $cwd $repo_info$git_status $python_env ' ' (set_color normal)
end
