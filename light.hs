import Control.Applicative
import System.Environment (getArgs)

brightnessDelta :: Int
brightnessDelta = 8

brightnessFilename :: String
brightnessFilename = "/sys/class/backlight/intel_backlight/brightness"

maxBrightnessFilename :: String
maxBrightnessFilename = "/sys/class/backlight/intel_backlight/max_brightness"

changeBrightness :: String -> IO ()
changeBrightness mode = do
  value <- read <$> readFile brightnessFilename
  maxValue <- read <$> readFile maxBrightnessFilename
  let delta = case mode of
        "up" -> brightnessDelta
        "down" -> - brightnessDelta
        _ -> error "Expected mode to be 'up' or 'down'"
  print delta
  let value' = min maxValue $ max 0 $ value + delta
  writeFile brightnessFilename $! show value'

usage :: IO ()
usage = putStrLn "Usage: light up/down"

main :: IO ()
main = do
  args <- getArgs
  if null args
    then usage
    else do
      let mode = head args
      changeBrightness mode
