<#
.SYNOPSIS
    Initializes a new uv project with Jupyter kernel, OpenPyXL for Excel and standard packages setup.
.DESCRIPTION
    This script creates a new directory, initializes a uv project, sets up a Jupyter kernel
.PARAMETER SnipDir
    The name of the directory to create and initialize the uv project in.
   #>
<#--Version-v1.3.0-20251027_0619 #>
	
param(
    [string]$StepsID
)
#*--Validate Param--*
if ($PSBoundParameters.ContainsKey('StepsID')) {
	Write-Host "✅ Name was passed: $StepsID" -ForegroundColor Green
} else {
	Write-Host "❌ Name was NOT passed" -ForegroundColor Red
}

<#**==Index-Functions==**
@01. show_steps
@02. ...
@03. ...
#>

#**==Functions==*
function show_steps {
    switch ($StepsID) {
        "index01" {
             # Display steps of git
            Write-Host "*--Index-Show Steps--*" -ForegroundColor Red

            $steps_git_push = @"
*--Git--*
git01: Steps of Git Push
git02: Steps of Git Branch merging
git03: Steps to reset local repo to match remote repo
git04: Steps to Tag for version release
"@
            Write-Host $steps_git_push -ForegroundColor Green
		}
        "git01" {
             # Display steps of git
            Write-Host "*--Steps of Git Push--*" -ForegroundColor Red

            $steps_git_push = @"
git status
git add .
git status
git git commit -m "get_df_by_range(…) added"
git branch #Check current active branch
git remote -v #Check remote 
#git push -u origin main #Push to remote one-time
git push #Push to remote subsequent times
"@
            Write-Host $steps_git_push -ForegroundColor Green
		}
        "git02" {
             # Display steps of git
            Write-Host "*--Steps of Git Branch merging--*" -ForegroundColor Red

            $steps_git_push = @"
git branch
git switch -c xbr
git push -u origin xbr
git switch main
git pull
git merge xbr
#--Delete branch(Optional)
git branch -d xbr
git push origin --delete xbr
"@
            Write-Host $steps_git_push -ForegroundColor Green
		}
        "git03" {
             # Display steps of git
            Write-Host "*--Steps to reset local repo to match remote repo--*" -ForegroundColor Red

            $steps_git_push = @"
git status #Show changes, untracked files
git fetch origin #Fetch remote metadata
git reset --hard origin/main #Discard local changes
git clean -df #Remove untracked files
"@
            Write-Host $steps_git_push -ForegroundColor Green
		}
        "git04" {
             # Display steps of git
            Write-Host "*--Steps to Tag for version release--*" -ForegroundColor Red

            $steps_git_push = @"
git add .
git commit -m "Released SN099-v1.0.0"
git tag SN099-v1.0.0
git push
git push origin SN021-v1.0.0
"@
            Write-Host $steps_git_push -ForegroundColor Green
		}
		default {
			Write-Host "❌ Steps ID:  $StepsID not avilable" -ForegroundColor Red
			}
    }
}

show_steps $StepsID