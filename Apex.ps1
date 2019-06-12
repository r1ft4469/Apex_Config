# Script Vars
$ApexLauchOptions = '-novid +fps_max unlimited -threads 4 -high -fullscreen'
$DesktopHrz = 60
$DesktopWidth = 1920
$DesktopHeight = 1080
$ApexHrz = 50
$ApexScreenWidth = 1440
$ApexScreenHeight = 1080

# .Net Hide Console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
Function Hide-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()
    #0 hide
    [Console.Window]::ShowWindow($consolePtr, 0)
}


# Main Script To Start Apex
Hide-Console
.\ChangeScreenResolution /w=$ApexScreenWidth /h=$ApexScreenHeight /d=0
Start-Process -FilePath ${env:ProgramFiles(x86)}'\Origin Games\Apex\r5apex.exe' -ArgumentList $ApexLauchOptions -Wait 
.\ChangeScreenResolution /w=$DesktopWidth /h=$DesktopHeight /d=0