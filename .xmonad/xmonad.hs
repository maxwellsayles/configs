import System.Process (createProcess, shell)
import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig

import qualified XMonad.Util.Brightness as Brightness

main :: IO ()
main = do
     _ <- createProcess $ shell "~/.fehbg"
     xmonad $ desktopConfig
       { modMask = mod4Mask
       , terminal = "gnome-terminal"
       , normalBorderColor = "#303030"
       , focusedBorderColor = "#0050A0"
       , manageHook = myManageHook <+> manageHook defaultConfig
       } `additionalKeysP` moreKeys

myManageHook = composeAll
   [ className =? "vlc"  --> doFloat
   , className =? "Org.gnome.Nautilus"  --> doFloat
   ]

brightnessDelta :: Int
brightnessDelta = 16

moreKeys :: [(String, X())]
moreKeys =
       [ ("M-p", spawn "rofi -show run")
       , ("M-b", spawn "firefox")
       , ("<XF86MonBrightnessUp>", liftIO $ Brightness.change (+ brightnessDelta) *> (pure ()))
       , ("<XF86MonBrightnessDown>", liftIO $ Brightness.change (\x -> x - brightnessDelta) *> (pure ()))
       ]