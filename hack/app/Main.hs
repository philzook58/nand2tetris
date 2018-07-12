module Main where

import Lib
import Text.Parsec

main :: IO ()
main = parseTest (oneOf "aeiou") "a" -- someFunc



--manyOf line  eof
{-
regD = char 'D'
regM = char 'M'
regA = char 'A'

reg = oneOf "DMA"

at = char "@"
-}

numericLit ::Parsec String () Memory
numericLit = Lit . read <$> many1 digit {-do 
	           x <- many1 digit
	           return $ Lit (read x) -}

xreg :: Parsec String () Register
xreg = read . return <$> oneOf "DMA"{-do 
		r <- oneOf "DMA"
		return $ case r of
					'D' -> XD
					'M' -> XM
					'A' -> XA -}
yreg :: Parsec String () Y
yreg = 	do
		r <- oneOf "DMA1"
		return $ case r of
					'D' -> YD
					'M' -> YM
					'A' -> YA
					'1' -> YOne
comment :: Parsec String () ()
comment = spaces >> string "//" >> noneOf "\n" >> endOfLine >> return ()

command = ainstr <|> cinstr

cinstr = anyChar
var = Var <$> (:) <$> letter <*> many alphaNum

ainstr =  char "@" >> (numericLit <|> Var 
{-
parsefile = many $ do
			many comment 
			cmd <- readCommand
			endOfLine
			return cmd
-}
{-
do at
   <- (letter >>= (many alphaNum)) <|> ()
-}

