<#
.SYNOPSIS
    Initializes a new uv project with Jupyter kernel, OpenPyXL for Excel and standard packages setup.
.DESCRIPTION
    This script creates a new directory, initializes a uv project, sets up a Jupyter kernel
.PARAMETER SnipDir
    The name of the directory to create and initialize the uv project in.
   #>
param(
    [string]$SnipDir
)
#*--Validate Param--*
if ($PSBoundParameters.ContainsKey('SnipDir')) {
	Write-Host "✅ Name was passed: $SnipDir" -ForegroundColor Green
} else {
	Write-Host "❌ Name was NOT passed" -ForegroundColor Red
}

#*--Set Config--*
$script:SnipName = $null   # Argument for name of Snip
#---
$script:OneDriveBaseDir = $env:OD_HOME

<#**==Index-Functions==**
@01. init_uv
@02. init_support
@03. init_jupyter_kernel
@04. init_excel
@05. init_lib
@06. init_mylib
@07. init_git
#>

#**==Functions==*
function init_uv {
	#--Remove directory if it exists
	if (Test-Path -Path $SnipDir) {
		Remove-Item -Path $SnipDir -Recurse -Force -Confirm
		Write-Host "✅ Removed existing directory $snipDir" -ForegroundColor Red
	} else {
		Write-Host "❌ Directory $SnipDir does not exist" -ForegroundColor Green
	}
	#--Create directory
	New-Item -Path $SnipDir -ItemType Directory

	#--Change to the new directory
	Set-Location -Path $SnipDir
	
	#--Init uv project
	uv init --app
	Write-Host "✅ Initialized uv project in directory '$SnipDir'" -ForegroundColor Green
}

function init_support {
	#--Init support directories, files
	New-Item -ItemType Directory -Path rback # Rollback directory
	New-Item -ItemType Directory -Path arch # Archive 
	$tmp = $SnipDir + "-v1.0.0w-" + (Get-Date -Format "yyyyMMdd_HHmm")
	New-Item -Path $tmp # Snip name with version flag file

	#--List files in the directory
	$files = Get-ChildItem
	Write-Host "Files in directory '$SnipDir':" -ForegroundColor Green
	$files | ForEach-Object { Write-Host $_.Name }
	
	#--Create Python-101 code file
	$FileBaseDir = "01-nats\03-sections\04-coding\03-sections\02-python\26-templates"
	$Python101 = "01-python-code-101-*.py"
	$FilePath = Join-Path -Path $OneDriveBaseDir -ChildPath (Join-Path -Path $FileBaseDir -ChildPath $Python101)
	Copy-Item -Path $FilePath -Destination "x101.py"
	New-Item -Path "test.py" # For testing
	Write-Host "Added Python-101 code template 'x101.py' and test.py" -ForegroundColor Green

	#--Create Steps Note file
	$FileBaseDir = "01-nats\26-templates\05-coding"
	$StepsNote = "001-steps-demo-*.txt"
	$FilePath = Join-Path -Path $OneDriveBaseDir -ChildPath (Join-Path -Path $FileBaseDir -ChildPath $StepsNote)
	Copy-Item -Path $FilePath -Destination "steps.txt"
	Write-Host "Added Steps Note template file" -ForegroundColor Green

}

function init_jupyter_kernel {
	#--Setup Jupyter kernel
	Write-Host "Setting up Jupyter kernel..." -ForegroundColor Blue
	uv add ipykernel
	Write-Host "✅ Added ipykernel to the uv project in directory '$SnipDir'" -ForegroundColor Green
	uv run python -m ipykernel install --user --name $SnipDir --display-name $SnipDir # Register kernel
	Write-Host "✅ Registered Jupyter kernel with name '$SnipDir'" -ForegroundColor Green
	jupyter kernelspec list
}

function init_excel {
	#--Setup OpenPyXL, Pandas, NumPy
	Write-Host "Setting up OpenPyXL..." -ForegroundColor Blue
	uv add openpyxl pandas numpy
	Write-Host "✅ Added OpenPyXL, Pandas, NumPy to the uv project in directory $SnipDir" -ForegroundColor Green
	
	#--Setup Excel Test DB
	Write-Host "Setting up Excel Test DB..." -ForegroundColor Blue
	$FileBaseDir = "01-nats\03-sections\04-coding\03-sections\02-python\27-demo-db"
	$ExcelDb = "02-0-jee-mains-2013-2025-top30-ranks-kaggle-20251003.xlsx"
	$FilePath = Join-Path -Path $OneDriveBaseDir -ChildPath (Join-Path -Path $FileBaseDir -ChildPath $ExcelDb)
	New-Item -ItemType Directory -Name "db"
	Copy-Item -Path $FilePath -Destination "db\jee-mains.xlsx" -Force
	write-Host "✅ Copied Excel Test DB to '$SnipDir\db\jee-mains.xlsx'" -ForegroundColor Green
}

function init_lib {
	#--List installed packages
	Write-Host "Installed packages in the uv project:" -ForegroundColor Green
	uv pip list

	#--List installed tools
	Write-Host "Installed tools in the uv project:" -ForegroundColor Green
	uv tool list
}

function init_mylib {
	
}

function init_git {
	git init #Fix git issue
	#--Update Git
	git branch #Name of branch
	git branch -m main # Master renamed as Main
	Write-Host "Branch name Master renamed to Main" -ForegroundColor Green
	git branch
	#--- 
	git add . #Stage all files 
	git commit -m "$SnipDir 1st commit" #Commit to local repo
	git ls-files #View list of files 
	Write-Host "Git repo $SnipDir updated" -ForegroundColor Green
}

#**==Init MySnip==**
function New-Snip {
    param(
        [string]$Name = "World"
    )
    return "Hello, $Name!"
	param(
		[string]$Name
	)
	#*--Validate Param--*
	if ($PSBoundParameters.ContainsKey('SnipDir')) {
		Write-Host "✅ Name was passed: $SnipDir" -ForegroundColor Green
	} else {
		Write-Host "❌ Name was NOT passed" -ForegroundColor Red
	}

	#*--Init new snip
	init_uv
	init_support
	init_jupyter_kernel
	init_excel
	init_lib
	init_mylib
	init_git

	#--Setup completed
	Write-Host "✅ Setup completed in directory '$SnipDir'" -ForegroundColor Green

}
#**=====**


<# **==Issues and fixes==**
01. PS> "uv init" install git which inturn add previous directory contents and commit 
*--Root cause
- Unknown. Once exited from script, this behaviout can't be reproduced
*--Fix (Workaround)
- Initiate git repo again with "PS>git init" which resets existing git repo
- Fix version: v1.2.3
#>

<# **==Version History==**
*--v1.3.0-20251023_0109
1. Script modularised with functions 

*--v1.2.4-20251022_1943
1. Added: Snip name with version flag file
2. Added: test.py for testing
*--v1.2.3-20251022_0636
1. "uv init" created git erronously add previous directory contents.
2. Workaround fix: "git init" to reinitiate git repo
*--v1.2.2-20251018_1539
1. Pandas, NumPy pakcages included
*--v1.2.1-20251014_0725
1. Steps Note template file steps.txt added 
*--v1.2.0-20251014_0704
1. Python-101 code structure file 'x101.py' added. It's copied from OneDrive\...\03-python\26-templates\01-python-code-101.py
2. Support directory, files create added
*--v1.1.1-20251014_0551
1. Git repo update
*--v1.1.0-20251012_1116
1. JupyterLab added
*--v1.0.0-20251012_1029
1. Initial release 
*-----*
CTD: 20251012_1029
LUD: 20251023_0709
#>