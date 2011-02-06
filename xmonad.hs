import XMonad
import qualified XMonad.Util.CustomKeys as C
import XMonad.Hooks.XPropManage
import qualified XMonad.StackSet as W
import qualified Data.Map as M

main = xmonad defaultConfig {
     modMask = mod4Mask,
     terminal = "urxvt -bg black -fg white -vb +sb",
     borderWidth = 0,
     keys = myKeys,
     manageHook = myManageHook
}

myKeys c@(XConfig { XMonad.modMask = modMask})  = (M.fromList 
       [((mod4Mask .|. controlMask, xK_d), spawn "setxkbmap dk"),
        ((mod4Mask .|. controlMask, xK_c), 
        spawn "xclip -o --selection clipboard | xargs -0 xdotool type --clearmodifiers"), 
         ((mod4Mask .|. controlMask, xK_u), spawn $ foldl1 (\a b -> a ++ "; " ++ b)
	 ["setxkbmap us",           
	  "xmodmap -e \"keycode 49 = section plusminus\"",
	  "xmodmap -e \"keycode 94 = grave asciitilde\""])]) `M.union` 
	 (keys defaultConfig c)
       
myManageHook = xPropManageHook [
             ([ (wM_CLASS, any ("Emacs" ==)) ], 
              pmP (W.shift "1")),
             ([ (wM_CLASS, any ("Navigator" ==))],
              pmP (W.shift "2"))
             ] 

