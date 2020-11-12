import Control.Applicative
import System.Environment (getArgs)

brightnessDelta :: Int
brightnessDelta = 8

brightnessFilename :: String
brightnessFilename = "/sys/class/backlight/intel_backlight/brightness"

maxBrightnessFilename :: String
maxBrightnessFilename = "/sys/class/backlight/intel_backlight/max_brightness"

currentBrightness :: IO Int
currentBrightness = do
  val <- read <$> readFile brightnessFilename
  return $! val

changeBrightness :: String -> [String] -> IO ()
changeBrightness mode args = do
  value <- currentBrightness
  maxValue <- read <$> readFile maxBrightnessFilename
  let value' = case mode of
        "up" -> value + brightnessDelta
        "down" -> value - brightnessDelta
        "set" -> read (head args)
        _ -> error "Unrecognized mode"
  let value'' = min maxValue $ max 0 value'
  print value''
  writeFile brightnessFilename $! show value''

usage :: IO ()
usage = do
  putStrLn "Usage:"
  putStrLn "  light up         - increase by 8"
  putStrLn "  light down       - decrease by 8"
  putStrLn "  light set <val>  - set value to <val>"

main :: IO ()
main = do
  args <- getArgs
  if null args
    then usage
    else do
      let mode = head args
      changeBrightness mode (tail args)
