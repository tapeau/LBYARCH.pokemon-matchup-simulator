# Pokemon Matchup Simulator
A RISC-V (RARS) program that simulates a simple matchup between the types of two of any of the first 100 Generation 1 Pokemons. Developed for DLSU LBYARCH course (T3 2023-2024).

## Running the program
This program was built using [RARS — RISC-V Assembler and Runtime Simulator](https://github.com/TheThirdOne/rars). You will need a copy of that program in order to run the code written here. Then you can either copy the whole code from the file `main.asm` and paste it in RARS, or download a copy of the file and then open it in RARS.

## Example
- Let's take two Pokemons, say #3 (Venusaur) and #6 (Charizard). The numbers used to represent them are their Pokedex Index Number.
- We'll start with Venusaur. His first type is `grass`. For each of Venusaur's opponent's types, the grass effectiveness is obtained. Here, against Charizard, the grass is `0.5x` (not very) effective against both fire and flying. Multiplying these together: `0.5 * 0.5 = 0.25`. So `grass` is `0.25` effective against Charizard.
- This is repeated with Venusaur's second type, `poison`, and Venusar will receive two scores for his two types: `(0.25, 1.0)`. Average these together to get Venusaur's final score: `0.625`. When a Pokemon only has one type, they will subsequently only have one score, and no averaging will be done.
- When this process is done for both Pokemons, there will be two scores — one for each Pokemon. THe program returns the Pokedex Index Number of the Pokemon with the higher score. If the matchup resulted into a tie, the program returns the value `-1`.
