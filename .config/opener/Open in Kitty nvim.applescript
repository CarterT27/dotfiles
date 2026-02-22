on open inputFiles
    set launcherPath to POSIX path of (path to resource "open-in-kitty-nvim.zsh")
    set quotedLauncher to quoted form of launcherPath
    set fileArgs to ""

    repeat with oneFile in inputFiles
        set fileArgs to fileArgs & " " & quoted form of POSIX path of oneFile
    end repeat

    try
        do shell script "/bin/zsh " & quotedLauncher & fileArgs
    on error errMsg number errNum
        if errNum is not 0 then
            return
        end if
    end try
end open
