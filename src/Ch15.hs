{-# LANGUAGE InstanceSigs #-}

module Ch15 where

import Data.Monoid

data Optional a =
  Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty :: Optional a
  mempty = Nada

  mappend :: Optional a -> Optional a -> Optional a
  mappend Nada Nada = Nada
  mappend Nada (Only b) = Only b
  mappend (Only a) Nada = Only a
  mappend (Only a) (Only b) = Only $ mappend a b



type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String

madlibbin' :: Exclamation
  -> Adverb
  -> Noun
  -> Adjective
  -> String
madlibbin' e adv noun adj =
  e
  <> "! he said " <>
  adv <> " as he jumped into his car " <>
  noun <> " and drove off with his " <>
  adj <> " wife."

madlibbinBetter' :: Exclamation
  -> Adverb
  -> Noun
  -> Adjective
  -> String
madlibbinBetter' e adv noun adj = mconcat
  [e, "! he said ", adv, " as he jumped into his car "
  , noun, " and drove off with his ", adj, " wife."]
