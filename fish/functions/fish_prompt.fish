function fish_prompt --description 'Write out the prompt'
    set -l laststatus $status
    function _working_dir
        if test (echo $PWD | sed -e "s|^$HOME|~|" | grep -o '/' | wc -l) -lt 5
            echo $PWD | sed -e "s|^$HOME|~|"
        else
            printf "%s/.../%s" (echo $PWD | sed -e "s|^$HOME|~|" | cut -d/ -f1) (echo $PWD | rev | cut -d/ -f1-3 | rev)
        end
    end
    function _tty_environ
        echo $SSH_TTY; or tty | grep 'tty'
    end
    function _display
        echo $DISPLAY
    end
    function _python_virtualenv
        echo $VIRTUAL_ENV
    end
    function _git_branch
        echo (git rev-parse --abbrev-ref HEAD ^/dev/null)
        # echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end
    function _git_dirty
        echo (git status -s -unormal --ignore-submodules ^/dev/null)
    end
    function _git_untracked
        echo (git status -s -unormal --ignore-submodules ^/dev/null | grep '^??')
    end
    function _jobs_active
        echo (jobs | grep 'running')
    end
    function _jobs_count
        echo (jobs | wc -l)
    end


    switch (_display)
        case ''
            printf "%s %s %s" (set_color normal) (_working_dir) (set_color normal)
            printf ">%s" (set_color normal)
        case :0.0
            printf "%s%s %s %s" (set_color normal) (set_color -ob black) (_working_dir) (set_color normal)
            printf "%s%s" (set_color black) (set_color normal)
        case '*'
            printf "%s%s %s %s" (set_color normal) (set_color -ob black) (_working_dir) (set_color normal)
            printf "%s%s" (set_color black) (set_color normal)
    end

    if [ -n (_python_virtualenv) ]
        printf "%s (%s)" (set_color normal) (basename (_python_virtualenv))
    end

    if [ (_git_branch) ]
        if [ -z (_git_dirty) ]
            printf "%s  %s" (set_color green) (_git_branch)
        else if [ -z (_git_untracked) ]
            printf "%s  %s" (set_color cyan) (_git_branch)
        else
            printf "%s  %s" (set_color magenta) (_git_branch)
        end
    end

    if test (_jobs_count) -gt 0
        if test (_jobs_active)
            printf "%s [%s]" (set_color cyan) (_jobs_count)
        else
            printf "%s [%s]" (set_color white) (_jobs_count)
        end
    end

    if test $laststatus -eq 0
        printf "%s \$ %s" (set_color white) (set_color normal)
    else
        printf "%s \$ %s" (set_color red) (set_color normal)
    end
end
