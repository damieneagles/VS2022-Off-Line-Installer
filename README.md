# VS2022-Off-Line-Installer
Builds a Visual Studio 2022 Offline Installer for local intranet use.

1. Install IIS (Assuming (Windows 10 or better) or (Windows Server 2008 R2 or better))
2. Add MimeType for .ps1 (See Diagram below)
3. Double click the VHD to mount it (Appears as an extra drive in file explorer. Right click the drive and eject to unmount)
4. Copy (your mounted VHD drive)inetpub\wwwroot on VHD to the physical path mapped to your "Default Web Site" in IIS.
5. Run the GetVisualStudio.bat (Using a high bandwidth connection it's about 24 hours as it downloads Visual Studio 2022 in all languages - So run overnight)
6. After you get a green line saying successful make sure the Response.json on the VHD overwrites the Response.json under C:\VS2022\VisualStudio directory. If you don't get a success REM the section in the batch file that removes the C:\VSLayout directory and run it again, it will verify the existing packages and keep going from where it left off!!!
7. Install PowerShell x64 on your PC and startup the "Windows PowerShell ISE" in admin mode (just type in "pow shell" into your main screen search box... it is buried somewhere...)
8. NOTE - Make SURE you use the associated ps1 script or you'll use up your ONE SHOT with the VS2022 installer and need to download it again!!!
9. goto http://localhost to start the installer it will download the ps1 script and there are some instruction on http://localhost to run so that the ps1 content runs as remotesigned.
10. ALL GOOD!!!

Additional Files
I tried to add a second VHD but there is a 25MB restriction so the files and folders in this respository minus the VHD and ReadMe should be in the VS2022_Installer folder on your C:\. Kick off the GetVisualStudio.bat with elevated permissions (Run as Administrator) at the command prompt C:\VS2022_Installer.



![AddMimeType](https://github.com/user-attachments/assets/7bb9ceaf-ad02-4ce9-b760-6e59ac7b5be3)

