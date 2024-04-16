import Data.Maybe
import Distribution.Simple
import Distribution.Simple.UserHooks
import Distribution.Verbosity
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Program
import Distribution.Simple.Program.Db

main :: IO ()
main = defaultMainWithHooks simpleUserHooks
  { buildHook = \pkg lbi hooks flags -> do
      let myProgName = "buildtool"
          myProg = simpleProgram myProgName
          prog = lookupProgram myProg (withPrograms lbi)
      putStrLn $ myProgName ++ ": " ++ show prog
      putStrLn "Running prog..."
      runProgram normal (fromJust prog) []
      putStrLn "Done.!"
      buildHook simpleUserHooks pkg lbi hooks flags
  }
