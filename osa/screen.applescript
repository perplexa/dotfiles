use framework "AppKit"

set mainScreen to current application's NSScreen's mainScreen()
set frame to mainScreen's visibleFrame()
set screenW to (current application's NSWidth(frame)) as integer
set screenH to (current application's NSHeight(frame)) as integer
set originX to (current application's NSMinX(frame)) as integer
set originY to (current application's NSMinY(frame)) as integer

-- 10% boundary on each side = 80% usable area
set padX to (screenW * 0.1) as integer
set padY to (screenH * 0.1) as integer
set maxW to screenW - (padX * 2)
set maxH to screenH - (padY * 2)

set menuBarTop to 25

tell application "System Events"
    set allProcesses to every process whose visible is true
    repeat with proc in allProcesses
        tell proc
            repeat with w in (every window)
                try
                    set {winX, winY} to position of w
                    set {winW, winH} to size of w

                    -- skip windows already on the primary screen
                    if winX ≥ originX and winX < (originX + screenW) and winY ≥ 0 and winY < (menuBarTop + screenH) then
                        -- window is on primary screen, leave it alone
                    else
                        if winW > maxW then set winW to maxW
                        if winH > maxH then set winH to maxH

                        set newX to (originX + ((screenW - winW) / 2)) as integer
                        set newY to (menuBarTop + ((screenH - winH) / 2)) as integer

                        set size of w to {winW, winH}
                        set position of w to {newX, newY}
                    end if
                end try
            end repeat
        end tell
    end repeat
end tell
