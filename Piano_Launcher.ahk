#Requires AutoHotkey v2.0

tempScript := A_Temp "\virtual_piano_temp.ahk"
tempFile := tempScript ".tmp"

if HasInternet() {
    try {
        if FileExist(tempFile)
            FileDelete(tempFile)

        Download(
            "https://raw.githubusercontent.com/the-sleepless/virtual-piano-auto/main/sourcecode",
            tempFile
        )

        if FileExist(tempScript)
            try FileDelete(tempScript)

        FileMove(tempFile, tempScript, 1)
    } catch {
        if FileExist(tempFile)
            try FileDelete(tempFile)
    }
}

if !FileExist(tempScript) {
    MsgBox "Local script not found and download failed."
    ExitApp
}

Run(A_AhkPath ' "' tempScript '"')
ExitApp

HasInternet() {
    try {
        r := ComObject("WinHttp.WinHttpRequest.5.1")
        r.Open("HEAD", "https://raw.githubusercontent.com/", false)
        r.SetTimeouts(1500, 1500, 1500, 1500)
        r.Send()
        return r.Status >= 200 && r.Status < 500
    } catch {
        return false
    }
}
