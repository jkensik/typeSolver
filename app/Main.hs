module Main where

import Data.Type.Equality
import GHC.Exts (Constraint)

main :: IO ()
main = putStrLn "a"

-- set u info, or use for (~~)
-- M's arg sets instance cover ; Can I use u in body?
type data M :: Solver (u::k) -> * -- where
-- X :: (f a ~~ M b) => M a
-- Y :: M a -- constrains kind on a param for O b
-- Z :: M S
-- add info about a


type data Solver :: k -> * -- where
-- S :: Solver a -- add info to a for setting b in M b
                -- maybe more to set a:: M b in O b
-- add standalone kind signature

-- type OT :: forall k g. Solver k  -> Solver g -> Constraint
class OT (b :: Solver (u:: k)) (a :: Solver b) | b -> a where -- pass kind info
  -- add info to o
  -- add kind sig/ you dont need it
  type Sub a = (o :: M b)  | o -> a b


-- relate M to Solver in qconstraint
-- a:: M (S)
-- class ( forall a. Sub a ~ a => OT a b) => O b
-- ^ use induction , standalone kind signature
-- how does k0 get added ?
type O :: forall (k :: Solver u) -> Constraint
class (forall g. OT b (g :: Solver b)) => O (b :: Solver u)

--data Val --where -- add (forall x. OT a b) => val
--  Test :: (O b) => Val -- pass kind info

-- could not deduce OT a1 S
-- from OT a S
--instance (forall a. OT a S) => O S


-- allow standalone kind sig in assoc. type
