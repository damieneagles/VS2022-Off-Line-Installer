XCOPY /E /Y inetpub c:\inetpub

mkdir C:\VS2022
mkdir C:\VS2022\Community
mkdir C:\VS2022\Professional
mkdir C:\VS2022\Enterprise
mkdir C:\VS2022\BuildTools

ECHO Adding web applications...
"%windir%\system32\inetsrv\AppCmd" stop site "Default Web Site"
"%windir%\system32\inetsrv\AppCmd" add app /site.name:"Default Web Site" /path:/InstallVS2022Community /physicalPath:"c:\VS2022\Community"
"%windir%\system32\inetsrv\AppCmd" add app /site.name:"Default Web Site" /path:/InstallVS2022Professional /physicalPath:"c:\VS2022\Professional"
"%windir%\system32\inetsrv\AppCmd" add app /site.name:"Default Web Site" /path:/InstallVS2022Enterprise /physicalPath:"c:\VS2022\Enterprise"
"%windir%\system32\inetsrv\AppCmd" add app /site.name:"Default Web Site" /path:/InstallVS2022BuildTools /physicalPath:"c:\VS2022\BuildTools"

ECHO Remove VSLayout
rmdir /s /q C:\VSLayout 

ECHO Make sure VSLayout_Community Directory still exists for next item...
MKDIR C:\VSLayout_Community

ECHO Getting Visual Studio 2022 Community...
vs_Community.exe --layout C:\VSLayout_Community --all --IncludeRecommended --IncludeOptional --lang en-US
ECHO Copying to NETWORK SHARE...
XCOPY /E /Y C:\VSLayout_Community C:\VS2022\Community

ECHO Make sure VSLayout_Professional Directory still exists for next item...
MKDIR C:\VSLayout_Professional

ECHO Getting Visual Studio 2022 Professional...
vs_Professional.exe --layout C:\VSLayout_Professional --all --IncludeRecommended --IncludeOptional --lang en-US
ECHO Copying to NETWORK SHARE...
XCOPY /E /Y C:\VSLayout_Professional C:\VS2022\Professional

ECHO Make sure VSLayout_Enterprise Directory still exists for next item...
MKDIR C:\VSLayout_Enterprise

ECHO Getting Visual Studio 2022 Enterprise...
vs_Enterprise.exe --layout C:\VSLayout_Enterprise --all --IncludeRecommended --IncludeOptional --lang en-US
ECHO Copying to NETWORK SHARE...
XCOPY /E /Y C:\VSLayout_Enterprise C:\VS2022\Enterprise

ECHO Make sure VSLayout_BuildTools Directory still exists for next item...
MKDIR C:\VSLayout_BuildTools

ECHO Getting Visual Studio 2022 BuildTools...
vs_BuildTools.exe --layout C:\VSLayout_BuildTools --all --IncludeRecommended --IncludeOptional --lang en-US
ECHO Copying to NETWORK SHARE...
XCOPY /E /Y C:\VSLayout_BuildTools C:\VS2022\BuildTools

ECHO Updating Response.json series...
XCOPY /E /Y Community\Response.json C:\VS2022\Community\Response.json
XCOPY /E /Y Professional\Response.json C:\VS2022\Professional\Response.json
XCOPY /E /Y Enterprise\Response.json C:\VS2022\Enterprise\Response.json
XCOPY /E /Y BuildTools\Response.json C:\VS2022\BuildTools\Response.json

ECHO Starting web applications
"%windir%\system32\inetsrv\AppCmd" start site "Default Web Site"
