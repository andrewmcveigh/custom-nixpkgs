import XMonad
import XMonad.Actions.CycleWS(toggleWS)
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Place
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ToggleLayouts
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import System.Exit
import System.IO
import qualified XMonad.StackSet as W

winManageHook = composeAll
  [ className =? "Chromium"    --> doShift "1:web"
  , className =? "Slack"       --> doShift "9:chat"
  ]

startup = do
  spawnOnce "xmobar"

main = do
  xmonad $ desktopConfig
    { modMask = mod4Mask
    , focusFollowsMouse = False
    , manageHook = manageDocks <+> winManageHook <+> manageHook desktopConfig
    , layoutHook = toggleLayouts(noBorders Full) $ smartBorders $ layoutHook desktopConfig
    , handleEventHook = docksEventHook <+> handleEventHook desktopConfig
    , borderWidth = 1
    , terminal = "gnome-terminal"
    , startupHook = startup
    } `additionalKeysP`
    [ ( "M-<Space>" , spawn "exe=`dmenu_run -fn 'Fira Code-12'` && eval \"exec $exe\"" )
    , ( "M-S-q" , io ( exitWith ExitSuccess ) )
    , ( "M-S-w" , withFocused $ windows . W.sink )
    , ( "M-t" , sendMessage ToggleStruts )
    , ( "M-q" , kill )
    , ( "<XF86MonBrightnessDown>",   spawn "light -U 5" )
    , ( "<XF86MonBrightnessUp>",     spawn "light -A 5" )
    , ( "M-<XF86MonBrightnessDown>", spawn "light -U 1" )
    , ( "M-<XF86MonBrightnessUp>",   spawn "light -A 1" )
    , ( "M-S-<XF86MonBrightnessUp>", spawn "kbdlight" )
    , ( "<XF86AudioMute>",        spawn "/home/andrewmcveigh/code/bin/volume toggle-mute" )
    , ( "<XF86AudioLowerVolume>", spawn "/home/andrewmcveigh/code/bin/volume down" )
    , ( "<XF86AudioRaiseVolume>", spawn "/home/andrewmcveigh/code/bin/volume up" )
    ] `removeKeysP`
    [ "M-p"
    , "M-S-c"
    ]
