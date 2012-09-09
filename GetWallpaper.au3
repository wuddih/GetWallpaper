#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Change2CUI=y
#AutoIt3Wrapper_Res_Comment=This is useful if you have many wallpapers and just want to get the current one for sharing/etc.
#AutoIt3Wrapper_Res_Description=Locates your current desktop wallpaper and copies the file in the directory of this tool.
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=sm00th
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Run_Tidy=y
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
Global Const $SPI_GETDESKWALLPAPER = 115
$Wallpaper = DllStructCreate("char[256]")
DllStructSetData($Wallpaper, 1, 0)
DllCall("user32.dll", "int", "SystemParametersInfo", "int", $SPI_GETDESKWALLPAPER, "int", 255, "ptr", DllStructGetPtr($Wallpaper), "int", 0)
$src = DllStructGetData($Wallpaper, 1)
$dest = @DesktopDir
$copyfily = FileCopy($src, $dest, 1)
$fily = InputBox("Rename File", "You can rename the file, if you want.")
$renamefily = FileMove($dest & "\TranscodedWallpaper.jpg", $dest & "\" & $fily, 1)
