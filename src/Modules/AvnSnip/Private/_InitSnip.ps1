
function _InitializeUv {
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

function _InitializeSupportFiles {
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

function _InitializeJupyterKernel {
	#--Setup Jupyter kernel
	Write-Host "Setting up Jupyter kernel..." -ForegroundColor Blue
	uv add ipykernel
	Write-Host "✅ Added ipykernel to the uv project in directory '$SnipDir'" -ForegroundColor Green
	uv run python -m ipykernel install --user --name $SnipDir --display-name $SnipDir # Register kernel
	Write-Host "✅ Registered Jupyter kernel with name '$SnipDir'" -ForegroundColor Green
	jupyter kernelspec list
}

function _InitializeExcel {
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

function _ShowInstalledPackagesAndTools {
	#--List installed packages
	Write-Host "Installed packages in the uv project:" -ForegroundColor Green
	uv pip list

	#--List installed tools
	Write-Host "Installed tools in the uv project:" -ForegroundColor Green
	uv tool list
}


function _InitializeGit {
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

function _InitializeBaseDir {
	# PowerShell Snip Base Directory Structure Initialization
	# Define array for list of directories and files to create
	$items = @(
		"$SnipDir\",
		"$SnipDir\Public\",
		"$SnipDir\Private\",
		"$SnipDir\$SnipDir.psd1",
		"$SnipDir\$SnipDir.psm1",
		"$SnipDir\Test-$SnipDir.ps1",
		"$SnipDir\README.md",
		"$SnipDir\Public\Do-Something.ps1",
		"$SnipDir\Private\_InitializeSomething.ps1"
	)

	# Loop through each item and create directories or files as needed
	foreach ($path in $items) {
		if ($path.EndsWith("\")) {
			# Create directory
			New-Item -ItemType Directory -Path $path -Force | Out-Null
			Write-Host "Created Directory: $path"
		}
		else {
			# Get parent directory
			$dir = Split-Path $path

			# Create parent directory only if it is not null or empty
			if (-not [string]::IsNullOrWhiteSpace($dir)) {
				New-Item -ItemType Directory -Path $dir -Force | Out-Null
				Write-Host "Created Parent Directory: $dir"
			}

			# Create file
			New-Item -ItemType File -Path $path -Force | Out-Null
			Write-Host "Created File: $path"
		}
	}
}