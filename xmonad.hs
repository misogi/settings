import XMonad
import XMonad.Util.Run(spawnPipe)

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    {
      terminal = "urxvt"
    }
