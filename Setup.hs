import Distribution.Simple
import Distribution.Simple.UserHooks
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Program
import Distribution.Simple.Program.Db

main :: IO ()
main = defaultMainWithHooks simpleUserHooks
  { buildHook = \pkg lbi hooks flags -> do
      let myProgName = "buildtool"
          myProg = simpleProgram myProgName
      putStrLn $ myProgName ++ ": " ++ show (lookupProgram myProg (withPrograms lbi))
      buildHook simpleUserHooks pkg lbi hooks flags
  }
