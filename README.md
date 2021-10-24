<p align="center">
  <img src="https://user-images.githubusercontent.com/51217386/113720504-b505b400-96bc-11eb-8457-a40faf222c4e.png"/>
  <a href="https://youtu.be/Jw_NSXn3UMI" target="_blank">YouTube Demo</a>
</p>

# Game Info
Imperishable Dawn is a SHMUP (also known as Shoot 'em up) styled game built in MIPS assembly. 

<p align="center">
  <img src="https://cdn.discordapp.com/attachments/754698019823419462/828731538509922304/final.gif" height="400"/>
</p>

The game features a `64 x 64` pixel display and uses the `Keyboard and Display MMIO Simulator` for input.\
The goal of the game is to survive for as long as you can.
If an enemy collides with you, you lose a life. If you lose all 3 lives, it's game over!

The game starts off with 4 enemies, and increases the max number of enemies allowed up to a maximum of 16.

## Controls
To move, use the `WASD` keys\
To shoot your laser, press the `spacebar` key\
To play/restart the game at any point, press the `P` key.
The laser ability wipes out every enemy in your path, and takes 12 seconds to recharge.

# Running MARS
## Locally
This game is built in [MARS 4.5](http://courses.missouristate.edu/kenvollmar/mars/ "http://courses.missouristate.edu/kenvollmar/mars/")

Run 
```bash
curl --location 'https://courses.missouristate.edu/KenVollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar' --output mars.jar

java -jar 'mars.jar'
```

## Docker
**Only works in Linux with X11 windowing system**
```bash
make docker-run
```
You can force kill the running container by running
```bash
make docker-kill
```
# Assembling and Running

1. Open `game.asm`

2. Before building and running, open `Tools` -> `Bitmap Display` and `Keyboard and Display MMIO Simulator` and connect both to MIPS\
  In order to get the bitmap display working, set the following properties:
     - Unit Width in Pixels: `8`
     - Unit Height in Pixels: `8`
     - Display Width in Pixels: `512`
     - Display Height in Pixels: `512`
     - Base address for display `0x10008000`

3. Then `Assemble the current file and clear breakpoints` and `Run the current program`
