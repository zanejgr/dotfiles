# https://stackoverflow.com/a/44411205/10051099
function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor "red"
        }
        else {
            # we're on an actual branch, so print it
            Write-Host " ($branch)" -ForegroundColor "cyan"
        }
    } catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host " (no branches yet)" -ForegroundColor "yellow"
    }
}


function Write-PyEnvironment(){
    if($env:VIRTUAL_ENV){
        # if pipenv or pyenv
        $i=cat $ENV:VIRTUAL_ENV/pyvenv.cfg|sls prompt|%{$_.ToString().split(' ')[2]}[0]
        write-host "[VEnv:$i]" -NoNewLine
    }
    elseif($env:CONDA_DEFAULT_ENV){
        # if conda
        write-host "[Conda:$env:CONDA_DEFAULT_ENV]" -NoNewLine
    }
    else{
        # no virtual environment
        write-host "[System Python]" -NoNewLine
    }
}

function prompt {
    $path = "$($executionContext.SessionState.Path.CurrentLocation)"
    $path = $path.Replace($HOME,"~")
    $userPrompt = "$('>' * ($nestedPromptLevel + 1)) "
    write-host "`n PS:" -NoNewLine
    Write-PyEnvironment
    

    if (Test-Path .git) {
        Write-Host $path -NoNewline -ForegroundColor "green"
        Write-BranchName -NoNewline
    }
    else {
        # we're not in a repo so don't bother displaying branch name/sha
        Write-Host $path -ForegroundColor "green" -NoNewLine
    }

    return $userPrompt
}
