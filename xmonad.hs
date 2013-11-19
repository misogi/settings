import XMonad
import XMonad.Util.Run(spawnPipe)

main = do
  
  xmonad $ defaultConfig
    {
      terminal = "urxvt",
      focusFollowsMouse = False
    }
