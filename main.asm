# Pokemon Matchup Simulator
# A RISC-V (RARS) program that simulates a simple matchup between the types of two of any of the first 100 Generation 1 Pokemons. Developed for DLSU LBYARCH course (T3 2023-2024).
# By John Lorenzo Tapia
#
# GitHub repository:
# https://github.com/tapeau/LBYARCH.pokemon-matchup-simulator
# ------------------------
# Program macros
.macro PROMPT
li a7, 4
ecall
li a7, 5
ecall
.end_macro

.macro DO_MATCHUP %a %x %b %y %z
lb s8, %a(%x)
lb s9, %b(%y)
GET_MATCHUP_SCORE
flw %z, 0(a0)
.end_macro

.macro GET_MATCHUP_SCORE
addi t0, s8, -65 # Convert from ASCII number to alphabetical position
addi t1, s9, -65 # Convert from ASCII number to alphabetical position
la t3, matchups # Get matchup score
flw fs8, 72(t3) # Set fs8
mul t4, s2, t0 # Go to row
add t4, t4, t1 # Go to column
mul t4, t4, s1 # Multiply by 4 (size of each float in the array)
add a0, t3, t4 # Point s10 to matchup score
.end_macro

# Program data
# Legend:
# A = Normal
# B = Fighting
# C = Flying
# D = Poison
# E = Ground
# F = Rock
# G = Bug
# H = Ghost
# I = Steel
# J = Fire
# K = Water
# L = Grass
# M = Electric
# N = Psychic
# O = Ice
# P = Dragon
# Q = Dark
# R = Fairy
# @ = None
# NOTE: Each element in the "matchups" array can be accessed through increments of 4
# NOTE: Each element in the "pokemons" array can be accessed through increments of 3
.data
matchups: .float 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 0.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.5, 0.5, 1.0, 2.0, 0.5, 0.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 2.0, 0.5, 1.0, 2.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 1.0, 2.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 0.5, 0.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.0, 2.0, 1.0, 2.0, 0.5, 1.0, 2.0, 2.0, 1.0, 0.5, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 2.0, 1.0, 0.5, 2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 2.0, 0.5, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 0.5, 1.0, 2.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 2.0, 0.5, 0.5, 2.0, 1.0, 1.0, 2.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 1.0, 1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 2.0, 2.0, 0.5, 1.0, 0.5, 0.5, 2.0, 0.5, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 2.0, 1.0, 1.0, 0.5, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 0.5, 1.0, 2.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 1.0
pokemons: .asciz "LD", "LD", "LD", "J@", "J@", "JC", "K@", "K@", "K@" "G@", "G@", "GC", "GD", "GD", "GD", "AC", "AC", "AC", "A@", "A@", "AC", "AC", "D@", "D@", "M@", "M@", "E@", "E@", "D@", "D@", "DE", "D@", "D@", "DE", "A@", "A@", "J@", "J@", "A@", "A@", "DC", "DC", "LD", "LD", "LD", "GL", "GL", "GD", "GD", "E@", "E@", "A@", "A@", "K@", "K@", "B@", "B@", "J@", "J@", "K@", "K@", "KB", "N@", "N@", "N@", "B@", "B@", "B@", "LD", "LD", "LD", "KD", "KD", "FE", "FE", "FE", "J@", "J@", "KN", "KN", "M@", "M@", "AC", "AC", "AC", "K@", "KO", "D@", "D@", "K@", "KO", "HD", "HD", "HD", "FE", "N@", "N@", "K@", "K@", "M@"
first_prompt: .asciz "Enter the number of Pokemon X: "
second_prompt: .asciz "Enter the number of Pokemon Y: "
winner_notice: .asciz "Winner of the matchup: "
poke_X_number: .space 1
poke_Y_number: .space 1

.text
# Designation of registers:
# s0 = address of array "pokemons"
# s1 = constant value of 4 (to be used to traverse through array "matchups")
# s2 = constant value of 18 (to be used to traverse through array "matchups")
# s3 = constant value of 3 (to be used to traverse through array "pokemons")
# s6 = address of Pokemon X inside array "pokemons"
# s7 = address of Pokemon Y inside array "pokemons"
# Initialize registers
li s1, 4
li s2, 18
li s3, 3
la s0, pokemons
sub s0, s0, s3

# Get user input for Pokemon X
la a0, first_prompt
PROMPT
mv s6, a0

# Store to variable
la t0, poke_X_number
sb a0, (t0)

# Get user input for Pokemon Y
la a0, second_prompt
PROMPT
mv s7, a0

# Store to variable
la t0, poke_Y_number
sb a0, (t0)

# Locate Pokemon X inside array, and store corresponding string to their respective register
mul s6, s6, s3
add s6, s0, s6

# Locate Pokemon Y inside array, and store corresponding string to their respective register
mul s7, s7, s3
add s7, s0, s7

# Get matchup scores
# Abbreviation: 1st element of Pokemon X = 1X, 1st element of Pokemon Y = 1Y, etc.
# Designation of registers:
# fs0 = score of 1X vs. 1Y OR (1X vs. 1Y) * (1X vs. 2Y) => 1st score of Pokemon X => Final score of Pokemon X
# fs1 = score of 1Y vs. 1X OR (1Y vs. 1X) * (1Y vs. 2X) => 1st score of Pokemon Y => Final score of Pokemon Y
# fs2 = score of 1X vs. 2Y
# fs3 = score of 2Y vs. 1X OR (2Y vs. 1X) * (2Y vs. 2X) => 2nd score of Pokemon Y
# fs4 = score of 2X vs. 1Y OR (2X vs. 1Y) * (2X vs. 2Y) => 2nd score of Pokemon X
# fs5 = score of 1Y vs. 2X
# fs6 = score of 2X vs. 2Y
# fs7 = score of 2Y vs. 2X
# fs8 = constant value of 2.0 (to be used to get average scores)
# s8 = register to hold left-hand side of "vs." equation (i.e. ___ vs.)
# s9 = register to hold right-hand side of "vs." equation (i.e. vs. ___)
# s10 = flag for the presence of a 2nd element in Pokemon X
# s11 = flag for the presence of a 2nd element in Pokemon Y
# Set s10 flag
lb s8, 1(s6)
addi s10, s8, -65

# Set s11 flag
lb s8, 1(s7)
addi s11, s8, -65

# 1X vs. 1Y
DO_MATCHUP(0,s6,0,s7,fs0)

# 1Y vs. 1X
DO_MATCHUP(0,s7,0,s6,fs1)

# 1X vs. 2Y
# First, check if Pokemon Y has no (@) 2nd element
bltz s11, NO_2Y
DO_MATCHUP(0,s6,1,s7,fs2)
fmul.s fs0, fs0, fs2 # Multiply with 1X vs. 1Y

# 2Y vs. 1X
DO_MATCHUP(1,s7,0,s6,fs3)
NO_2Y:

# 2X vs. 1Y
# First, check if Pokemon X has no (@) 2nd element
bltz s10, NO_2X
DO_MATCHUP(1,s6,0,s7,fs4)

# 1Y vs. 2X
DO_MATCHUP(0,s7,1,s6,fs5)
fmul.s fs1, fs1, fs5 # Multiply with 1Y vs. 1X
NO_2X:

# 2X vs. 2Y
# First, check if either Pokemon X and Y have no (@) 2nd element
bltz s10, NO_2XY
bltz s11, NO_2XY
DO_MATCHUP(1,s6,1,s7,fs6)
fmul.s fs4, fs4, fs6 # Multiply with 2X vs. 1Y

# 2Y vs. 2X
DO_MATCHUP(1,s7,1,s6,fs7)
fmul.s fs3, fs3, fs7 # Multiply with 2Y vs. 1X
NO_2XY:

# Average the pair of scores (if any) of each Pokemon
# For Pokemon X, check first if it has a 2nd score (exists if it has a 2nd element)
bltz s10, NO_2X_SCORE

# Get average score of Pokemon X
fadd.s fs0, fs0, fs4
fdiv.s fs0, fs0, fs8
NO_2X_SCORE:

# For Pokemon Y, check first if it has a 2nd score (exists if it has a 2nd element)
bltz s11, NO_2Y_SCORE

# Get average score of Pokemon Y
fadd.s fs1, fs1, fs3
fdiv.s fs1, fs1, fs8
NO_2Y_SCORE:

# Print winner notice
li a7, 4
la a0, winner_notice
ecall

# If Pokemon X and Y are tied
li a7, 1
li a0, -1
feq.s t0, fs0, fs1
bne t0, zero, END

# If Pokemon X is the winner
flt.s t0, fs0, fs1
bne t0, zero, WIN_Y
la a0, poke_X_number
lb a0, 0(a0)
j END
WIN_Y:

# If Pokemon Y is the winner
la a0, poke_Y_number
lb a0, 0(a0)
END:
ecall
