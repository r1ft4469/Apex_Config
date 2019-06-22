# Script Vars
$ApexLauchOptions = '-novid +fps_max unlimited -threads 4 -high -windowed +mat_letterbox_aspect_goal 1.33 +mat_letterbox_aspect_threshold 1.33'
$DesktopHrz = 60
$DesktopWidth = 1920
$DesktopHeight = 1080
$ApexHrz = 50
$ApexScreenWidth = 1280
$ApexScreenHeight = 960

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
Stop-Process -Name "CenterTaskbar"
.\ChangeScreenResolution /w=$ApexScreenWidth /h=$ApexScreenHeight /d=0
Start-Process -FilePath "C:\Users\r1ft\Documents\CenterTaskbar.exe"
Start-Process -FilePath ${env:ProgramFiles(x86)}'\Origin Games\Apex\r5apex.exe' -ArgumentList $ApexLauchOptions -Wait 
Stop-Process -Name "CenterTaskbar"
.\ChangeScreenResolution /w=$DesktopWidth /h=$DesktopHeight /d=0
Start-Process -FilePath "C:\Users\r1ft\Documents\CenterTaskbar.exe"