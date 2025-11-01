# AVN_Snip Module
* Snip Name: SN024-AVN_SNIP_PS
* Remote Repo: git@github.com:natrajv/sn024-avn_snip-ps.git
* Local Repo: d:\ws\sn024
---
## Objectives
* Setup default snip directory structure for 
    - Python uv project, Powershell project
* Simple demo project for PowerShell, Python as required

## Demo PowerShell Modules for POC
* GreetingModule
* HelloWorld
* MyUtilityModule

## Avn_Snip module public functions
* New-Snip

## Snip Directory Structure
```
D:\WS\SN024\SRC\MODULES\AVNSNIP
│   AvnSnip.psd1
│   AvnSnip.psm1
│
├───Classes
├───Enums
└───Functions
    ├───Private
    └───Public
            New-Snip.ps1
```

## Test 
Run following:-
```
PS> Copy-Item -Path "D:\ws\sn024\src\Modules\AvnSnip" -Destination "D:\Temp" -Recurse
PS> CD D:\Temp
PS> Test-NewSnip.ps1 
```

## Version
**v0.11.0-20251101_1601** <br/>
- Added example module: HelloWorld _(v1.1.0-20251101_1334)_
---
**v0.10.0-20251026_1530** <br/>
- Added example module: MyUtilityModule _(v1.0.0-20251029_0645)_
---
**v0.9.0-20251026_1530** <br/>
- Initial release
- Added example module: GreetingModule _(v1.0.0-20251027_0511)_
---