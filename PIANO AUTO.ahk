#Requires AutoHotkey v2.0

if HasInternet() {
    try {
        if FileExist(A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk.tmp")
            FileDelete(A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk.tmp")

        Download(
            "https://raw.githubusercontent.com/bieleal/virtual-piano-auto/main/sourcecode",
            A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk.tmp"
        )

        FileMove(
            A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk.tmp",
            A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk",
            1
        )
    } catch {
        if FileExist(A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk.tmp")
            try FileDelete(A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk.tmp")
    }
}

if !FileExist(A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk") {
    MsgBox "Local script not found and download failed."
    ExitApp
}

Run('"' A_Temp "\~SAVOIUFGSFH22_ASVV76.ahk" '"')
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
