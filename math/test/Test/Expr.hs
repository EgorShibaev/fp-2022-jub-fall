module Test.Expr where

import Test.Tasty.HUnit
import Test.Tasty

import Control.Exception (assert)
import Expr
import Data.Set as Set
import Data.Map as Map

x = Var "x"
y = Var "y"
z = Var "z"
minus = BinOp Minus
plus = BinOp Plus
mult = BinOp Mult
div = BinOp Div

unit_vars = do
    variables (Number 1.0) @?= Set.empty
    variables x @?= Set.singleton "x"
    variables (x `minus` y `plus` z `minus` x `plus` y `minus` z) @?= Set.fromList ["x", "y", "z"]
    variables (UnaryOp Cos $ BinOp Pow x $ UnaryOp Abs y) @?= Set.fromList ["x", "y"]

unit_set_val = do
    setValues (x `minus` y `plus` z `minus` x `plus` y `minus` z) (Map.fromList [("x", 1), ("y", 2)])
        @?= (Number 1 `minus` Number 2 `plus` z `minus` Number 1 `plus` Number 2 `minus` z)

unit_eval = do
    eval (x `plus` x) "x" 1 @?= 2
    eval (x `mult` x `minus` x `plus` x `plus` Number 2) "x" 2 @?= 6

props :: [TestTree]
props = 
  [ testCase "vars" unit_vars
  , testCase "set_vals" unit_set_val
  , testCase "eval" unit_eval
  ]