#####################################################################
#
# CSCB58 Winter 2021 Assembly Final Project
# University of Toronto, Scarborough
#
# Student: Stephen, 1006313231, guostep2
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8 
# - Unit height in pixels: 8 
# - Display width in pixels: 512 
# - Display height in pixels: 512 
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# - Milestone 4 
#
# Which approved features have been implemented for milestone 4?
# 1. Smooth Graphics
# 2. Increasing Difficulty
# 3. Shoot Obstacles
#
# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# yes, and please share this project github link as well!
#
# Any additional information that the TA needs to know:
# Github Link: 
#
#####################################################################
# Bitmap display starter code
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8
# - Unit height in pixels: 8
# - Display width in pixels: 512
# - Display height in pixels: 512
# - Base Address for Display: 0x10008000 ($gp)
#####################################################################
# $t0 = game timer
# $t1 = location of player

# Game info
.eqv BASE_ADDRESS 	0x10008000
.eqv CANVAS_WIDTH 	64
.eqv CANVAS_HEIGHT 	64
.eqv REFRESH_RATE 	40 	# in miliseconds
.eqv RESPAWN_TIME	20 	# every frame has a 1/RESPAWN_TIME chance to spawn
.eqv LASER_CD 		300 	# Laser cooldown in ms
.eqv MAX_OBSTACLES	16	
.eqv ADD_ENEMY		175 	# add enemy every ADD_ENEMY/25 seconds

# Colors
.eqv PLAYER_BODY	0xffffff
.eqv PLAYER_EYE		0x7e00ff
.eqv BACKGROUND_COLOR	0xfcb945
.eqv OBSTACLE_EAR	0x000000
.eqv OBSTACLE_BODY	0xff6df3
.eqv OBSTACLE_EYE	0xff0000
.eqv LIVES_COLOR	0xff0000

.data
Obstacles: 		.space 	64 # Max 16 obstacles
Lives: 			.word 	3  # Number of lives
Num_Obstacles: 		.word	4  # Starting number of obstacles
LaserReady: 		.word	1  # Check if laser is ready
LaserCoolDownTimer: 	.word	0  # Timer for laser cooldown

.text
li $v0, 32		# syscall for sleeping for 30 ms
li $a0, 30
addi $t4, $zero, BASE_ADDRESS
addi $t3, $t4, 0
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 4
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12
sw $t5, 0($t3)
addi $t3, $t4, 16
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 20
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 24
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 28
sw $t5, 0($t3)
addi $t3, $t4, 32
sw $t5, 0($t3)
addi $t3, $t4, 36
li $t5, 0xeabfb3
sw $t5, 0($t3)
addi $t3, $t4, 40
li $t5, 0xf4e6df
sw $t5, 0($t3)
addi $t3, $t4, 44
li $t5, 0xf7bfb4
sw $t5, 0($t3)
addi $t3, $t4, 48
li $t5, 0xfdebe6
sw $t5, 0($t3)
addi $t3, $t4, 52
li $t5, 0xfbcfc6
sw $t5, 0($t3)
addi $t3, $t4, 56
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 60
sw $t5, 0($t3)
addi $t3, $t4, 64
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 68
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 72
li $t5, 0xfdc6bc
sw $t5, 0($t3)
addi $t3, $t4, 76
li $t5, 0xfcdfdb
sw $t5, 0($t3)
addi $t3, $t4, 80
li $t5, 0xfce0db
sw $t5, 0($t3)
addi $t3, $t4, 84
li $t5, 0xfbe6e2
sw $t5, 0($t3)
addi $t3, $t4, 88
li $t5, 0xfcdeda
sw $t5, 0($t3)
addi $t3, $t4, 92
li $t5, 0xfde5e1
sw $t5, 0($t3)
addi $t3, $t4, 96
li $t5, 0xeed0c8
sw $t5, 0($t3)
addi $t3, $t4, 100
li $t5, 0xd9b09c
sw $t5, 0($t3)
addi $t3, $t4, 104
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 108
sw $t5, 0($t3)
addi $t3, $t4, 112
sw $t5, 0($t3)
addi $t3, $t4, 116
sw $t5, 0($t3)
addi $t3, $t4, 120
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 124
li $t5, 0xfec0b5
sw $t5, 0($t3)
addi $t3, $t4, 128
li $t5, 0xfebeb4
sw $t5, 0($t3)
addi $t3, $t4, 132
li $t5, 0xfbcac2
sw $t5, 0($t3)
addi $t3, $t4, 136
li $t5, 0xf9c7be
sw $t5, 0($t3)
addi $t3, $t4, 140
li $t5, 0xfad0c9
sw $t5, 0($t3)
addi $t3, $t4, 144
li $t5, 0xfccbc2
sw $t5, 0($t3)
addi $t3, $t4, 148
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 152
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 156
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 160
sw $t5, 0($t3)
addi $t3, $t4, 164
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 168
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 172
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 176
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 180
sw $t5, 0($t3)
addi $t3, $t4, 184
sw $t5, 0($t3)
addi $t3, $t4, 188
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 192
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 196
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 200
sw $t5, 0($t3)
addi $t3, $t4, 204
sw $t5, 0($t3)
addi $t3, $t4, 208
sw $t5, 0($t3)
addi $t3, $t4, 212
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 216
li $t5, 0xfdd5cf
sw $t5, 0($t3)
addi $t3, $t4, 220
li $t5, 0xfecfc8
sw $t5, 0($t3)
addi $t3, $t4, 224
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 228
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 232
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 236
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 240
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 244
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 248
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 252
li $t5, 0xffc1b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 256
li $t5, 0xf5bec0
sw $t5, 0($t3)
addi $t3, $t4, 260
li $t5, 0xe6b7ce
sw $t5, 0($t3)
addi $t3, $t4, 264
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 268
sw $t5, 0($t3)
addi $t3, $t4, 272
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 276
li $t5, 0xf2bcb0
sw $t5, 0($t3)
addi $t3, $t4, 280
li $t5, 0xddafa0
sw $t5, 0($t3)
addi $t3, $t4, 284
li $t5, 0xe8b6a8
sw $t5, 0($t3)
addi $t3, $t4, 288
li $t5, 0xfac0b5
sw $t5, 0($t3)
addi $t3, $t4, 292
li $t5, 0xe5b5a7
sw $t5, 0($t3)
addi $t3, $t4, 296
li $t5, 0xd7ae9d
sw $t5, 0($t3)
addi $t3, $t4, 300
li $t5, 0xcda795
sw $t5, 0($t3)
addi $t3, $t4, 304
li $t5, 0xefcabb
sw $t5, 0($t3)
addi $t3, $t4, 308
li $t5, 0xfdc8be
sw $t5, 0($t3)
addi $t3, $t4, 312
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 316
li $t5, 0xfde4e0
sw $t5, 0($t3)
addi $t3, $t4, 320
li $t5, 0xfde0db
sw $t5, 0($t3)
addi $t3, $t4, 324
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 328
li $t5, 0xfbe8e4
sw $t5, 0($t3)
addi $t3, $t4, 332
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 336
li $t5, 0xffffff
sw $t5, 0($t3)
addi $t3, $t4, 340
li $t5, 0xfdf5f3
sw $t5, 0($t3)
addi $t3, $t4, 344
li $t5, 0xfde4e1
sw $t5, 0($t3)
addi $t3, $t4, 348
li $t5, 0xfce4e0
sw $t5, 0($t3)
addi $t3, $t4, 352
li $t5, 0xfce8e3
sw $t5, 0($t3)
addi $t3, $t4, 356
li $t5, 0xfddad5
sw $t5, 0($t3)
addi $t3, $t4, 360
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 364
sw $t5, 0($t3)
addi $t3, $t4, 368
sw $t5, 0($t3)
addi $t3, $t4, 372
li $t5, 0xe1b3d3
sw $t5, 0($t3)
addi $t3, $t4, 376
li $t5, 0xbaa3eb
sw $t5, 0($t3)
addi $t3, $t4, 380
li $t5, 0xfbb1ae
sw $t5, 0($t3)
addi $t3, $t4, 384
li $t5, 0xfeb2a8
sw $t5, 0($t3)
addi $t3, $t4, 388
li $t5, 0xfcc7bf
sw $t5, 0($t3)
addi $t3, $t4, 392
li $t5, 0xf9d0c7
sw $t5, 0($t3)
addi $t3, $t4, 396
li $t5, 0xf8cdc6
sw $t5, 0($t3)
addi $t3, $t4, 400
li $t5, 0xf9c4bc
sw $t5, 0($t3)
addi $t3, $t4, 404
li $t5, 0xdfabcd
sw $t5, 0($t3)
addi $t3, $t4, 408
li $t5, 0xba9ee8
sw $t5, 0($t3)
addi $t3, $t4, 412
li $t5, 0xfabab5
sw $t5, 0($t3)
addi $t3, $t4, 416
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 420
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 424
sw $t5, 0($t3)
addi $t3, $t4, 428
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 432
sw $t5, 0($t3)
addi $t3, $t4, 436
sw $t5, 0($t3)
addi $t3, $t4, 440
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 444
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 448
sw $t5, 0($t3)
addi $t3, $t4, 452
li $t5, 0xdfb3d3
sw $t5, 0($t3)
addi $t3, $t4, 456
li $t5, 0xbaa4eb
sw $t5, 0($t3)
addi $t3, $t4, 460
li $t5, 0xfac0bc
sw $t5, 0($t3)
addi $t3, $t4, 464
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 468
li $t5, 0xfcd6d1
sw $t5, 0($t3)
addi $t3, $t4, 472
li $t5, 0xfeeded
sw $t5, 0($t3)
addi $t3, $t4, 476
li $t5, 0xdecae9
sw $t5, 0($t3)
addi $t3, $t4, 480
li $t5, 0xb8a3ec
sw $t5, 0($t3)
addi $t3, $t4, 484
li $t5, 0xfac0bd
sw $t5, 0($t3)
addi $t3, $t4, 488
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 492
li $t5, 0xfec7be
sw $t5, 0($t3)
addi $t3, $t4, 496
li $t5, 0xfbd0c8
sw $t5, 0($t3)
addi $t3, $t4, 500
li $t5, 0xfdc6be
sw $t5, 0($t3)
addi $t3, $t4, 504
li $t5, 0xfec4bb
sw $t5, 0($t3)
addi $t3, $t4, 508
li $t5, 0xfec1b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 512
li $t5, 0xc6a9e4
sw $t5, 0($t3)
addi $t3, $t4, 516
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 520
li $t5, 0xf0bcc5
sw $t5, 0($t3)
addi $t3, $t4, 524
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 528
li $t5, 0xe1b1a1
sw $t5, 0($t3)
addi $t3, $t4, 532
li $t5, 0xddb3a5
sw $t5, 0($t3)
addi $t3, $t4, 536
li $t5, 0xfdc7bd
sw $t5, 0($t3)
addi $t3, $t4, 540
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 544
li $t5, 0xebb8aa
sw $t5, 0($t3)
addi $t3, $t4, 548
li $t5, 0xbe9f89
sw $t5, 0($t3)
addi $t3, $t4, 552
li $t5, 0xe4b3a4
sw $t5, 0($t3)
addi $t3, $t4, 556
li $t5, 0xf4c3b8
sw $t5, 0($t3)
addi $t3, $t4, 560
li $t5, 0xfccfc7
sw $t5, 0($t3)
addi $t3, $t4, 564
li $t5, 0xfdc2b7
sw $t5, 0($t3)
addi $t3, $t4, 568
li $t5, 0xfce7e3
sw $t5, 0($t3)
addi $t3, $t4, 572
li $t5, 0xfffefe
sw $t5, 0($t3)
addi $t3, $t4, 576
li $t5, 0xfdf9f7
sw $t5, 0($t3)
addi $t3, $t4, 580
li $t5, 0xfaedea
sw $t5, 0($t3)
addi $t3, $t4, 584
li $t5, 0xfcf6f4
sw $t5, 0($t3)
addi $t3, $t4, 588
li $t5, 0xfefbf9
sw $t5, 0($t3)
addi $t3, $t4, 592
li $t5, 0xfcfaf8
sw $t5, 0($t3)
addi $t3, $t4, 596
li $t5, 0xfdf4f2
sw $t5, 0($t3)
addi $t3, $t4, 600
li $t5, 0xfde5e2
sw $t5, 0($t3)
addi $t3, $t4, 604
sw $t5, 0($t3)
addi $t3, $t4, 608
li $t5, 0xfedfda
sw $t5, 0($t3)
addi $t3, $t4, 612
li $t5, 0xfdcdc5
sw $t5, 0($t3)
addi $t3, $t4, 616
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 620
sw $t5, 0($t3)
addi $t3, $t4, 624
sw $t5, 0($t3)
addi $t3, $t4, 628
li $t5, 0xcdace0
sw $t5, 0($t3)
addi $t3, $t4, 632
li $t5, 0x8e95fd
sw $t5, 0($t3)
addi $t3, $t4, 636
li $t5, 0xf6b0b3
sw $t5, 0($t3)
addi $t3, $t4, 640
li $t5, 0xfdb3a9
sw $t5, 0($t3)
addi $t3, $t4, 644
li $t5, 0xfcc5bc
sw $t5, 0($t3)
addi $t3, $t4, 648
li $t5, 0xfcccc5
sw $t5, 0($t3)
addi $t3, $t4, 652
li $t5, 0xfbcbc3
sw $t5, 0($t3)
addi $t3, $t4, 656
li $t5, 0xfbbdb4
sw $t5, 0($t3)
addi $t3, $t4, 660
li $t5, 0xc5a2e1
sw $t5, 0($t3)
addi $t3, $t4, 664
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 668
li $t5, 0xf1b8c2
sw $t5, 0($t3)
addi $t3, $t4, 672
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 676
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 680
sw $t5, 0($t3)
addi $t3, $t4, 684
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 688
sw $t5, 0($t3)
addi $t3, $t4, 692
sw $t5, 0($t3)
addi $t3, $t4, 696
sw $t5, 0($t3)
addi $t3, $t4, 700
sw $t5, 0($t3)
addi $t3, $t4, 704
li $t5, 0xfdc7bd
sw $t5, 0($t3)
addi $t3, $t4, 708
li $t5, 0xc3bef6
sw $t5, 0($t3)
addi $t3, $t4, 712
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 716
li $t5, 0xf2bcc5
sw $t5, 0($t3)
addi $t3, $t4, 720
li $t5, 0xf9bfb4
sw $t5, 0($t3)
addi $t3, $t4, 724
li $t5, 0xf5c8be
sw $t5, 0($t3)
addi $t3, $t4, 728
li $t5, 0xfbddda
sw $t5, 0($t3)
addi $t3, $t4, 732
li $t5, 0xc3abe7
sw $t5, 0($t3)
addi $t3, $t4, 736
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 740
li $t5, 0xf1bcc5
sw $t5, 0($t3)
addi $t3, $t4, 744
li $t5, 0xfdc9c0
sw $t5, 0($t3)
addi $t3, $t4, 748
li $t5, 0xfadad4
sw $t5, 0($t3)
addi $t3, $t4, 752
li $t5, 0xfde3de
sw $t5, 0($t3)
addi $t3, $t4, 756
li $t5, 0xfae6e1
sw $t5, 0($t3)
addi $t3, $t4, 760
li $t5, 0xfdd9d2
sw $t5, 0($t3)
addi $t3, $t4, 764
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 768
li $t5, 0xc5a9e5
sw $t5, 0($t3)
addi $t3, $t4, 772
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 776
li $t5, 0xf0bbc7
sw $t5, 0($t3)
addi $t3, $t4, 780
li $t5, 0xe8b8b5
sw $t5, 0($t3)
addi $t3, $t4, 784
li $t5, 0xcda9b7
sw $t5, 0($t3)
addi $t3, $t4, 788
li $t5, 0xf8cfcf
sw $t5, 0($t3)
addi $t3, $t4, 792
li $t5, 0xead1e3
sw $t5, 0($t3)
addi $t3, $t4, 796
li $t5, 0xf9d0ca
sw $t5, 0($t3)
addi $t3, $t4, 800
li $t5, 0xddc1bf
sw $t5, 0($t3)
addi $t3, $t4, 804
li $t5, 0xdab2bf
sw $t5, 0($t3)
addi $t3, $t4, 808
li $t5, 0xeeb8ac
sw $t5, 0($t3)
addi $t3, $t4, 812
li $t5, 0xdfc5b8
sw $t5, 0($t3)
addi $t3, $t4, 816
li $t5, 0xf6f1f3
sw $t5, 0($t3)
addi $t3, $t4, 820
li $t5, 0xecbac9
sw $t5, 0($t3)
addi $t3, $t4, 824
li $t5, 0xf5e8ed
sw $t5, 0($t3)
addi $t3, $t4, 828
li $t5, 0xededfd
sw $t5, 0($t3)
addi $t3, $t4, 832
li $t5, 0xfbf9f8
sw $t5, 0($t3)
addi $t3, $t4, 836
li $t5, 0xfbf3f0
sw $t5, 0($t3)
addi $t3, $t4, 840
li $t5, 0xfaefed
sw $t5, 0($t3)
addi $t3, $t4, 844
li $t5, 0xf5eaea
sw $t5, 0($t3)
addi $t3, $t4, 848
li $t5, 0xe4e3f9
sw $t5, 0($t3)
addi $t3, $t4, 852
li $t5, 0xe2e0f8
sw $t5, 0($t3)
addi $t3, $t4, 856
li $t5, 0xf7f2f6
sw $t5, 0($t3)
addi $t3, $t4, 860
li $t5, 0xfdeeea
sw $t5, 0($t3)
addi $t3, $t4, 864
li $t5, 0xf6d6d9
sw $t5, 0($t3)
addi $t3, $t4, 868
li $t5, 0xebb9ca
sw $t5, 0($t3)
addi $t3, $t4, 872
li $t5, 0xf8bebe
sw $t5, 0($t3)
addi $t3, $t4, 876
li $t5, 0xe7b6ce
sw $t5, 0($t3)
addi $t3, $t4, 880
li $t5, 0xfcc1ba
sw $t5, 0($t3)
addi $t3, $t4, 884
li $t5, 0xf9bebf
sw $t5, 0($t3)
addi $t3, $t4, 888
li $t5, 0xebb8c9
sw $t5, 0($t3)
addi $t3, $t4, 892
li $t5, 0xfebbb0
sw $t5, 0($t3)
addi $t3, $t4, 896
li $t5, 0xffbeb4
sw $t5, 0($t3)
addi $t3, $t4, 900
li $t5, 0xefbac7
sw $t5, 0($t3)
addi $t3, $t4, 904
li $t5, 0xdeb0d0
sw $t5, 0($t3)
addi $t3, $t4, 908
li $t5, 0xeaaec0
sw $t5, 0($t3)
addi $t3, $t4, 912
li $t5, 0xfdbbb0
sw $t5, 0($t3)
addi $t3, $t4, 916
li $t5, 0xc4a7e5
sw $t5, 0($t3)
addi $t3, $t4, 920
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 924
li $t5, 0xedb9c8
sw $t5, 0($t3)
addi $t3, $t4, 928
li $t5, 0xefbac8
sw $t5, 0($t3)
addi $t3, $t4, 932
li $t5, 0xfdc0ba
sw $t5, 0($t3)
addi $t3, $t4, 936
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 940
sw $t5, 0($t3)
addi $t3, $t4, 944
li $t5, 0xfdc0ba
sw $t5, 0($t3)
addi $t3, $t4, 948
li $t5, 0xedb9c9
sw $t5, 0($t3)
addi $t3, $t4, 952
li $t5, 0xfbbfbd
sw $t5, 0($t3)
addi $t3, $t4, 956
li $t5, 0xecb9ca
sw $t5, 0($t3)
addi $t3, $t4, 960
li $t5, 0xeebeba
sw $t5, 0($t3)
addi $t3, $t4, 964
li $t5, 0xbeb6ee
sw $t5, 0($t3)
addi $t3, $t4, 968
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 972
li $t5, 0xe5b6c9
sw $t5, 0($t3)
addi $t3, $t4, 976
li $t5, 0xcda8b5
sw $t5, 0($t3)
addi $t3, $t4, 980
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 984
li $t5, 0xf8bfb3
sw $t5, 0($t3)
addi $t3, $t4, 988
li $t5, 0xb2a0df
sw $t5, 0($t3)
addi $t3, $t4, 992
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 996
li $t5, 0xc4a8ad
sw $t5, 0($t3)
addi $t3, $t4, 1000
li $t5, 0xe2c8ba
sw $t5, 0($t3)
addi $t3, $t4, 1004
li $t5, 0xf9e9e7
sw $t5, 0($t3)
addi $t3, $t4, 1008
li $t5, 0xe2c1da
sw $t5, 0($t3)
addi $t3, $t4, 1012
li $t5, 0xe1d0e9
sw $t5, 0($t3)
addi $t3, $t4, 1016
li $t5, 0xcdb4af
sw $t5, 0($t3)
addi $t3, $t4, 1020
li $t5, 0xbf9c89
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 1024
li $t5, 0xc5a9e5
sw $t5, 0($t3)
addi $t3, $t4, 1028
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1032
li $t5, 0xecb9c4
sw $t5, 0($t3)
addi $t3, $t4, 1036
li $t5, 0xa399d7
sw $t5, 0($t3)
addi $t3, $t4, 1040
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1044
li $t5, 0x9d9dfa
sw $t5, 0($t3)
addi $t3, $t4, 1048
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1052
li $t5, 0xb2aaf4
sw $t5, 0($t3)
addi $t3, $t4, 1056
li $t5, 0x9499fc
sw $t5, 0($t3)
addi $t3, $t4, 1060
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1064
li $t5, 0xc5a8e6
sw $t5, 0($t3)
addi $t3, $t4, 1068
li $t5, 0xfdc3b8
sw $t5, 0($t3)
addi $t3, $t4, 1072
li $t5, 0xc6abe6
sw $t5, 0($t3)
addi $t3, $t4, 1076
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1080
li $t5, 0x9398fc
sw $t5, 0($t3)
addi $t3, $t4, 1084
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1088
li $t5, 0xb2b4fb
sw $t5, 0($t3)
addi $t3, $t4, 1092
li $t5, 0xf8e9e1
sw $t5, 0($t3)
addi $t3, $t4, 1096
li $t5, 0xf4e7cd
sw $t5, 0($t3)
addi $t3, $t4, 1100
li $t5, 0x9fa5f9
sw $t5, 0($t3)
addi $t3, $t4, 1104
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1108
sw $t5, 0($t3)
addi $t3, $t4, 1112
li $t5, 0x9fa7ff
sw $t5, 0($t3)
addi $t3, $t4, 1116
li $t5, 0xf4f1f9
sw $t5, 0($t3)
addi $t3, $t4, 1120
li $t5, 0xc5abe6
sw $t5, 0($t3)
addi $t3, $t4, 1124
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1128
li $t5, 0x9297fc
sw $t5, 0($t3)
addi $t3, $t4, 1132
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1136
li $t5, 0xdeb3d5
sw $t5, 0($t3)
addi $t3, $t4, 1140
li $t5, 0xc6a8e4
sw $t5, 0($t3)
addi $t3, $t4, 1144
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1148
li $t5, 0xf4bdc3
sw $t5, 0($t3)
addi $t3, $t4, 1152
li $t5, 0xe0b3d4
sw $t5, 0($t3)
addi $t3, $t4, 1156
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1160
sw $t5, 0($t3)
addi $t3, $t4, 1164
sw $t5, 0($t3)
addi $t3, $t4, 1168
li $t5, 0xe4adc9
sw $t5, 0($t3)
addi $t3, $t4, 1172
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1176
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1180
li $t5, 0x9698fb
sw $t5, 0($t3)
addi $t3, $t4, 1184
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1188
li $t5, 0xa79df4
sw $t5, 0($t3)
addi $t3, $t4, 1192
li $t5, 0xfabfbd
sw $t5, 0($t3)
addi $t3, $t4, 1196
li $t5, 0xf8bebf
sw $t5, 0($t3)
addi $t3, $t4, 1200
li $t5, 0xa69df4
sw $t5, 0($t3)
addi $t3, $t4, 1204
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1208
li $t5, 0x9497fb
sw $t5, 0($t3)
addi $t3, $t4, 1212
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1216
li $t5, 0xbba5dd
sw $t5, 0($t3)
addi $t3, $t4, 1220
li $t5, 0xb9a4e2
sw $t5, 0($t3)
addi $t3, $t4, 1224
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1228
li $t5, 0x8d95fd
sw $t5, 0($t3)
addi $t3, $t4, 1232
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1236
li $t5, 0x9d99ed
sw $t5, 0($t3)
addi $t3, $t4, 1240
li $t5, 0xc4a495
sw $t5, 0($t3)
addi $t3, $t4, 1244
li $t5, 0xa69cda
sw $t5, 0($t3)
addi $t3, $t4, 1248
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1252
li $t5, 0xdcb3ba
sw $t5, 0($t3)
addi $t3, $t4, 1256
li $t5, 0xf5bec0
sw $t5, 0($t3)
addi $t3, $t4, 1260
li $t5, 0x9f9ff9
sw $t5, 0($t3)
addi $t3, $t4, 1264
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1268
sw $t5, 0($t3)
addi $t3, $t4, 1272
li $t5, 0x9e9ffa
sw $t5, 0($t3)
addi $t3, $t4, 1276
li $t5, 0xf5bdbf
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 1280
li $t5, 0xc5a9e5
sw $t5, 0($t3)
addi $t3, $t4, 1284
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1288
li $t5, 0xc0a6ab
sw $t5, 0($t3)
addi $t3, $t4, 1292
li $t5, 0xb3a1df
sw $t5, 0($t3)
addi $t3, $t4, 1296
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1300
li $t5, 0xb7aef5
sw $t5, 0($t3)
addi $t3, $t4, 1304
li $t5, 0x979cfb
sw $t5, 0($t3)
addi $t3, $t4, 1308
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1312
li $t5, 0xb8aff4
sw $t5, 0($t3)
addi $t3, $t4, 1316
li $t5, 0x9798fa
sw $t5, 0($t3)
addi $t3, $t4, 1320
li $t5, 0x8b95fe
sw $t5, 0($t3)
addi $t3, $t4, 1324
li $t5, 0xfdc1b9
sw $t5, 0($t3)
addi $t3, $t4, 1328
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1332
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1336
li $t5, 0xb7a3ed
sw $t5, 0($t3)
addi $t3, $t4, 1340
li $t5, 0xb5a7f0
sw $t5, 0($t3)
addi $t3, $t4, 1344
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1348
li $t5, 0xd9d1e8
sw $t5, 0($t3)
addi $t3, $t4, 1352
li $t5, 0xc5c1e9
sw $t5, 0($t3)
addi $t3, $t4, 1356
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1360
li $t5, 0xcecef7
sw $t5, 0($t3)
addi $t3, $t4, 1364
li $t5, 0xcbccfa
sw $t5, 0($t3)
addi $t3, $t4, 1368
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1372
li $t5, 0xd5d5fc
sw $t5, 0($t3)
addi $t3, $t4, 1376
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1380
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1384
li $t5, 0xc0a7e8
sw $t5, 0($t3)
addi $t3, $t4, 1388
li $t5, 0xd0adde
sw $t5, 0($t3)
addi $t3, $t4, 1392
li $t5, 0xf8bfbe
sw $t5, 0($t3)
addi $t3, $t4, 1396
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1400
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1404
li $t5, 0xf0bcc5
sw $t5, 0($t3)
addi $t3, $t4, 1408
li $t5, 0xd0addf
sw $t5, 0($t3)
addi $t3, $t4, 1412
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1416
li $t5, 0xcda9de
sw $t5, 0($t3)
addi $t3, $t4, 1420
li $t5, 0xdeaed0
sw $t5, 0($t3)
addi $t3, $t4, 1424
li $t5, 0xfcbab0
sw $t5, 0($t3)
addi $t3, $t4, 1428
li $t5, 0xc4a9e5
sw $t5, 0($t3)
addi $t3, $t4, 1432
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1436
li $t5, 0xaea7f4
sw $t5, 0($t3)
addi $t3, $t4, 1440
li $t5, 0xb4a8f1
sw $t5, 0($t3)
addi $t3, $t4, 1444
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1448
li $t5, 0xcfb2e1
sw $t5, 0($t3)
addi $t3, $t4, 1452
li $t5, 0xc8a9e3
sw $t5, 0($t3)
addi $t3, $t4, 1456
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1460
li $t5, 0xbda6ea
sw $t5, 0($t3)
addi $t3, $t4, 1464
li $t5, 0xab9ff2
sw $t5, 0($t3)
addi $t3, $t4, 1468
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1472
li $t5, 0xbda6e0
sw $t5, 0($t3)
addi $t3, $t4, 1476
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1480
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1484
li $t5, 0x9c98e9
sw $t5, 0($t3)
addi $t3, $t4, 1488
li $t5, 0x9f99e6
sw $t5, 0($t3)
addi $t3, $t4, 1492
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1496
li $t5, 0xd1aedd
sw $t5, 0($t3)
addi $t3, $t4, 1500
li $t5, 0xc4a9e5
sw $t5, 0($t3)
addi $t3, $t4, 1504
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1508
li $t5, 0xcda9b1
sw $t5, 0($t3)
addi $t3, $t4, 1512
li $t5, 0xa99bda
sw $t5, 0($t3)
addi $t3, $t4, 1516
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1520
li $t5, 0xcdb8e9
sw $t5, 0($t3)
addi $t3, $t4, 1524
li $t5, 0xccafe2
sw $t5, 0($t3)
addi $t3, $t4, 1528
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1532
li $t5, 0xd6b0db
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 1536
li $t5, 0xc3b3ee
sw $t5, 0($t3)
addi $t3, $t4, 1540
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1544
li $t5, 0xa6999b
sw $t5, 0($t3)
addi $t3, $t4, 1548
li $t5, 0xb1a1df
sw $t5, 0($t3)
addi $t3, $t4, 1552
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1556
li $t5, 0xd4b1ba
sw $t5, 0($t3)
addi $t3, $t4, 1560
li $t5, 0xbbafef
sw $t5, 0($t3)
addi $t3, $t4, 1564
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1568
li $t5, 0xefc9d4
sw $t5, 0($t3)
addi $t3, $t4, 1572
li $t5, 0xbca5ea
sw $t5, 0($t3)
addi $t3, $t4, 1576
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1580
li $t5, 0xf5bec1
sw $t5, 0($t3)
addi $t3, $t4, 1584
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1588
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1592
li $t5, 0xe5b9d1
sw $t5, 0($t3)
addi $t3, $t4, 1596
li $t5, 0xe7e5fa
sw $t5, 0($t3)
addi $t3, $t4, 1600
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1604
li $t5, 0xcbc9f5
sw $t5, 0($t3)
addi $t3, $t4, 1608
li $t5, 0xb4b4f3
sw $t5, 0($t3)
addi $t3, $t4, 1612
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1616
li $t5, 0x969ffe
sw $t5, 0($t3)
addi $t3, $t4, 1620
li $t5, 0x969fff
sw $t5, 0($t3)
addi $t3, $t4, 1624
li $t5, 0x999efc
sw $t5, 0($t3)
addi $t3, $t4, 1628
li $t5, 0xe8c1d4
sw $t5, 0($t3)
addi $t3, $t4, 1632
li $t5, 0xc5a8e6
sw $t5, 0($t3)
addi $t3, $t4, 1636
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1640
li $t5, 0xf0bbc5
sw $t5, 0($t3)
addi $t3, $t4, 1644
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 1648
li $t5, 0xfdccc6
sw $t5, 0($t3)
addi $t3, $t4, 1652
li $t5, 0xc3b0ec
sw $t5, 0($t3)
addi $t3, $t4, 1656
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1660
li $t5, 0xf1bbc5
sw $t5, 0($t3)
addi $t3, $t4, 1664
li $t5, 0xf3bcc3
sw $t5, 0($t3)
addi $t3, $t4, 1668
li $t5, 0xa09bf7
sw $t5, 0($t3)
addi $t3, $t4, 1672
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1676
sw $t5, 0($t3)
addi $t3, $t4, 1680
li $t5, 0xdeb4d4
sw $t5, 0($t3)
addi $t3, $t4, 1684
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1688
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1692
li $t5, 0xeee7f0
sw $t5, 0($t3)
addi $t3, $t4, 1696
li $t5, 0xf3eff4
sw $t5, 0($t3)
addi $t3, $t4, 1700
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1704
li $t5, 0xbdc0fc
sw $t5, 0($t3)
addi $t3, $t4, 1708
li $t5, 0xb5abf2
sw $t5, 0($t3)
addi $t3, $t4, 1712
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1716
li $t5, 0xf6bdc0
sw $t5, 0($t3)
addi $t3, $t4, 1720
li $t5, 0xddb2d5
sw $t5, 0($t3)
addi $t3, $t4, 1724
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1728
li $t5, 0xb1a1db
sw $t5, 0($t3)
addi $t3, $t4, 1732
li $t5, 0xa499da
sw $t5, 0($t3)
addi $t3, $t4, 1736
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1740
li $t5, 0xdeb4ca
sw $t5, 0($t3)
addi $t3, $t4, 1744
li $t5, 0xe5b5c0
sw $t5, 0($t3)
addi $t3, $t4, 1748
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1752
li $t5, 0xc0bbf6
sw $t5, 0($t3)
addi $t3, $t4, 1756
li $t5, 0xc3ade8
sw $t5, 0($t3)
addi $t3, $t4, 1760
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1764
li $t5, 0xf0bcc5
sw $t5, 0($t3)
addi $t3, $t4, 1768
li $t5, 0xb4a2ed
sw $t5, 0($t3)
addi $t3, $t4, 1772
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1776
li $t5, 0x9196f9
sw $t5, 0($t3)
addi $t3, $t4, 1780
li $t5, 0x9297fa
sw $t5, 0($t3)
addi $t3, $t4, 1784
li $t5, 0x9698f9
sw $t5, 0($t3)
addi $t3, $t4, 1788
li $t5, 0xebb8cb
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 1792
li $t5, 0xc3c7fd
sw $t5, 0($t3)
addi $t3, $t4, 1796
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1800
li $t5, 0xc0b6bc
sw $t5, 0($t3)
addi $t3, $t4, 1804
li $t5, 0xa49cdc
sw $t5, 0($t3)
addi $t3, $t4, 1808
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1812
li $t5, 0xf1bbc5
sw $t5, 0($t3)
addi $t3, $t4, 1816
li $t5, 0xbfa8e9
sw $t5, 0($t3)
addi $t3, $t4, 1820
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1824
li $t5, 0xf1bcc4
sw $t5, 0($t3)
addi $t3, $t4, 1828
li $t5, 0xbca5e8
sw $t5, 0($t3)
addi $t3, $t4, 1832
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1836
li $t5, 0xf5bdc2
sw $t5, 0($t3)
addi $t3, $t4, 1840
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1844
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1848
li $t5, 0x9198fd
sw $t5, 0($t3)
addi $t3, $t4, 1852
li $t5, 0x8e98ff
sw $t5, 0($t3)
addi $t3, $t4, 1856
li $t5, 0x8a95ff
sw $t5, 0($t3)
addi $t3, $t4, 1860
li $t5, 0xeae7f9
sw $t5, 0($t3)
addi $t3, $t4, 1864
li $t5, 0xcdc8f4
sw $t5, 0($t3)
addi $t3, $t4, 1868
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1872
li $t5, 0xbbbefc
sw $t5, 0($t3)
addi $t3, $t4, 1876
li $t5, 0xd3d4fc
sw $t5, 0($t3)
addi $t3, $t4, 1880
li $t5, 0xc5b3ec
sw $t5, 0($t3)
addi $t3, $t4, 1884
li $t5, 0xfbc1bb
sw $t5, 0($t3)
addi $t3, $t4, 1888
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1892
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1896
li $t5, 0xf0c4d0
sw $t5, 0($t3)
addi $t3, $t4, 1900
li $t5, 0xfdcac2
sw $t5, 0($t3)
addi $t3, $t4, 1904
li $t5, 0xfcdedc
sw $t5, 0($t3)
addi $t3, $t4, 1908
li $t5, 0xc5b8f3
sw $t5, 0($t3)
addi $t3, $t4, 1912
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1916
li $t5, 0xf0bcc5
sw $t5, 0($t3)
addi $t3, $t4, 1920
li $t5, 0xdbb1d8
sw $t5, 0($t3)
addi $t3, $t4, 1924
li $t5, 0xc0a7e8
sw $t5, 0($t3)
addi $t3, $t4, 1928
li $t5, 0xc7a9e4
sw $t5, 0($t3)
addi $t3, $t4, 1932
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1936
li $t5, 0xc6a9e4
sw $t5, 0($t3)
addi $t3, $t4, 1940
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 1944
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1948
li $t5, 0xf0ebf4
sw $t5, 0($t3)
addi $t3, $t4, 1952
li $t5, 0xf5eef1
sw $t5, 0($t3)
addi $t3, $t4, 1956
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1960
li $t5, 0xb9b9f7
sw $t5, 0($t3)
addi $t3, $t4, 1964
li $t5, 0xd3cdf4
sw $t5, 0($t3)
addi $t3, $t4, 1968
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1972
li $t5, 0x9a99f8
sw $t5, 0($t3)
addi $t3, $t4, 1976
li $t5, 0x8e95fa
sw $t5, 0($t3)
addi $t3, $t4, 1980
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1984
li $t5, 0xada0da
sw $t5, 0($t3)
addi $t3, $t4, 1988
li $t5, 0xb7a4e2
sw $t5, 0($t3)
addi $t3, $t4, 1992
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 1996
li $t5, 0x959afb
sw $t5, 0($t3)
addi $t3, $t4, 2000
li $t5, 0x9197f8
sw $t5, 0($t3)
addi $t3, $t4, 2004
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2008
li $t5, 0xddd3f4
sw $t5, 0($t3)
addi $t3, $t4, 2012
li $t5, 0xc9b6eb
sw $t5, 0($t3)
addi $t3, $t4, 2016
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2020
li $t5, 0xb2a2ef
sw $t5, 0($t3)
addi $t3, $t4, 2024
li $t5, 0xccabe1
sw $t5, 0($t3)
addi $t3, $t4, 2028
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2032
li $t5, 0xbda5ea
sw $t5, 0($t3)
addi $t3, $t4, 2036
li $t5, 0xd3afdc
sw $t5, 0($t3)
addi $t3, $t4, 2040
li $t5, 0xc6a9e5
sw $t5, 0($t3)
addi $t3, $t4, 2044
li $t5, 0xfcc0bb
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 2048
li $t5, 0xcfcffa
sw $t5, 0($t3)
addi $t3, $t4, 2052
li $t5, 0x9299fe
sw $t5, 0($t3)
addi $t3, $t4, 2056
li $t5, 0xf1d7de
sw $t5, 0($t3)
addi $t3, $t4, 2060
li $t5, 0xccbdec
sw $t5, 0($t3)
addi $t3, $t4, 2064
li $t5, 0x9297fc
sw $t5, 0($t3)
addi $t3, $t4, 2068
li $t5, 0xf7bdbf
sw $t5, 0($t3)
addi $t3, $t4, 2072
li $t5, 0xc9abdf
sw $t5, 0($t3)
addi $t3, $t4, 2076
li $t5, 0x8f96fb
sw $t5, 0($t3)
addi $t3, $t4, 2080
li $t5, 0xdfb4b0
sw $t5, 0($t3)
addi $t3, $t4, 2084
li $t5, 0xcaace1
sw $t5, 0($t3)
addi $t3, $t4, 2088
li $t5, 0x9397fb
sw $t5, 0($t3)
addi $t3, $t4, 2092
li $t5, 0xf9c0bd
sw $t5, 0($t3)
addi $t3, $t4, 2096
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 2100
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2104
li $t5, 0xb6a4ee
sw $t5, 0($t3)
addi $t3, $t4, 2108
li $t5, 0xa5abfb
sw $t5, 0($t3)
addi $t3, $t4, 2112
li $t5, 0xdee1fe
sw $t5, 0($t3)
addi $t3, $t4, 2116
li $t5, 0xfcf1ef
sw $t5, 0($t3)
addi $t3, $t4, 2120
li $t5, 0xf8c4c0
sw $t5, 0($t3)
addi $t3, $t4, 2124
li $t5, 0xbab9f8
sw $t5, 0($t3)
addi $t3, $t4, 2128
li $t5, 0x8c96ff
sw $t5, 0($t3)
addi $t3, $t4, 2132
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2136
li $t5, 0x979afb
sw $t5, 0($t3)
addi $t3, $t4, 2140
li $t5, 0xf5bdc0
sw $t5, 0($t3)
addi $t3, $t4, 2144
li $t5, 0xd0bbe9
sw $t5, 0($t3)
addi $t3, $t4, 2148
li $t5, 0x929afd
sw $t5, 0($t3)
addi $t3, $t4, 2152
li $t5, 0xf5d8e0
sw $t5, 0($t3)
addi $t3, $t4, 2156
li $t5, 0xfbd8d5
sw $t5, 0($t3)
addi $t3, $t4, 2160
li $t5, 0xfdd9d6
sw $t5, 0($t3)
addi $t3, $t4, 2164
li $t5, 0xcdbced
sw $t5, 0($t3)
addi $t3, $t4, 2168
li $t5, 0x9298fd
sw $t5, 0($t3)
addi $t3, $t4, 2172
li $t5, 0xf5c2c4
sw $t5, 0($t3)
addi $t3, $t4, 2176
li $t5, 0xd6afda
sw $t5, 0($t3)
addi $t3, $t4, 2180
li $t5, 0x9297fc
sw $t5, 0($t3)
addi $t3, $t4, 2184
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2188
li $t5, 0x9a98f9
sw $t5, 0($t3)
addi $t3, $t4, 2192
li $t5, 0xecbaca
sw $t5, 0($t3)
addi $t3, $t4, 2196
li $t5, 0xcfaddf
sw $t5, 0($t3)
addi $t3, $t4, 2200
li $t5, 0x929afe
sw $t5, 0($t3)
addi $t3, $t4, 2204
li $t5, 0xf6f5fa
sw $t5, 0($t3)
addi $t3, $t4, 2208
li $t5, 0xfaf4f1
sw $t5, 0($t3)
addi $t3, $t4, 2212
li $t5, 0x949cfc
sw $t5, 0($t3)
addi $t3, $t4, 2216
li $t5, 0xc7c2f1
sw $t5, 0($t3)
addi $t3, $t4, 2220
li $t5, 0xf9ecea
sw $t5, 0($t3)
addi $t3, $t4, 2224
li $t5, 0xc5c7fc
sw $t5, 0($t3)
addi $t3, $t4, 2228
li $t5, 0x9198fb
sw $t5, 0($t3)
addi $t3, $t4, 2232
li $t5, 0xb0a0ed
sw $t5, 0($t3)
addi $t3, $t4, 2236
li $t5, 0x9397fc
sw $t5, 0($t3)
addi $t3, $t4, 2240
li $t5, 0xd1bbe6
sw $t5, 0($t3)
addi $t3, $t4, 2244
li $t5, 0xcdbcea
sw $t5, 0($t3)
addi $t3, $t4, 2248
li $t5, 0x97a0ff
sw $t5, 0($t3)
addi $t3, $t4, 2252
li $t5, 0xafb1fb
sw $t5, 0($t3)
addi $t3, $t4, 2256
li $t5, 0x949afc
sw $t5, 0($t3)
addi $t3, $t4, 2260
li $t5, 0xc5bbec
sw $t5, 0($t3)
addi $t3, $t4, 2264
li $t5, 0xfce1de
sw $t5, 0($t3)
addi $t3, $t4, 2268
li $t5, 0xebbbcd
sw $t5, 0($t3)
addi $t3, $t4, 2272
li $t5, 0x9a9af9
sw $t5, 0($t3)
addi $t3, $t4, 2276
li $t5, 0x8f96fd
sw $t5, 0($t3)
addi $t3, $t4, 2280
li $t5, 0xf4bec2
sw $t5, 0($t3)
addi $t3, $t4, 2284
li $t5, 0xbca5ea
sw $t5, 0($t3)
addi $t3, $t4, 2288
li $t5, 0x8c95fe
sw $t5, 0($t3)
addi $t3, $t4, 2292
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2296
li $t5, 0x9898fa
sw $t5, 0($t3)
addi $t3, $t4, 2300
li $t5, 0xf6bdc0
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 2304
li $t5, 0xfdf3f1
sw $t5, 0($t3)
addi $t3, $t4, 2308
li $t5, 0xf8d8d2
sw $t5, 0($t3)
addi $t3, $t4, 2312
li $t5, 0xfbd5cf
sw $t5, 0($t3)
addi $t3, $t4, 2316
li $t5, 0xf1dfd7
sw $t5, 0($t3)
addi $t3, $t4, 2320
li $t5, 0xdab29e
sw $t5, 0($t3)
addi $t3, $t4, 2324
li $t5, 0xe2b8a4
sw $t5, 0($t3)
addi $t3, $t4, 2328
li $t5, 0xc9a78f
sw $t5, 0($t3)
addi $t3, $t4, 2332
li $t5, 0xeab8a9
sw $t5, 0($t3)
addi $t3, $t4, 2336
li $t5, 0xf7bfb3
sw $t5, 0($t3)
addi $t3, $t4, 2340
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 2344
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2348
li $t5, 0xfec3b9
sw $t5, 0($t3)
addi $t3, $t4, 2352
li $t5, 0xc4aae8
sw $t5, 0($t3)
addi $t3, $t4, 2356
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2360
li $t5, 0xd3aeac
sw $t5, 0($t3)
addi $t3, $t4, 2364
li $t5, 0xf0bcb0
sw $t5, 0($t3)
addi $t3, $t4, 2368
li $t5, 0xfccec4
sw $t5, 0($t3)
addi $t3, $t4, 2372
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 2376
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 2380
li $t5, 0xfcc5bc
sw $t5, 0($t3)
addi $t3, $t4, 2384
li $t5, 0xf9d9d6
sw $t5, 0($t3)
addi $t3, $t4, 2388
li $t5, 0xf5bfc2
sw $t5, 0($t3)
addi $t3, $t4, 2392
li $t5, 0xfec1b9
sw $t5, 0($t3)
addi $t3, $t4, 2396
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2400
li $t5, 0xfcd7d3
sw $t5, 0($t3)
addi $t3, $t4, 2404
li $t5, 0xfddfdd
sw $t5, 0($t3)
addi $t3, $t4, 2408
li $t5, 0xfad5d4
sw $t5, 0($t3)
addi $t3, $t4, 2412
li $t5, 0xfcd5d0
sw $t5, 0($t3)
addi $t3, $t4, 2416
li $t5, 0xfad8c6
sw $t5, 0($t3)
addi $t3, $t4, 2420
li $t5, 0xfbd2cc
sw $t5, 0($t3)
addi $t3, $t4, 2424
li $t5, 0xfdd9d7
sw $t5, 0($t3)
addi $t3, $t4, 2428
li $t5, 0xfee1df
sw $t5, 0($t3)
addi $t3, $t4, 2432
li $t5, 0xecd0c8
sw $t5, 0($t3)
addi $t3, $t4, 2436
li $t5, 0xcdac96
sw $t5, 0($t3)
addi $t3, $t4, 2440
li $t5, 0xd9cbca
sw $t5, 0($t3)
addi $t3, $t4, 2444
li $t5, 0xe0d3ca
sw $t5, 0($t3)
addi $t3, $t4, 2448
li $t5, 0xc3a692
sw $t5, 0($t3)
addi $t3, $t4, 2452
li $t5, 0xbf9e88
sw $t5, 0($t3)
addi $t3, $t4, 2456
li $t5, 0xd1bba9
sw $t5, 0($t3)
addi $t3, $t4, 2460
li $t5, 0xfdfffd
sw $t5, 0($t3)
addi $t3, $t4, 2464
li $t5, 0xfefbf9
sw $t5, 0($t3)
addi $t3, $t4, 2468
li $t5, 0xfdf7ed
sw $t5, 0($t3)
addi $t3, $t4, 2472
li $t5, 0xfbecca
sw $t5, 0($t3)
addi $t3, $t4, 2476
li $t5, 0xfbefe6
sw $t5, 0($t3)
addi $t3, $t4, 2480
li $t5, 0xfdf8f5
sw $t5, 0($t3)
addi $t3, $t4, 2484
li $t5, 0xf7e8e1
sw $t5, 0($t3)
addi $t3, $t4, 2488
li $t5, 0xecb6aa
sw $t5, 0($t3)
addi $t3, $t4, 2492
li $t5, 0xf8dad4
sw $t5, 0($t3)
addi $t3, $t4, 2496
li $t5, 0xfcfbfb
sw $t5, 0($t3)
addi $t3, $t4, 2500
li $t5, 0xfaf4f2
sw $t5, 0($t3)
addi $t3, $t4, 2504
li $t5, 0xf9f0e0
sw $t5, 0($t3)
addi $t3, $t4, 2508
li $t5, 0xfaf1ee
sw $t5, 0($t3)
addi $t3, $t4, 2512
li $t5, 0xfdfcfb
sw $t5, 0($t3)
addi $t3, $t4, 2516
li $t5, 0xfce6e2
sw $t5, 0($t3)
addi $t3, $t4, 2520
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2524
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 2528
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2532
sw $t5, 0($t3)
addi $t3, $t4, 2536
sw $t5, 0($t3)
addi $t3, $t4, 2540
sw $t5, 0($t3)
addi $t3, $t4, 2544
li $t5, 0xfcc0bb
sw $t5, 0($t3)
addi $t3, $t4, 2548
li $t5, 0xf6bec1
sw $t5, 0($t3)
addi $t3, $t4, 2552
li $t5, 0xfec1b9
sw $t5, 0($t3)
addi $t3, $t4, 2556
li $t5, 0xffc1b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 2560
li $t5, 0xfdf7f5
sw $t5, 0($t3)
addi $t3, $t4, 2564
li $t5, 0xfcebe9
sw $t5, 0($t3)
addi $t3, $t4, 2568
li $t5, 0xfbded7
sw $t5, 0($t3)
addi $t3, $t4, 2572
li $t5, 0xfbd8d2
sw $t5, 0($t3)
addi $t3, $t4, 2576
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2580
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 2584
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 2588
li $t5, 0xfec4bb
sw $t5, 0($t3)
addi $t3, $t4, 2592
li $t5, 0xfdc3ba
sw $t5, 0($t3)
addi $t3, $t4, 2596
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 2600
li $t5, 0xfdc4bb
sw $t5, 0($t3)
addi $t3, $t4, 2604
li $t5, 0xfceceb
sw $t5, 0($t3)
addi $t3, $t4, 2608
li $t5, 0xc4b8f2
sw $t5, 0($t3)
addi $t3, $t4, 2612
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 2616
li $t5, 0xdcb2af
sw $t5, 0($t3)
addi $t3, $t4, 2620
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 2624
sw $t5, 0($t3)
addi $t3, $t4, 2628
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2632
sw $t5, 0($t3)
addi $t3, $t4, 2636
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 2640
li $t5, 0xfbc8bf
sw $t5, 0($t3)
addi $t3, $t4, 2644
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 2648
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2652
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 2656
li $t5, 0xfec2b9
sw $t5, 0($t3)
addi $t3, $t4, 2660
li $t5, 0xeec9c0
sw $t5, 0($t3)
addi $t3, $t4, 2664
li $t5, 0xf3cdc9
sw $t5, 0($t3)
addi $t3, $t4, 2668
li $t5, 0xfbe3c3
sw $t5, 0($t3)
addi $t3, $t4, 2672
li $t5, 0xfbeec6
sw $t5, 0($t3)
addi $t3, $t4, 2676
li $t5, 0xfae0c8
sw $t5, 0($t3)
addi $t3, $t4, 2680
li $t5, 0xfad2d1
sw $t5, 0($t3)
addi $t3, $t4, 2684
li $t5, 0xfcdcda
sw $t5, 0($t3)
addi $t3, $t4, 2688
li $t5, 0xfee1df
sw $t5, 0($t3)
addi $t3, $t4, 2692
li $t5, 0xfac2b8
sw $t5, 0($t3)
addi $t3, $t4, 2696
li $t5, 0xf6e2dd
sw $t5, 0($t3)
addi $t3, $t4, 2700
li $t5, 0xffe1da
sw $t5, 0($t3)
addi $t3, $t4, 2704
li $t5, 0xfed0c7
sw $t5, 0($t3)
addi $t3, $t4, 2708
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 2712
sw $t5, 0($t3)
addi $t3, $t4, 2716
li $t5, 0xfcd8d3
sw $t5, 0($t3)
addi $t3, $t4, 2720
li $t5, 0xffffff
sw $t5, 0($t3)
addi $t3, $t4, 2724
li $t5, 0xfefcfb
sw $t5, 0($t3)
addi $t3, $t4, 2728
li $t5, 0xfdfaf6
sw $t5, 0($t3)
addi $t3, $t4, 2732
li $t5, 0xfdf2e3
sw $t5, 0($t3)
addi $t3, $t4, 2736
li $t5, 0xfef6f0
sw $t5, 0($t3)
addi $t3, $t4, 2740
li $t5, 0xf3e8e1
sw $t5, 0($t3)
addi $t3, $t4, 2744
li $t5, 0xd5ab99
sw $t5, 0($t3)
addi $t3, $t4, 2748
li $t5, 0xe3c2b3
sw $t5, 0($t3)
addi $t3, $t4, 2752
li $t5, 0xf8e7e4
sw $t5, 0($t3)
addi $t3, $t4, 2756
li $t5, 0xf9ede6
sw $t5, 0($t3)
addi $t3, $t4, 2760
li $t5, 0xfbedc4
sw $t5, 0($t3)
addi $t3, $t4, 2764
li $t5, 0xfcf3e2
sw $t5, 0($t3)
addi $t3, $t4, 2768
li $t5, 0xf9f1f0
sw $t5, 0($t3)
addi $t3, $t4, 2772
li $t5, 0xfccfc7
sw $t5, 0($t3)
addi $t3, $t4, 2776
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 2780
sw $t5, 0($t3)
addi $t3, $t4, 2784
sw $t5, 0($t3)
addi $t3, $t4, 2788
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2792
li $t5, 0xfdd2cb
sw $t5, 0($t3)
addi $t3, $t4, 2796
li $t5, 0xfed5ce
sw $t5, 0($t3)
addi $t3, $t4, 2800
li $t5, 0xfdcfc9
sw $t5, 0($t3)
addi $t3, $t4, 2804
li $t5, 0xfec3b9
sw $t5, 0($t3)
addi $t3, $t4, 2808
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2812
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 2816
li $t5, 0xfcdeda
sw $t5, 0($t3)
addi $t3, $t4, 2820
li $t5, 0xfbcec5
sw $t5, 0($t3)
addi $t3, $t4, 2824
li $t5, 0xfec4bb
sw $t5, 0($t3)
addi $t3, $t4, 2828
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2832
li $t5, 0xfdc5bd
sw $t5, 0($t3)
addi $t3, $t4, 2836
li $t5, 0xfcc4ba
sw $t5, 0($t3)
addi $t3, $t4, 2840
li $t5, 0xfdc8c1
sw $t5, 0($t3)
addi $t3, $t4, 2844
li $t5, 0xfed7d7
sw $t5, 0($t3)
addi $t3, $t4, 2848
li $t5, 0xfce6e5
sw $t5, 0($t3)
addi $t3, $t4, 2852
li $t5, 0xfbdad6
sw $t5, 0($t3)
addi $t3, $t4, 2856
li $t5, 0xfcdad5
sw $t5, 0($t3)
addi $t3, $t4, 2860
li $t5, 0xfdfcfc
sw $t5, 0($t3)
addi $t3, $t4, 2864
li $t5, 0xf7f7fe
sw $t5, 0($t3)
addi $t3, $t4, 2868
li $t5, 0xeae3f6
sw $t5, 0($t3)
addi $t3, $t4, 2872
li $t5, 0xfec5be
sw $t5, 0($t3)
addi $t3, $t4, 2876
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 2880
sw $t5, 0($t3)
addi $t3, $t4, 2884
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2888
li $t5, 0xf6c0c5
sw $t5, 0($t3)
addi $t3, $t4, 2892
li $t5, 0xdcbedd
sw $t5, 0($t3)
addi $t3, $t4, 2896
li $t5, 0xded2ef
sw $t5, 0($t3)
addi $t3, $t4, 2900
li $t5, 0xe3cde5
sw $t5, 0($t3)
addi $t3, $t4, 2904
li $t5, 0xf2d4d5
sw $t5, 0($t3)
addi $t3, $t4, 2908
li $t5, 0xd7b09c
sw $t5, 0($t3)
addi $t3, $t4, 2912
li $t5, 0xc0a389
sw $t5, 0($t3)
addi $t3, $t4, 2916
li $t5, 0xdac1b5
sw $t5, 0($t3)
addi $t3, $t4, 2920
li $t5, 0xfbd7d4
sw $t5, 0($t3)
addi $t3, $t4, 2924
li $t5, 0xfbe0c8
sw $t5, 0($t3)
addi $t3, $t4, 2928
li $t5, 0xfbefc4
sw $t5, 0($t3)
addi $t3, $t4, 2932
li $t5, 0xfcddc9
sw $t5, 0($t3)
addi $t3, $t4, 2936
li $t5, 0xfbd7d5
sw $t5, 0($t3)
addi $t3, $t4, 2940
li $t5, 0xfbd9d7
sw $t5, 0($t3)
addi $t3, $t4, 2944
li $t5, 0xfcd3ce
sw $t5, 0($t3)
addi $t3, $t4, 2948
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2952
li $t5, 0xc9a895
sw $t5, 0($t3)
addi $t3, $t4, 2956
li $t5, 0xf0cdc1
sw $t5, 0($t3)
addi $t3, $t4, 2960
li $t5, 0xfdc3b9
sw $t5, 0($t3)
addi $t3, $t4, 2964
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 2968
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 2972
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 2976
li $t5, 0xfce8e4
sw $t5, 0($t3)
addi $t3, $t4, 2980
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 2984
li $t5, 0xfefdfe
sw $t5, 0($t3)
addi $t3, $t4, 2988
li $t5, 0xfef1ee
sw $t5, 0($t3)
addi $t3, $t4, 2992
li $t5, 0xfef8f3
sw $t5, 0($t3)
addi $t3, $t4, 2996
li $t5, 0xfcefe8
sw $t5, 0($t3)
addi $t3, $t4, 3000
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3004
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3008
li $t5, 0xfcd2cc
sw $t5, 0($t3)
addi $t3, $t4, 3012
li $t5, 0xfbf6f4
sw $t5, 0($t3)
addi $t3, $t4, 3016
li $t5, 0xfaf0e3
sw $t5, 0($t3)
addi $t3, $t4, 3020
li $t5, 0xf9f4f0
sw $t5, 0($t3)
addi $t3, $t4, 3024
li $t5, 0xfcfcfb
sw $t5, 0($t3)
addi $t3, $t4, 3028
li $t5, 0xfdcdc3
sw $t5, 0($t3)
addi $t3, $t4, 3032
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3036
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 3040
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3044
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3048
li $t5, 0xfcdad3
sw $t5, 0($t3)
addi $t3, $t4, 3052
li $t5, 0xfcd9d4
sw $t5, 0($t3)
addi $t3, $t4, 3056
li $t5, 0xfcc9c1
sw $t5, 0($t3)
addi $t3, $t4, 3060
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 3064
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3068
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 3072
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 3076
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3080
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 3084
li $t5, 0xfddcd7
sw $t5, 0($t3)
addi $t3, $t4, 3088
li $t5, 0xfee6e4
sw $t5, 0($t3)
addi $t3, $t4, 3092
li $t5, 0xfeddd9
sw $t5, 0($t3)
addi $t3, $t4, 3096
li $t5, 0xfbe0df
sw $t5, 0($t3)
addi $t3, $t4, 3100
li $t5, 0xfefcfb
sw $t5, 0($t3)
addi $t3, $t4, 3104
li $t5, 0xfefffe
sw $t5, 0($t3)
addi $t3, $t4, 3108
li $t5, 0xfcf2ef
sw $t5, 0($t3)
addi $t3, $t4, 3112
li $t5, 0xfcf5f5
sw $t5, 0($t3)
addi $t3, $t4, 3116
li $t5, 0xf8eae6
sw $t5, 0($t3)
addi $t3, $t4, 3120
li $t5, 0xfbf3f0
sw $t5, 0($t3)
addi $t3, $t4, 3124
li $t5, 0xfbf6f5
sw $t5, 0($t3)
addi $t3, $t4, 3128
li $t5, 0xfdc3ba
sw $t5, 0($t3)
addi $t3, $t4, 3132
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3136
sw $t5, 0($t3)
addi $t3, $t4, 3140
sw $t5, 0($t3)
addi $t3, $t4, 3144
li $t5, 0xc4ace7
sw $t5, 0($t3)
addi $t3, $t4, 3148
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3152
sw $t5, 0($t3)
addi $t3, $t4, 3156
sw $t5, 0($t3)
addi $t3, $t4, 3160
li $t5, 0x8e97fd
sw $t5, 0($t3)
addi $t3, $t4, 3164
li $t5, 0xcbadd4
sw $t5, 0($t3)
addi $t3, $t4, 3168
li $t5, 0xfcc5bb
sw $t5, 0($t3)
addi $t3, $t4, 3172
li $t5, 0xfee1de
sw $t5, 0($t3)
addi $t3, $t4, 3176
li $t5, 0xfbd9d7
sw $t5, 0($t3)
addi $t3, $t4, 3180
li $t5, 0xfbd5d3
sw $t5, 0($t3)
addi $t3, $t4, 3184
li $t5, 0xfcd4ce
sw $t5, 0($t3)
addi $t3, $t4, 3188
li $t5, 0xfad5d4
sw $t5, 0($t3)
addi $t3, $t4, 3192
li $t5, 0xfcdddb
sw $t5, 0($t3)
addi $t3, $t4, 3196
li $t5, 0xfdd4cf
sw $t5, 0($t3)
addi $t3, $t4, 3200
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3204
li $t5, 0xf5beb1
sw $t5, 0($t3)
addi $t3, $t4, 3208
li $t5, 0xecb7aa
sw $t5, 0($t3)
addi $t3, $t4, 3212
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3216
sw $t5, 0($t3)
addi $t3, $t4, 3220
sw $t5, 0($t3)
addi $t3, $t4, 3224
sw $t5, 0($t3)
addi $t3, $t4, 3228
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3232
sw $t5, 0($t3)
addi $t3, $t4, 3236
li $t5, 0xfbd3cc
sw $t5, 0($t3)
addi $t3, $t4, 3240
li $t5, 0xfdf1ee
sw $t5, 0($t3)
addi $t3, $t4, 3244
li $t5, 0xfbdad2
sw $t5, 0($t3)
addi $t3, $t4, 3248
li $t5, 0xfddfd7
sw $t5, 0($t3)
addi $t3, $t4, 3252
li $t5, 0xfcded6
sw $t5, 0($t3)
addi $t3, $t4, 3256
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 3260
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3264
li $t5, 0xfcd9d4
sw $t5, 0($t3)
addi $t3, $t4, 3268
li $t5, 0xfcfcfb
sw $t5, 0($t3)
addi $t3, $t4, 3272
li $t5, 0xf9e3dd
sw $t5, 0($t3)
addi $t3, $t4, 3276
li $t5, 0xfad6d0
sw $t5, 0($t3)
addi $t3, $t4, 3280
li $t5, 0xfbdad4
sw $t5, 0($t3)
addi $t3, $t4, 3284
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3288
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3292
sw $t5, 0($t3)
addi $t3, $t4, 3296
sw $t5, 0($t3)
addi $t3, $t4, 3300
sw $t5, 0($t3)
addi $t3, $t4, 3304
li $t5, 0xfcc2b8
sw $t5, 0($t3)
addi $t3, $t4, 3308
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 3312
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3316
sw $t5, 0($t3)
addi $t3, $t4, 3320
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3324
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 3328
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 3332
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 3336
li $t5, 0xfde7e2
sw $t5, 0($t3)
addi $t3, $t4, 3340
li $t5, 0xfefffd
sw $t5, 0($t3)
addi $t3, $t4, 3344
li $t5, 0xfefdfb
sw $t5, 0($t3)
addi $t3, $t4, 3348
li $t5, 0xfef3f0
sw $t5, 0($t3)
addi $t3, $t4, 3352
li $t5, 0xfdf0f0
sw $t5, 0($t3)
addi $t3, $t4, 3356
li $t5, 0xfdfaf9
sw $t5, 0($t3)
addi $t3, $t4, 3360
li $t5, 0xfcf1ef
sw $t5, 0($t3)
addi $t3, $t4, 3364
li $t5, 0xfaf5f4
sw $t5, 0($t3)
addi $t3, $t4, 3368
li $t5, 0xfbf2f1
sw $t5, 0($t3)
addi $t3, $t4, 3372
li $t5, 0xfaf1ef
sw $t5, 0($t3)
addi $t3, $t4, 3376
li $t5, 0xfaf1ed
sw $t5, 0($t3)
addi $t3, $t4, 3380
li $t5, 0xfbf0ed
sw $t5, 0($t3)
addi $t3, $t4, 3384
li $t5, 0xfceae7
sw $t5, 0($t3)
addi $t3, $t4, 3388
li $t5, 0xfdede9
sw $t5, 0($t3)
addi $t3, $t4, 3392
li $t5, 0xfecdc8
sw $t5, 0($t3)
addi $t3, $t4, 3396
li $t5, 0xf7beb2
sw $t5, 0($t3)
addi $t3, $t4, 3400
li $t5, 0xac9edd
sw $t5, 0($t3)
addi $t3, $t4, 3404
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3408
li $t5, 0xc8bcf0
sw $t5, 0($t3)
addi $t3, $t4, 3412
li $t5, 0xcbc1f1
sw $t5, 0($t3)
addi $t3, $t4, 3416
li $t5, 0x969bfc
sw $t5, 0($t3)
addi $t3, $t4, 3420
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3424
li $t5, 0xe4b9d3
sw $t5, 0($t3)
addi $t3, $t4, 3428
li $t5, 0xfddfdd
sw $t5, 0($t3)
addi $t3, $t4, 3432
li $t5, 0xfcdfe0
sw $t5, 0($t3)
addi $t3, $t4, 3436
li $t5, 0xeacddf
sw $t5, 0($t3)
addi $t3, $t4, 3440
li $t5, 0xf8c8c7
sw $t5, 0($t3)
addi $t3, $t4, 3444
li $t5, 0xead2e4
sw $t5, 0($t3)
addi $t3, $t4, 3448
li $t5, 0xf8dde0
sw $t5, 0($t3)
addi $t3, $t4, 3452
li $t5, 0xf4d0d6
sw $t5, 0($t3)
addi $t3, $t4, 3456
li $t5, 0xedbac7
sw $t5, 0($t3)
addi $t3, $t4, 3460
li $t5, 0xe2b4a4
sw $t5, 0($t3)
addi $t3, $t4, 3464
li $t5, 0xf5bcc2
sw $t5, 0($t3)
addi $t3, $t4, 3468
li $t5, 0xf8bebf
sw $t5, 0($t3)
addi $t3, $t4, 3472
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 3476
li $t5, 0xdfb1bf
sw $t5, 0($t3)
addi $t3, $t4, 3480
li $t5, 0xe0b0ad
sw $t5, 0($t3)
addi $t3, $t4, 3484
li $t5, 0xe3b6b1
sw $t5, 0($t3)
addi $t3, $t4, 3488
li $t5, 0xdab3c1
sw $t5, 0($t3)
addi $t3, $t4, 3492
li $t5, 0xf5bdb8
sw $t5, 0($t3)
addi $t3, $t4, 3496
li $t5, 0xedbac9
sw $t5, 0($t3)
addi $t3, $t4, 3500
li $t5, 0xfcc0ba
sw $t5, 0($t3)
addi $t3, $t4, 3504
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3508
sw $t5, 0($t3)
addi $t3, $t4, 3512
sw $t5, 0($t3)
addi $t3, $t4, 3516
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3520
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 3524
li $t5, 0xfccac2
sw $t5, 0($t3)
addi $t3, $t4, 3528
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 3532
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3536
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3540
sw $t5, 0($t3)
addi $t3, $t4, 3544
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3548
sw $t5, 0($t3)
addi $t3, $t4, 3552
sw $t5, 0($t3)
addi $t3, $t4, 3556
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3560
sw $t5, 0($t3)
addi $t3, $t4, 3564
sw $t5, 0($t3)
addi $t3, $t4, 3568
sw $t5, 0($t3)
addi $t3, $t4, 3572
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3576
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3580
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 3584
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 3588
li $t5, 0xfccec6
sw $t5, 0($t3)
addi $t3, $t4, 3592
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 3596
li $t5, 0xfefaf8
sw $t5, 0($t3)
addi $t3, $t4, 3600
li $t5, 0xfffdfb
sw $t5, 0($t3)
addi $t3, $t4, 3604
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 3608
li $t5, 0xfcf7f4
sw $t5, 0($t3)
addi $t3, $t4, 3612
li $t5, 0xfdfcfb
sw $t5, 0($t3)
addi $t3, $t4, 3616
li $t5, 0xfbf2f0
sw $t5, 0($t3)
addi $t3, $t4, 3620
li $t5, 0xfbf5f4
sw $t5, 0($t3)
addi $t3, $t4, 3624
li $t5, 0xfae9e6
sw $t5, 0($t3)
addi $t3, $t4, 3628
li $t5, 0xfae9e4
sw $t5, 0($t3)
addi $t3, $t4, 3632
li $t5, 0xfaf0ed
sw $t5, 0($t3)
addi $t3, $t4, 3636
li $t5, 0xf9f2ef
sw $t5, 0($t3)
addi $t3, $t4, 3640
li $t5, 0xfdf5f2
sw $t5, 0($t3)
addi $t3, $t4, 3644
li $t5, 0xfbf1ef
sw $t5, 0($t3)
addi $t3, $t4, 3648
li $t5, 0xfde6e6
sw $t5, 0($t3)
addi $t3, $t4, 3652
li $t5, 0xcfae99
sw $t5, 0($t3)
addi $t3, $t4, 3656
li $t5, 0xbaa4e2
sw $t5, 0($t3)
addi $t3, $t4, 3660
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3664
li $t5, 0xecd5e1
sw $t5, 0($t3)
addi $t3, $t4, 3668
li $t5, 0xfbd0c8
sw $t5, 0($t3)
addi $t3, $t4, 3672
li $t5, 0xe7c2d5
sw $t5, 0($t3)
addi $t3, $t4, 3676
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3680
li $t5, 0xb8a8ef
sw $t5, 0($t3)
addi $t3, $t4, 3684
li $t5, 0xf6c3c4
sw $t5, 0($t3)
addi $t3, $t4, 3688
li $t5, 0xa6a1f6
sw $t5, 0($t3)
addi $t3, $t4, 3692
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3696
li $t5, 0x9497fb
sw $t5, 0($t3)
addi $t3, $t4, 3700
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3704
li $t5, 0xc9b1e6
sw $t5, 0($t3)
addi $t3, $t4, 3708
li $t5, 0xaea1f0
sw $t5, 0($t3)
addi $t3, $t4, 3712
li $t5, 0x9096fa
sw $t5, 0($t3)
addi $t3, $t4, 3716
li $t5, 0xe8b7b0
sw $t5, 0($t3)
addi $t3, $t4, 3720
li $t5, 0x9598f7
sw $t5, 0($t3)
addi $t3, $t4, 3724
li $t5, 0x9a99f3
sw $t5, 0($t3)
addi $t3, $t4, 3728
li $t5, 0xdbafab
sw $t5, 0($t3)
addi $t3, $t4, 3732
li $t5, 0x8f96fd
sw $t5, 0($t3)
addi $t3, $t4, 3736
li $t5, 0xb8a5ec
sw $t5, 0($t3)
addi $t3, $t4, 3740
li $t5, 0xc6a9e4
sw $t5, 0($t3)
addi $t3, $t4, 3744
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3748
li $t5, 0x9898fa
sw $t5, 0($t3)
addi $t3, $t4, 3752
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3756
li $t5, 0xa59df5
sw $t5, 0($t3)
addi $t3, $t4, 3760
li $t5, 0xf8bbba
sw $t5, 0($t3)
addi $t3, $t4, 3764
li $t5, 0xfebdb3
sw $t5, 0($t3)
addi $t3, $t4, 3768
li $t5, 0xfeb5ac
sw $t5, 0($t3)
addi $t3, $t4, 3772
li $t5, 0xfebfb6
sw $t5, 0($t3)
addi $t3, $t4, 3776
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 3780
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3784
sw $t5, 0($t3)
addi $t3, $t4, 3788
sw $t5, 0($t3)
addi $t3, $t4, 3792
sw $t5, 0($t3)
addi $t3, $t4, 3796
sw $t5, 0($t3)
addi $t3, $t4, 3800
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 3804
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 3808
sw $t5, 0($t3)
addi $t3, $t4, 3812
sw $t5, 0($t3)
addi $t3, $t4, 3816
sw $t5, 0($t3)
addi $t3, $t4, 3820
sw $t5, 0($t3)
addi $t3, $t4, 3824
sw $t5, 0($t3)
addi $t3, $t4, 3828
sw $t5, 0($t3)
addi $t3, $t4, 3832
sw $t5, 0($t3)
addi $t3, $t4, 3836
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 3840
li $t5, 0xfcd8d1
sw $t5, 0($t3)
addi $t3, $t4, 3844
li $t5, 0xfde0da
sw $t5, 0($t3)
addi $t3, $t4, 3848
li $t5, 0xfef6f4
sw $t5, 0($t3)
addi $t3, $t4, 3852
li $t5, 0xfceeec
sw $t5, 0($t3)
addi $t3, $t4, 3856
li $t5, 0xfefcfa
sw $t5, 0($t3)
addi $t3, $t4, 3860
li $t5, 0xfefefc
sw $t5, 0($t3)
addi $t3, $t4, 3864
li $t5, 0xfffefc
sw $t5, 0($t3)
addi $t3, $t4, 3868
li $t5, 0xfad9d3
sw $t5, 0($t3)
addi $t3, $t4, 3872
li $t5, 0xfbf6f4
sw $t5, 0($t3)
addi $t3, $t4, 3876
li $t5, 0xfcf1ed
sw $t5, 0($t3)
addi $t3, $t4, 3880
li $t5, 0xfbe2de
sw $t5, 0($t3)
addi $t3, $t4, 3884
li $t5, 0xf9d3cd
sw $t5, 0($t3)
addi $t3, $t4, 3888
li $t5, 0xfdf0ec
sw $t5, 0($t3)
addi $t3, $t4, 3892
li $t5, 0xf9f1ef
sw $t5, 0($t3)
addi $t3, $t4, 3896
li $t5, 0xf9e9e7
sw $t5, 0($t3)
addi $t3, $t4, 3900
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 3904
li $t5, 0xfceaea
sw $t5, 0($t3)
addi $t3, $t4, 3908
li $t5, 0xe7b9aa
sw $t5, 0($t3)
addi $t3, $t4, 3912
li $t5, 0xc0a7e4
sw $t5, 0($t3)
addi $t3, $t4, 3916
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3920
li $t5, 0xeebfcb
sw $t5, 0($t3)
addi $t3, $t4, 3924
li $t5, 0xfbdfde
sw $t5, 0($t3)
addi $t3, $t4, 3928
li $t5, 0xf7e2e3
sw $t5, 0($t3)
addi $t3, $t4, 3932
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3936
li $t5, 0xaba9f7
sw $t5, 0($t3)
addi $t3, $t4, 3940
li $t5, 0xc6b3eb
sw $t5, 0($t3)
addi $t3, $t4, 3944
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3948
li $t5, 0xbca6ea
sw $t5, 0($t3)
addi $t3, $t4, 3952
li $t5, 0xab9ff2
sw $t5, 0($t3)
addi $t3, $t4, 3956
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3960
li $t5, 0xbaa5df
sw $t5, 0($t3)
addi $t3, $t4, 3964
li $t5, 0xa39aca
sw $t5, 0($t3)
addi $t3, $t4, 3968
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3972
li $t5, 0xb1abeb
sw $t5, 0($t3)
addi $t3, $t4, 3976
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3980
sw $t5, 0($t3)
addi $t3, $t4, 3984
li $t5, 0xbca6e9
sw $t5, 0($t3)
addi $t3, $t4, 3988
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 3992
li $t5, 0xd8b2d8
sw $t5, 0($t3)
addi $t3, $t4, 3996
li $t5, 0xc4a9e6
sw $t5, 0($t3)
addi $t3, $t4, 4000
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4004
li $t5, 0xb1a1f0
sw $t5, 0($t3)
addi $t3, $t4, 4008
li $t5, 0xb5a4ee
sw $t5, 0($t3)
addi $t3, $t4, 4012
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4016
li $t5, 0xd0a8dc
sw $t5, 0($t3)
addi $t3, $t4, 4020
li $t5, 0xfcc4bb
sw $t5, 0($t3)
addi $t3, $t4, 4024
li $t5, 0xfdb8ae
sw $t5, 0($t3)
addi $t3, $t4, 4028
li $t5, 0xfec0b6
sw $t5, 0($t3)
addi $t3, $t4, 4032
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 4036
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4040
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4044
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 4048
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4052
sw $t5, 0($t3)
addi $t3, $t4, 4056
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 4060
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4064
li $t5, 0xfdc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4068
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 4072
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4076
sw $t5, 0($t3)
addi $t3, $t4, 4080
sw $t5, 0($t3)
addi $t3, $t4, 4084
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4088
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4092
li $t5, 0xfec2b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 4096
li $t5, 0xfcf4f1
sw $t5, 0($t3)
addi $t3, $t4, 4100
li $t5, 0xfcede9
sw $t5, 0($t3)
addi $t3, $t4, 4104
li $t5, 0xfdf2f0
sw $t5, 0($t3)
addi $t3, $t4, 4108
li $t5, 0xfef5f2
sw $t5, 0($t3)
addi $t3, $t4, 4112
li $t5, 0xfef6f3
sw $t5, 0($t3)
addi $t3, $t4, 4116
li $t5, 0xfdebea
sw $t5, 0($t3)
addi $t3, $t4, 4120
li $t5, 0xfdfbf9
sw $t5, 0($t3)
addi $t3, $t4, 4124
li $t5, 0xfdfcfb
sw $t5, 0($t3)
addi $t3, $t4, 4128
li $t5, 0xfbf0ed
sw $t5, 0($t3)
addi $t3, $t4, 4132
li $t5, 0xfdfaf8
sw $t5, 0($t3)
addi $t3, $t4, 4136
li $t5, 0xfdede9
sw $t5, 0($t3)
addi $t3, $t4, 4140
li $t5, 0xfbe6e1
sw $t5, 0($t3)
addi $t3, $t4, 4144
li $t5, 0xfbece9
sw $t5, 0($t3)
addi $t3, $t4, 4148
li $t5, 0xfaf5f3
sw $t5, 0($t3)
addi $t3, $t4, 4152
li $t5, 0xfcece9
sw $t5, 0($t3)
addi $t3, $t4, 4156
li $t5, 0xfcefed
sw $t5, 0($t3)
addi $t3, $t4, 4160
li $t5, 0xfcd3cf
sw $t5, 0($t3)
addi $t3, $t4, 4164
li $t5, 0xe6b7a8
sw $t5, 0($t3)
addi $t3, $t4, 4168
li $t5, 0xa99edc
sw $t5, 0($t3)
addi $t3, $t4, 4172
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4176
li $t5, 0xd6c5cd
sw $t5, 0($t3)
addi $t3, $t4, 4180
li $t5, 0xfcf8f6
sw $t5, 0($t3)
addi $t3, $t4, 4184
li $t5, 0xcdcbf6
sw $t5, 0($t3)
addi $t3, $t4, 4188
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4192
li $t5, 0xc3c4f9
sw $t5, 0($t3)
addi $t3, $t4, 4196
li $t5, 0xb6b9fd
sw $t5, 0($t3)
addi $t3, $t4, 4200
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4204
li $t5, 0xb69b99
sw $t5, 0($t3)
addi $t3, $t4, 4208
li $t5, 0xb2a6cd
sw $t5, 0($t3)
addi $t3, $t4, 4212
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4216
li $t5, 0xa7a4e5
sw $t5, 0($t3)
addi $t3, $t4, 4220
li $t5, 0xc3adc1
sw $t5, 0($t3)
addi $t3, $t4, 4224
li $t5, 0x8b95fe
sw $t5, 0($t3)
addi $t3, $t4, 4228
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4232
li $t5, 0x8c95fe
sw $t5, 0($t3)
addi $t3, $t4, 4236
li $t5, 0x8a94ff
sw $t5, 0($t3)
addi $t3, $t4, 4240
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4244
li $t5, 0x9297fc
sw $t5, 0($t3)
addi $t3, $t4, 4248
li $t5, 0xfbbfbc
sw $t5, 0($t3)
addi $t3, $t4, 4252
li $t5, 0xc5a8e6
sw $t5, 0($t3)
addi $t3, $t4, 4256
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4260
li $t5, 0xefbac7
sw $t5, 0($t3)
addi $t3, $t4, 4264
li $t5, 0xf5bdc2
sw $t5, 0($t3)
addi $t3, $t4, 4268
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4272
li $t5, 0xbca8ea
sw $t5, 0($t3)
addi $t3, $t4, 4276
li $t5, 0xf8ccc5
sw $t5, 0($t3)
addi $t3, $t4, 4280
li $t5, 0xf8c4bb
sw $t5, 0($t3)
addi $t3, $t4, 4284
li $t5, 0xfdb6ad
sw $t5, 0($t3)
addi $t3, $t4, 4288
li $t5, 0xfdbcb1
sw $t5, 0($t3)
addi $t3, $t4, 4292
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4296
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 4300
sw $t5, 0($t3)
addi $t3, $t4, 4304
sw $t5, 0($t3)
addi $t3, $t4, 4308
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4312
li $t5, 0xfdc6be
sw $t5, 0($t3)
addi $t3, $t4, 4316
li $t5, 0xfdd8d3
sw $t5, 0($t3)
addi $t3, $t4, 4320
li $t5, 0xfce2db
sw $t5, 0($t3)
addi $t3, $t4, 4324
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4328
sw $t5, 0($t3)
addi $t3, $t4, 4332
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4336
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 4340
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4344
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4348
li $t5, 0xfec2b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 4352
li $t5, 0xfdf3f0
sw $t5, 0($t3)
addi $t3, $t4, 4356
li $t5, 0xfcefed
sw $t5, 0($t3)
addi $t3, $t4, 4360
li $t5, 0xfdf1ee
sw $t5, 0($t3)
addi $t3, $t4, 4364
li $t5, 0xfdf3f0
sw $t5, 0($t3)
addi $t3, $t4, 4368
li $t5, 0xfef4f1
sw $t5, 0($t3)
addi $t3, $t4, 4372
li $t5, 0xfdf1ee
sw $t5, 0($t3)
addi $t3, $t4, 4376
li $t5, 0xf9e9e8
sw $t5, 0($t3)
addi $t3, $t4, 4380
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 4384
sw $t5, 0($t3)
addi $t3, $t4, 4388
li $t5, 0xfefcfb
sw $t5, 0($t3)
addi $t3, $t4, 4392
li $t5, 0xf9f1ef
sw $t5, 0($t3)
addi $t3, $t4, 4396
li $t5, 0xfcf1ef
sw $t5, 0($t3)
addi $t3, $t4, 4400
li $t5, 0xfefbfa
sw $t5, 0($t3)
addi $t3, $t4, 4404
li $t5, 0xfae8e7
sw $t5, 0($t3)
addi $t3, $t4, 4408
li $t5, 0xfdd7d1
sw $t5, 0($t3)
addi $t3, $t4, 4412
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4416
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 4420
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4424
li $t5, 0xc5a8e6
sw $t5, 0($t3)
addi $t3, $t4, 4428
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4432
li $t5, 0xa69ef4
sw $t5, 0($t3)
addi $t3, $t4, 4436
li $t5, 0x9ca0fa
sw $t5, 0($t3)
addi $t3, $t4, 4440
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4444
li $t5, 0x939bfd
sw $t5, 0($t3)
addi $t3, $t4, 4448
li $t5, 0xdfd8eb
sw $t5, 0($t3)
addi $t3, $t4, 4452
li $t5, 0xb5ace3
sw $t5, 0($t3)
addi $t3, $t4, 4456
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4460
li $t5, 0x9ba2fe
sw $t5, 0($t3)
addi $t3, $t4, 4464
li $t5, 0x949dff
sw $t5, 0($t3)
addi $t3, $t4, 4468
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4472
li $t5, 0xc6c6fe
sw $t5, 0($t3)
addi $t3, $t4, 4476
li $t5, 0xf3e2f5
sw $t5, 0($t3)
addi $t3, $t4, 4480
li $t5, 0xb2abf9
sw $t5, 0($t3)
addi $t3, $t4, 4484
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4488
li $t5, 0xa4a1f5
sw $t5, 0($t3)
addi $t3, $t4, 4492
li $t5, 0x9fa0f4
sw $t5, 0($t3)
addi $t3, $t4, 4496
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4500
li $t5, 0xa99cdc
sw $t5, 0($t3)
addi $t3, $t4, 4504
li $t5, 0xe0b2a2
sw $t5, 0($t3)
addi $t3, $t4, 4508
li $t5, 0xc4a8e6
sw $t5, 0($t3)
addi $t3, $t4, 4512
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4516
li $t5, 0xf1bbc5
sw $t5, 0($t3)
addi $t3, $t4, 4520
li $t5, 0xf6bdbf
sw $t5, 0($t3)
addi $t3, $t4, 4524
li $t5, 0x8994ff
sw $t5, 0($t3)
addi $t3, $t4, 4528
li $t5, 0xbba7eb
sw $t5, 0($t3)
addi $t3, $t4, 4532
li $t5, 0xf7c9c2
sw $t5, 0($t3)
addi $t3, $t4, 4536
li $t5, 0xfcc9c0
sw $t5, 0($t3)
addi $t3, $t4, 4540
li $t5, 0xfeb5ab
sw $t5, 0($t3)
addi $t3, $t4, 4544
li $t5, 0xfebdb3
sw $t5, 0($t3)
addi $t3, $t4, 4548
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4552
sw $t5, 0($t3)
addi $t3, $t4, 4556
sw $t5, 0($t3)
addi $t3, $t4, 4560
sw $t5, 0($t3)
addi $t3, $t4, 4564
li $t5, 0xfcc4bb
sw $t5, 0($t3)
addi $t3, $t4, 4568
li $t5, 0xfbd5ce
sw $t5, 0($t3)
addi $t3, $t4, 4572
li $t5, 0xfdd9d6
sw $t5, 0($t3)
addi $t3, $t4, 4576
li $t5, 0xfde2dc
sw $t5, 0($t3)
addi $t3, $t4, 4580
li $t5, 0xfbcbc3
sw $t5, 0($t3)
addi $t3, $t4, 4584
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4588
sw $t5, 0($t3)
addi $t3, $t4, 4592
sw $t5, 0($t3)
addi $t3, $t4, 4596
sw $t5, 0($t3)
addi $t3, $t4, 4600
sw $t5, 0($t3)
addi $t3, $t4, 4604
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 4608
li $t5, 0xfff5f3
sw $t5, 0($t3)
addi $t3, $t4, 4612
li $t5, 0xfef2ef
sw $t5, 0($t3)
addi $t3, $t4, 4616
li $t5, 0xfeedea
sw $t5, 0($t3)
addi $t3, $t4, 4620
li $t5, 0xfeede9
sw $t5, 0($t3)
addi $t3, $t4, 4624
li $t5, 0xfcede9
sw $t5, 0($t3)
addi $t3, $t4, 4628
li $t5, 0xfef4f2
sw $t5, 0($t3)
addi $t3, $t4, 4632
li $t5, 0xfce5e4
sw $t5, 0($t3)
addi $t3, $t4, 4636
li $t5, 0xfbeaea
sw $t5, 0($t3)
addi $t3, $t4, 4640
li $t5, 0xfeffff
sw $t5, 0($t3)
addi $t3, $t4, 4644
li $t5, 0xfaefec
sw $t5, 0($t3)
addi $t3, $t4, 4648
li $t5, 0xfcf7f5
sw $t5, 0($t3)
addi $t3, $t4, 4652
li $t5, 0xfbf4f3
sw $t5, 0($t3)
addi $t3, $t4, 4656
li $t5, 0xfcf8f7
sw $t5, 0($t3)
addi $t3, $t4, 4660
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 4664
li $t5, 0xfcdad7
sw $t5, 0($t3)
addi $t3, $t4, 4668
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4672
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4676
sw $t5, 0($t3)
addi $t3, $t4, 4680
li $t5, 0xd2aedd
sw $t5, 0($t3)
addi $t3, $t4, 4684
li $t5, 0x8c95fe
sw $t5, 0($t3)
addi $t3, $t4, 4688
li $t5, 0x8b95fe
sw $t5, 0($t3)
addi $t3, $t4, 4692
li $t5, 0x919afe
sw $t5, 0($t3)
addi $t3, $t4, 4696
li $t5, 0xb7baff
sw $t5, 0($t3)
addi $t3, $t4, 4700
li $t5, 0xf1f0fd
sw $t5, 0($t3)
addi $t3, $t4, 4704
li $t5, 0xf5f5f8
sw $t5, 0($t3)
addi $t3, $t4, 4708
li $t5, 0xebe5ef
sw $t5, 0($t3)
addi $t3, $t4, 4712
li $t5, 0xc2c6fd
sw $t5, 0($t3)
addi $t3, $t4, 4716
li $t5, 0x949eff
sw $t5, 0($t3)
addi $t3, $t4, 4720
li $t5, 0xb2b7fe
sw $t5, 0($t3)
addi $t3, $t4, 4724
li $t5, 0x929bfe
sw $t5, 0($t3)
addi $t3, $t4, 4728
li $t5, 0xcccbf9
sw $t5, 0($t3)
addi $t3, $t4, 4732
li $t5, 0xf6f4f8
sw $t5, 0($t3)
addi $t3, $t4, 4736
li $t5, 0xe3dcf8
sw $t5, 0($t3)
addi $t3, $t4, 4740
li $t5, 0x929afe
sw $t5, 0($t3)
addi $t3, $t4, 4744
li $t5, 0xd4c4f0
sw $t5, 0($t3)
addi $t3, $t4, 4748
li $t5, 0xcdbcf2
sw $t5, 0($t3)
addi $t3, $t4, 4752
li $t5, 0x8f97fe
sw $t5, 0($t3)
addi $t3, $t4, 4756
li $t5, 0xc2a4d3
sw $t5, 0($t3)
addi $t3, $t4, 4760
li $t5, 0xd8a7ad
sw $t5, 0($t3)
addi $t3, $t4, 4764
li $t5, 0xbaa3d5
sw $t5, 0($t3)
addi $t3, $t4, 4768
li $t5, 0x9297fa
sw $t5, 0($t3)
addi $t3, $t4, 4772
li $t5, 0xf7bdc0
sw $t5, 0($t3)
addi $t3, $t4, 4776
li $t5, 0xfbc0bc
sw $t5, 0($t3)
addi $t3, $t4, 4780
li $t5, 0x9897f9
sw $t5, 0($t3)
addi $t3, $t4, 4784
li $t5, 0xc9a8e0
sw $t5, 0($t3)
addi $t3, $t4, 4788
li $t5, 0xfdbdb4
sw $t5, 0($t3)
addi $t3, $t4, 4792
li $t5, 0xfdb4ab
sw $t5, 0($t3)
addi $t3, $t4, 4796
li $t5, 0xfec0b6
sw $t5, 0($t3)
addi $t3, $t4, 4800
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4804
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 4808
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4812
sw $t5, 0($t3)
addi $t3, $t4, 4816
sw $t5, 0($t3)
addi $t3, $t4, 4820
li $t5, 0xfdccc4
sw $t5, 0($t3)
addi $t3, $t4, 4824
li $t5, 0xfed5cf
sw $t5, 0($t3)
addi $t3, $t4, 4828
li $t5, 0xfed3cd
sw $t5, 0($t3)
addi $t3, $t4, 4832
li $t5, 0xfdcbc3
sw $t5, 0($t3)
addi $t3, $t4, 4836
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4840
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 4844
sw $t5, 0($t3)
addi $t3, $t4, 4848
sw $t5, 0($t3)
addi $t3, $t4, 4852
sw $t5, 0($t3)
addi $t3, $t4, 4856
sw $t5, 0($t3)
addi $t3, $t4, 4860
li $t5, 0xffc2b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 4864
li $t5, 0xfef4f1
sw $t5, 0($t3)
addi $t3, $t4, 4868
li $t5, 0xfeedea
sw $t5, 0($t3)
addi $t3, $t4, 4872
li $t5, 0xfbe1db
sw $t5, 0($t3)
addi $t3, $t4, 4876
li $t5, 0xfad5d0
sw $t5, 0($t3)
addi $t3, $t4, 4880
li $t5, 0xfeede9
sw $t5, 0($t3)
addi $t3, $t4, 4884
li $t5, 0xfdeeeb
sw $t5, 0($t3)
addi $t3, $t4, 4888
li $t5, 0xfef5f2
sw $t5, 0($t3)
addi $t3, $t4, 4892
li $t5, 0xfceeed
sw $t5, 0($t3)
addi $t3, $t4, 4896
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 4900
li $t5, 0xfefcfb
sw $t5, 0($t3)
addi $t3, $t4, 4904
li $t5, 0xfbdedb
sw $t5, 0($t3)
addi $t3, $t4, 4908
li $t5, 0xfcf3f1
sw $t5, 0($t3)
addi $t3, $t4, 4912
li $t5, 0xfdfaf9
sw $t5, 0($t3)
addi $t3, $t4, 4916
li $t5, 0xfce0df
sw $t5, 0($t3)
addi $t3, $t4, 4920
li $t5, 0xfec9c3
sw $t5, 0($t3)
addi $t3, $t4, 4924
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 4928
sw $t5, 0($t3)
addi $t3, $t4, 4932
sw $t5, 0($t3)
addi $t3, $t4, 4936
li $t5, 0xecbcb7
sw $t5, 0($t3)
addi $t3, $t4, 4940
li $t5, 0xe9e0e4
sw $t5, 0($t3)
addi $t3, $t4, 4944
li $t5, 0xfdfbfb
sw $t5, 0($t3)
addi $t3, $t4, 4948
li $t5, 0xfdfefd
sw $t5, 0($t3)
addi $t3, $t4, 4952
li $t5, 0xfafafc
sw $t5, 0($t3)
addi $t3, $t4, 4956
li $t5, 0xf9f7fc
sw $t5, 0($t3)
addi $t3, $t4, 4960
li $t5, 0xf9fafb
sw $t5, 0($t3)
addi $t3, $t4, 4964
li $t5, 0xf8f2fc
sw $t5, 0($t3)
addi $t3, $t4, 4968
li $t5, 0xf9f3f9
sw $t5, 0($t3)
addi $t3, $t4, 4972
li $t5, 0xfaf5f6
sw $t5, 0($t3)
addi $t3, $t4, 4976
li $t5, 0xf5f1f5
sw $t5, 0($t3)
addi $t3, $t4, 4980
li $t5, 0xfbfbf9
sw $t5, 0($t3)
addi $t3, $t4, 4984
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 4988
li $t5, 0xfefffd
sw $t5, 0($t3)
addi $t3, $t4, 4992
li $t5, 0xfffffe
sw $t5, 0($t3)
addi $t3, $t4, 4996
li $t5, 0xfffefe
sw $t5, 0($t3)
addi $t3, $t4, 5000
li $t5, 0xfffcfe
sw $t5, 0($t3)
addi $t3, $t4, 5004
li $t5, 0xfbf7fb
sw $t5, 0($t3)
addi $t3, $t4, 5008
li $t5, 0xf0e8f2
sw $t5, 0($t3)
addi $t3, $t4, 5012
li $t5, 0xe5cee9
sw $t5, 0($t3)
addi $t3, $t4, 5016
li $t5, 0xd2aadd
sw $t5, 0($t3)
addi $t3, $t4, 5020
li $t5, 0xcea4bd
sw $t5, 0($t3)
addi $t3, $t4, 5024
li $t5, 0xf6beb3
sw $t5, 0($t3)
addi $t3, $t4, 5028
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 5032
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 5036
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5040
sw $t5, 0($t3)
addi $t3, $t4, 5044
li $t5, 0xfdbeb3
sw $t5, 0($t3)
addi $t3, $t4, 5048
li $t5, 0xfeb8ae
sw $t5, 0($t3)
addi $t3, $t4, 5052
li $t5, 0xffbfb6
sw $t5, 0($t3)
addi $t3, $t4, 5056
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5060
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 5064
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5068
sw $t5, 0($t3)
addi $t3, $t4, 5072
sw $t5, 0($t3)
addi $t3, $t4, 5076
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5080
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5084
sw $t5, 0($t3)
addi $t3, $t4, 5088
sw $t5, 0($t3)
addi $t3, $t4, 5092
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5096
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5100
sw $t5, 0($t3)
addi $t3, $t4, 5104
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 5108
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5112
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5116
li $t5, 0xfec2b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 5120
li $t5, 0xfdf1ee
sw $t5, 0($t3)
addi $t3, $t4, 5124
li $t5, 0xfdece8
sw $t5, 0($t3)
addi $t3, $t4, 5128
li $t5, 0xfbddd8
sw $t5, 0($t3)
addi $t3, $t4, 5132
li $t5, 0xfbd4ce
sw $t5, 0($t3)
addi $t3, $t4, 5136
li $t5, 0xfde5e1
sw $t5, 0($t3)
addi $t3, $t4, 5140
li $t5, 0xfcefed
sw $t5, 0($t3)
addi $t3, $t4, 5144
li $t5, 0xfdf0ee
sw $t5, 0($t3)
addi $t3, $t4, 5148
li $t5, 0xfdeae7
sw $t5, 0($t3)
addi $t3, $t4, 5152
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 5156
li $t5, 0xfdf7f6
sw $t5, 0($t3)
addi $t3, $t4, 5160
li $t5, 0xfdd9d5
sw $t5, 0($t3)
addi $t3, $t4, 5164
li $t5, 0xfdc3b9
sw $t5, 0($t3)
addi $t3, $t4, 5168
li $t5, 0xfbcbc7
sw $t5, 0($t3)
addi $t3, $t4, 5172
li $t5, 0xfcc5bd
sw $t5, 0($t3)
addi $t3, $t4, 5176
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5180
sw $t5, 0($t3)
addi $t3, $t4, 5184
sw $t5, 0($t3)
addi $t3, $t4, 5188
li $t5, 0xe8c1c1
sw $t5, 0($t3)
addi $t3, $t4, 5192
li $t5, 0xf4eff5
sw $t5, 0($t3)
addi $t3, $t4, 5196
li $t5, 0xfbfcfb
sw $t5, 0($t3)
addi $t3, $t4, 5200
li $t5, 0xf8f6fa
sw $t5, 0($t3)
addi $t3, $t4, 5204
li $t5, 0xfaf8fc
sw $t5, 0($t3)
addi $t3, $t4, 5208
li $t5, 0xfbf6fd
sw $t5, 0($t3)
addi $t3, $t4, 5212
li $t5, 0xfef8fe
sw $t5, 0($t3)
addi $t3, $t4, 5216
li $t5, 0xfdf7fe
sw $t5, 0($t3)
addi $t3, $t4, 5220
li $t5, 0xebe4ec
sw $t5, 0($t3)
addi $t3, $t4, 5224
li $t5, 0xfcfdfb
sw $t5, 0($t3)
addi $t3, $t4, 5228
li $t5, 0xfefcfd
sw $t5, 0($t3)
addi $t3, $t4, 5232
li $t5, 0xf8f4fc
sw $t5, 0($t3)
addi $t3, $t4, 5236
li $t5, 0xfcf6fb
sw $t5, 0($t3)
addi $t3, $t4, 5240
li $t5, 0xfaf3fa
sw $t5, 0($t3)
addi $t3, $t4, 5244
li $t5, 0xfcfafc
sw $t5, 0($t3)
addi $t3, $t4, 5248
li $t5, 0xfefffe
sw $t5, 0($t3)
addi $t3, $t4, 5252
li $t5, 0xffffff
sw $t5, 0($t3)
addi $t3, $t4, 5256
sw $t5, 0($t3)
addi $t3, $t4, 5260
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 5264
li $t5, 0xfcfbfc
sw $t5, 0($t3)
addi $t3, $t4, 5268
li $t5, 0xfdf6fa
sw $t5, 0($t3)
addi $t3, $t4, 5272
li $t5, 0xf0daf0
sw $t5, 0($t3)
addi $t3, $t4, 5276
li $t5, 0xdca9d8
sw $t5, 0($t3)
addi $t3, $t4, 5280
li $t5, 0xd9adc5
sw $t5, 0($t3)
addi $t3, $t4, 5284
li $t5, 0xfabdb5
sw $t5, 0($t3)
addi $t3, $t4, 5288
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5292
sw $t5, 0($t3)
addi $t3, $t4, 5296
sw $t5, 0($t3)
addi $t3, $t4, 5300
sw $t5, 0($t3)
addi $t3, $t4, 5304
sw $t5, 0($t3)
addi $t3, $t4, 5308
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5312
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 5316
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5320
sw $t5, 0($t3)
addi $t3, $t4, 5324
sw $t5, 0($t3)
addi $t3, $t4, 5328
sw $t5, 0($t3)
addi $t3, $t4, 5332
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5336
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5340
sw $t5, 0($t3)
addi $t3, $t4, 5344
sw $t5, 0($t3)
addi $t3, $t4, 5348
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 5352
sw $t5, 0($t3)
addi $t3, $t4, 5356
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5360
sw $t5, 0($t3)
addi $t3, $t4, 5364
sw $t5, 0($t3)
addi $t3, $t4, 5368
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5372
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 5376
li $t5, 0xfdf1ef
sw $t5, 0($t3)
addi $t3, $t4, 5380
li $t5, 0xfdeeec
sw $t5, 0($t3)
addi $t3, $t4, 5384
li $t5, 0xfeeeeb
sw $t5, 0($t3)
addi $t3, $t4, 5388
li $t5, 0xfdeae7
sw $t5, 0($t3)
addi $t3, $t4, 5392
li $t5, 0xfeeeeb
sw $t5, 0($t3)
addi $t3, $t4, 5396
li $t5, 0xfdf0ec
sw $t5, 0($t3)
addi $t3, $t4, 5400
li $t5, 0xfcf3f0
sw $t5, 0($t3)
addi $t3, $t4, 5404
li $t5, 0xfdebe7
sw $t5, 0($t3)
addi $t3, $t4, 5408
li $t5, 0xfeece8
sw $t5, 0($t3)
addi $t3, $t4, 5412
li $t5, 0xfcd6cf
sw $t5, 0($t3)
addi $t3, $t4, 5416
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 5420
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5424
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 5428
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 5432
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5436
sw $t5, 0($t3)
addi $t3, $t4, 5440
li $t5, 0xe8c5c1
sw $t5, 0($t3)
addi $t3, $t4, 5444
li $t5, 0xfbfaf9
sw $t5, 0($t3)
addi $t3, $t4, 5448
li $t5, 0xf8f5fb
sw $t5, 0($t3)
addi $t3, $t4, 5452
li $t5, 0xf0eeed
sw $t5, 0($t3)
addi $t3, $t4, 5456
li $t5, 0xeceae7
sw $t5, 0($t3)
addi $t3, $t4, 5460
li $t5, 0xf6f4f4
sw $t5, 0($t3)
addi $t3, $t4, 5464
li $t5, 0xf8f5f8
sw $t5, 0($t3)
addi $t3, $t4, 5468
li $t5, 0xf6f0f8
sw $t5, 0($t3)
addi $t3, $t4, 5472
li $t5, 0xf2ebf1
sw $t5, 0($t3)
addi $t3, $t4, 5476
li $t5, 0xecedef
sw $t5, 0($t3)
addi $t3, $t4, 5480
li $t5, 0xfdfcfc
sw $t5, 0($t3)
addi $t3, $t4, 5484
li $t5, 0xf8f3f8
sw $t5, 0($t3)
addi $t3, $t4, 5488
li $t5, 0xebe1ed
sw $t5, 0($t3)
addi $t3, $t4, 5492
li $t5, 0xf1edef
sw $t5, 0($t3)
addi $t3, $t4, 5496
li $t5, 0xf3f0f3
sw $t5, 0($t3)
addi $t3, $t4, 5500
li $t5, 0xebe4ec
sw $t5, 0($t3)
addi $t3, $t4, 5504
li $t5, 0xefe8f1
sw $t5, 0($t3)
addi $t3, $t4, 5508
li $t5, 0xfdfbfb
sw $t5, 0($t3)
addi $t3, $t4, 5512
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 5516
li $t5, 0xf3f2f4
sw $t5, 0($t3)
addi $t3, $t4, 5520
li $t5, 0xe9e4e5
sw $t5, 0($t3)
addi $t3, $t4, 5524
li $t5, 0xf0efea
sw $t5, 0($t3)
addi $t3, $t4, 5528
li $t5, 0xf3f5ee
sw $t5, 0($t3)
addi $t3, $t4, 5532
li $t5, 0xefd9e8
sw $t5, 0($t3)
addi $t3, $t4, 5536
li $t5, 0xeeb9de
sw $t5, 0($t3)
addi $t3, $t4, 5540
li $t5, 0xead3d8
sw $t5, 0($t3)
addi $t3, $t4, 5544
li $t5, 0xeebcb4
sw $t5, 0($t3)
addi $t3, $t4, 5548
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5552
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 5556
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5560
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5564
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5568
sw $t5, 0($t3)
addi $t3, $t4, 5572
sw $t5, 0($t3)
addi $t3, $t4, 5576
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5580
sw $t5, 0($t3)
addi $t3, $t4, 5584
sw $t5, 0($t3)
addi $t3, $t4, 5588
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5592
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 5596
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 5600
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5604
sw $t5, 0($t3)
addi $t3, $t4, 5608
sw $t5, 0($t3)
addi $t3, $t4, 5612
sw $t5, 0($t3)
addi $t3, $t4, 5616
sw $t5, 0($t3)
addi $t3, $t4, 5620
sw $t5, 0($t3)
addi $t3, $t4, 5624
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 5628
li $t5, 0xfec2b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 5632
li $t5, 0xfcedea
sw $t5, 0($t3)
addi $t3, $t4, 5636
li $t5, 0xfff5f3
sw $t5, 0($t3)
addi $t3, $t4, 5640
li $t5, 0xfdf1ee
sw $t5, 0($t3)
addi $t3, $t4, 5644
li $t5, 0xfdf2ef
sw $t5, 0($t3)
addi $t3, $t4, 5648
li $t5, 0xfdf1ee
sw $t5, 0($t3)
addi $t3, $t4, 5652
li $t5, 0xfef4f2
sw $t5, 0($t3)
addi $t3, $t4, 5656
li $t5, 0xfcf1ee
sw $t5, 0($t3)
addi $t3, $t4, 5660
li $t5, 0xfae7e1
sw $t5, 0($t3)
addi $t3, $t4, 5664
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 5668
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 5672
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 5676
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5680
sw $t5, 0($t3)
addi $t3, $t4, 5684
sw $t5, 0($t3)
addi $t3, $t4, 5688
sw $t5, 0($t3)
addi $t3, $t4, 5692
li $t5, 0xeebcb6
sw $t5, 0($t3)
addi $t3, $t4, 5696
li $t5, 0xf6f4f6
sw $t5, 0($t3)
addi $t3, $t4, 5700
li $t5, 0xfaf3fd
sw $t5, 0($t3)
addi $t3, $t4, 5704
li $t5, 0xf5f1f7
sw $t5, 0($t3)
addi $t3, $t4, 5708
li $t5, 0xfcfcf8
sw $t5, 0($t3)
addi $t3, $t4, 5712
li $t5, 0xfafcf9
sw $t5, 0($t3)
addi $t3, $t4, 5716
li $t5, 0xf0f0ea
sw $t5, 0($t3)
addi $t3, $t4, 5720
li $t5, 0xeae2ea
sw $t5, 0($t3)
addi $t3, $t4, 5724
li $t5, 0xfdf6fc
sw $t5, 0($t3)
addi $t3, $t4, 5728
li $t5, 0xf4eff7
sw $t5, 0($t3)
addi $t3, $t4, 5732
li $t5, 0xeef3f3
sw $t5, 0($t3)
addi $t3, $t4, 5736
li $t5, 0xf3f3f7
sw $t5, 0($t3)
addi $t3, $t4, 5740
li $t5, 0xf9eff9
sw $t5, 0($t3)
addi $t3, $t4, 5744
li $t5, 0xf3e6f6
sw $t5, 0($t3)
addi $t3, $t4, 5748
li $t5, 0xf9f1fb
sw $t5, 0($t3)
addi $t3, $t4, 5752
li $t5, 0xf6f2f3
sw $t5, 0($t3)
addi $t3, $t4, 5756
li $t5, 0xfbfafb
sw $t5, 0($t3)
addi $t3, $t4, 5760
li $t5, 0xfefeff
sw $t5, 0($t3)
addi $t3, $t4, 5764
li $t5, 0xf8f7f5
sw $t5, 0($t3)
addi $t3, $t4, 5768
li $t5, 0xf0eeea
sw $t5, 0($t3)
addi $t3, $t4, 5772
li $t5, 0xf5f2f4
sw $t5, 0($t3)
addi $t3, $t4, 5776
li $t5, 0xfdfcfe
sw $t5, 0($t3)
addi $t3, $t4, 5780
li $t5, 0xfffefe
sw $t5, 0($t3)
addi $t3, $t4, 5784
li $t5, 0xfefeff
sw $t5, 0($t3)
addi $t3, $t4, 5788
li $t5, 0xfafcfb
sw $t5, 0($t3)
addi $t3, $t4, 5792
li $t5, 0xefe1e5
sw $t5, 0($t3)
addi $t3, $t4, 5796
li $t5, 0xf9f5f6
sw $t5, 0($t3)
addi $t3, $t4, 5800
li $t5, 0xf2efee
sw $t5, 0($t3)
addi $t3, $t4, 5804
li $t5, 0xf1bdb5
sw $t5, 0($t3)
addi $t3, $t4, 5808
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5812
sw $t5, 0($t3)
addi $t3, $t4, 5816
sw $t5, 0($t3)
addi $t3, $t4, 5820
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 5824
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5828
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5832
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5836
sw $t5, 0($t3)
addi $t3, $t4, 5840
sw $t5, 0($t3)
addi $t3, $t4, 5844
sw $t5, 0($t3)
addi $t3, $t4, 5848
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5852
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 5856
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5860
sw $t5, 0($t3)
addi $t3, $t4, 5864
sw $t5, 0($t3)
addi $t3, $t4, 5868
sw $t5, 0($t3)
addi $t3, $t4, 5872
sw $t5, 0($t3)
addi $t3, $t4, 5876
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 5880
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5884
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 5888
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 5892
li $t5, 0xfdf1f0
sw $t5, 0($t3)
addi $t3, $t4, 5896
li $t5, 0xfdf1ef
sw $t5, 0($t3)
addi $t3, $t4, 5900
li $t5, 0xfbf0ec
sw $t5, 0($t3)
addi $t3, $t4, 5904
li $t5, 0xfdf1ee
sw $t5, 0($t3)
addi $t3, $t4, 5908
li $t5, 0xfef9f6
sw $t5, 0($t3)
addi $t3, $t4, 5912
li $t5, 0xfdf4f2
sw $t5, 0($t3)
addi $t3, $t4, 5916
li $t5, 0xfefcfa
sw $t5, 0($t3)
addi $t3, $t4, 5920
li $t5, 0xfdd6cf
sw $t5, 0($t3)
addi $t3, $t4, 5924
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 5928
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 5932
sw $t5, 0($t3)
addi $t3, $t4, 5936
sw $t5, 0($t3)
addi $t3, $t4, 5940
sw $t5, 0($t3)
addi $t3, $t4, 5944
li $t5, 0xfdc0b7
sw $t5, 0($t3)
addi $t3, $t4, 5948
li $t5, 0xe2d4dc
sw $t5, 0($t3)
addi $t3, $t4, 5952
li $t5, 0xfbf2fd
sw $t5, 0($t3)
addi $t3, $t4, 5956
li $t5, 0xf5f2f6
sw $t5, 0($t3)
addi $t3, $t4, 5960
li $t5, 0xf5f6f4
sw $t5, 0($t3)
addi $t3, $t4, 5964
li $t5, 0xf9f5fb
sw $t5, 0($t3)
addi $t3, $t4, 5968
li $t5, 0xfbf9fb
sw $t5, 0($t3)
addi $t3, $t4, 5972
li $t5, 0xf1edf1
sw $t5, 0($t3)
addi $t3, $t4, 5976
li $t5, 0xece4ed
sw $t5, 0($t3)
addi $t3, $t4, 5980
li $t5, 0xf6ebf7
sw $t5, 0($t3)
addi $t3, $t4, 5984
li $t5, 0xefebf2
sw $t5, 0($t3)
addi $t3, $t4, 5988
li $t5, 0xece0ee
sw $t5, 0($t3)
addi $t3, $t4, 5992
li $t5, 0xf4ebf7
sw $t5, 0($t3)
addi $t3, $t4, 5996
li $t5, 0xf0eaf1
sw $t5, 0($t3)
addi $t3, $t4, 6000
li $t5, 0xfcfbfb
sw $t5, 0($t3)
addi $t3, $t4, 6004
li $t5, 0xf7f6fa
sw $t5, 0($t3)
addi $t3, $t4, 6008
li $t5, 0xfcfafd
sw $t5, 0($t3)
addi $t3, $t4, 6012
li $t5, 0xf6f3f6
sw $t5, 0($t3)
addi $t3, $t4, 6016
li $t5, 0xf9faf5
sw $t5, 0($t3)
addi $t3, $t4, 6020
li $t5, 0xe6e2e2
sw $t5, 0($t3)
addi $t3, $t4, 6024
li $t5, 0xddd9e0
sw $t5, 0($t3)
addi $t3, $t4, 6028
li $t5, 0xebe9ed
sw $t5, 0($t3)
addi $t3, $t4, 6032
li $t5, 0xfcf9fc
sw $t5, 0($t3)
addi $t3, $t4, 6036
li $t5, 0xfef9fa
sw $t5, 0($t3)
addi $t3, $t4, 6040
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 6044
li $t5, 0xfffeff
sw $t5, 0($t3)
addi $t3, $t4, 6048
li $t5, 0xfafbfa
sw $t5, 0($t3)
addi $t3, $t4, 6052
li $t5, 0xf0d3e3
sw $t5, 0($t3)
addi $t3, $t4, 6056
li $t5, 0xfae7f2
sw $t5, 0($t3)
addi $t3, $t4, 6060
li $t5, 0xdfd2ce
sw $t5, 0($t3)
addi $t3, $t4, 6064
li $t5, 0xfdc0b7
sw $t5, 0($t3)
addi $t3, $t4, 6068
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6072
sw $t5, 0($t3)
addi $t3, $t4, 6076
sw $t5, 0($t3)
addi $t3, $t4, 6080
sw $t5, 0($t3)
addi $t3, $t4, 6084
sw $t5, 0($t3)
addi $t3, $t4, 6088
sw $t5, 0($t3)
addi $t3, $t4, 6092
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 6096
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6100
sw $t5, 0($t3)
addi $t3, $t4, 6104
sw $t5, 0($t3)
addi $t3, $t4, 6108
sw $t5, 0($t3)
addi $t3, $t4, 6112
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6116
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6120
sw $t5, 0($t3)
addi $t3, $t4, 6124
sw $t5, 0($t3)
addi $t3, $t4, 6128
sw $t5, 0($t3)
addi $t3, $t4, 6132
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6136
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6140
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 6144
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 6148
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 6152
li $t5, 0xfdfbf8
sw $t5, 0($t3)
addi $t3, $t4, 6156
li $t5, 0xfbd8d2
sw $t5, 0($t3)
addi $t3, $t4, 6160
li $t5, 0xfdf3f1
sw $t5, 0($t3)
addi $t3, $t4, 6164
li $t5, 0xfef8f6
sw $t5, 0($t3)
addi $t3, $t4, 6168
li $t5, 0xfef6f4
sw $t5, 0($t3)
addi $t3, $t4, 6172
li $t5, 0xfefcfa
sw $t5, 0($t3)
addi $t3, $t4, 6176
li $t5, 0xfde6e2
sw $t5, 0($t3)
addi $t3, $t4, 6180
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6184
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6188
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6192
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6196
sw $t5, 0($t3)
addi $t3, $t4, 6200
li $t5, 0xe1bcbc
sw $t5, 0($t3)
addi $t3, $t4, 6204
li $t5, 0xf8f4fc
sw $t5, 0($t3)
addi $t3, $t4, 6208
li $t5, 0xfcf4fb
sw $t5, 0($t3)
addi $t3, $t4, 6212
li $t5, 0xfdfdf9
sw $t5, 0($t3)
addi $t3, $t4, 6216
li $t5, 0xfcfbfa
sw $t5, 0($t3)
addi $t3, $t4, 6220
li $t5, 0xfbf7f7
sw $t5, 0($t3)
addi $t3, $t4, 6224
li $t5, 0xf5edf4
sw $t5, 0($t3)
addi $t3, $t4, 6228
li $t5, 0xf8f4f8
sw $t5, 0($t3)
addi $t3, $t4, 6232
li $t5, 0xe6e5e4
sw $t5, 0($t3)
addi $t3, $t4, 6236
li $t5, 0xe4dbe8
sw $t5, 0($t3)
addi $t3, $t4, 6240
li $t5, 0xe9deec
sw $t5, 0($t3)
addi $t3, $t4, 6244
li $t5, 0xf9f5fb
sw $t5, 0($t3)
addi $t3, $t4, 6248
li $t5, 0xfdfcfb
sw $t5, 0($t3)
addi $t3, $t4, 6252
li $t5, 0xf2ecf3
sw $t5, 0($t3)
addi $t3, $t4, 6256
li $t5, 0xddd8dc
sw $t5, 0($t3)
addi $t3, $t4, 6260
li $t5, 0xe7e5ea
sw $t5, 0($t3)
addi $t3, $t4, 6264
li $t5, 0xeceeef
sw $t5, 0($t3)
addi $t3, $t4, 6268
li $t5, 0xeee6ee
sw $t5, 0($t3)
addi $t3, $t4, 6272
li $t5, 0xf1ecf2
sw $t5, 0($t3)
addi $t3, $t4, 6276
li $t5, 0xf5f0f7
sw $t5, 0($t3)
addi $t3, $t4, 6280
li $t5, 0xfdfcfc
sw $t5, 0($t3)
addi $t3, $t4, 6284
li $t5, 0xf4f7f8
sw $t5, 0($t3)
addi $t3, $t4, 6288
li $t5, 0xe6dde5
sw $t5, 0($t3)
addi $t3, $t4, 6292
li $t5, 0xfaeff1
sw $t5, 0($t3)
addi $t3, $t4, 6296
li $t5, 0xf8f9f6
sw $t5, 0($t3)
addi $t3, $t4, 6300
li $t5, 0xfffffe
sw $t5, 0($t3)
addi $t3, $t4, 6304
li $t5, 0xfefeff
sw $t5, 0($t3)
addi $t3, $t4, 6308
li $t5, 0xf4eef0
sw $t5, 0($t3)
addi $t3, $t4, 6312
li $t5, 0xe9b6da
sw $t5, 0($t3)
addi $t3, $t4, 6316
li $t5, 0xf4e2eb
sw $t5, 0($t3)
addi $t3, $t4, 6320
li $t5, 0xd9aea7
sw $t5, 0($t3)
addi $t3, $t4, 6324
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 6328
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6332
sw $t5, 0($t3)
addi $t3, $t4, 6336
sw $t5, 0($t3)
addi $t3, $t4, 6340
sw $t5, 0($t3)
addi $t3, $t4, 6344
sw $t5, 0($t3)
addi $t3, $t4, 6348
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 6352
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6356
sw $t5, 0($t3)
addi $t3, $t4, 6360
sw $t5, 0($t3)
addi $t3, $t4, 6364
sw $t5, 0($t3)
addi $t3, $t4, 6368
sw $t5, 0($t3)
addi $t3, $t4, 6372
sw $t5, 0($t3)
addi $t3, $t4, 6376
sw $t5, 0($t3)
addi $t3, $t4, 6380
sw $t5, 0($t3)
addi $t3, $t4, 6384
sw $t5, 0($t3)
addi $t3, $t4, 6388
sw $t5, 0($t3)
addi $t3, $t4, 6392
sw $t5, 0($t3)
addi $t3, $t4, 6396
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 6400
li $t5, 0xfdeae8
sw $t5, 0($t3)
addi $t3, $t4, 6404
li $t5, 0xfdefec
sw $t5, 0($t3)
addi $t3, $t4, 6408
li $t5, 0xfdcec6
sw $t5, 0($t3)
addi $t3, $t4, 6412
li $t5, 0xfdc3b9
sw $t5, 0($t3)
addi $t3, $t4, 6416
li $t5, 0xfdfaf9
sw $t5, 0($t3)
addi $t3, $t4, 6420
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 6424
sw $t5, 0($t3)
addi $t3, $t4, 6428
li $t5, 0xfdf8f6
sw $t5, 0($t3)
addi $t3, $t4, 6432
li $t5, 0xfdd9d4
sw $t5, 0($t3)
addi $t3, $t4, 6436
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6440
sw $t5, 0($t3)
addi $t3, $t4, 6444
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 6448
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6452
li $t5, 0xfcbfb6
sw $t5, 0($t3)
addi $t3, $t4, 6456
li $t5, 0xe1dfe1
sw $t5, 0($t3)
addi $t3, $t4, 6460
li $t5, 0xf8ecf8
sw $t5, 0($t3)
addi $t3, $t4, 6464
li $t5, 0xfdfaf7
sw $t5, 0($t3)
addi $t3, $t4, 6468
li $t5, 0xfdfcfa
sw $t5, 0($t3)
addi $t3, $t4, 6472
li $t5, 0xfcfefd
sw $t5, 0($t3)
addi $t3, $t4, 6476
li $t5, 0xfdfbfd
sw $t5, 0($t3)
addi $t3, $t4, 6480
li $t5, 0xf0e9f0
sw $t5, 0($t3)
addi $t3, $t4, 6484
li $t5, 0xe6dfeb
sw $t5, 0($t3)
addi $t3, $t4, 6488
li $t5, 0xf4ecf4
sw $t5, 0($t3)
addi $t3, $t4, 6492
li $t5, 0xf3ebf4
sw $t5, 0($t3)
addi $t3, $t4, 6496
li $t5, 0xe4d6e4
sw $t5, 0($t3)
addi $t3, $t4, 6500
li $t5, 0xfdf9fc
sw $t5, 0($t3)
addi $t3, $t4, 6504
li $t5, 0xf9f6f7
sw $t5, 0($t3)
addi $t3, $t4, 6508
li $t5, 0xfcfafd
sw $t5, 0($t3)
addi $t3, $t4, 6512
li $t5, 0xece4ed
sw $t5, 0($t3)
addi $t3, $t4, 6516
li $t5, 0xf4ebf4
sw $t5, 0($t3)
addi $t3, $t4, 6520
li $t5, 0xeae5eb
sw $t5, 0($t3)
addi $t3, $t4, 6524
li $t5, 0xf6f6f6
sw $t5, 0($t3)
addi $t3, $t4, 6528
li $t5, 0xf4f0f1
sw $t5, 0($t3)
addi $t3, $t4, 6532
li $t5, 0xfcf4f9
sw $t5, 0($t3)
addi $t3, $t4, 6536
li $t5, 0xfaf4fc
sw $t5, 0($t3)
addi $t3, $t4, 6540
li $t5, 0xfbfcfe
sw $t5, 0($t3)
addi $t3, $t4, 6544
li $t5, 0xf0eaed
sw $t5, 0($t3)
addi $t3, $t4, 6548
li $t5, 0xfafbf7
sw $t5, 0($t3)
addi $t3, $t4, 6552
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 6556
li $t5, 0xf8f8f1
sw $t5, 0($t3)
addi $t3, $t4, 6560
li $t5, 0xfffffe
sw $t5, 0($t3)
addi $t3, $t4, 6564
li $t5, 0xfdfefe
sw $t5, 0($t3)
addi $t3, $t4, 6568
li $t5, 0xe0d0de
sw $t5, 0($t3)
addi $t3, $t4, 6572
li $t5, 0xe9c1e6
sw $t5, 0($t3)
addi $t3, $t4, 6576
li $t5, 0xd1c6c4
sw $t5, 0($t3)
addi $t3, $t4, 6580
li $t5, 0xf8bdb2
sw $t5, 0($t3)
addi $t3, $t4, 6584
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6588
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6592
sw $t5, 0($t3)
addi $t3, $t4, 6596
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 6600
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 6604
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 6608
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6612
sw $t5, 0($t3)
addi $t3, $t4, 6616
sw $t5, 0($t3)
addi $t3, $t4, 6620
sw $t5, 0($t3)
addi $t3, $t4, 6624
sw $t5, 0($t3)
addi $t3, $t4, 6628
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 6632
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6636
sw $t5, 0($t3)
addi $t3, $t4, 6640
sw $t5, 0($t3)
addi $t3, $t4, 6644
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 6648
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6652
li $t5, 0xffc1b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 6656
li $t5, 0xfdc9c1
sw $t5, 0($t3)
addi $t3, $t4, 6660
li $t5, 0xfec3ba
sw $t5, 0($t3)
addi $t3, $t4, 6664
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6668
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 6672
li $t5, 0xfcd4cd
sw $t5, 0($t3)
addi $t3, $t4, 6676
li $t5, 0xfef6f4
sw $t5, 0($t3)
addi $t3, $t4, 6680
li $t5, 0xfdebe9
sw $t5, 0($t3)
addi $t3, $t4, 6684
li $t5, 0xfddddb
sw $t5, 0($t3)
addi $t3, $t4, 6688
li $t5, 0xfec6bd
sw $t5, 0($t3)
addi $t3, $t4, 6692
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6696
sw $t5, 0($t3)
addi $t3, $t4, 6700
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 6704
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 6708
li $t5, 0xe3b4b0
sw $t5, 0($t3)
addi $t3, $t4, 6712
li $t5, 0xf5f8fb
sw $t5, 0($t3)
addi $t3, $t4, 6716
li $t5, 0xf7e6f3
sw $t5, 0($t3)
addi $t3, $t4, 6720
li $t5, 0xfefdfa
sw $t5, 0($t3)
addi $t3, $t4, 6724
li $t5, 0xf6e9f2
sw $t5, 0($t3)
addi $t3, $t4, 6728
li $t5, 0xfcfefd
sw $t5, 0($t3)
addi $t3, $t4, 6732
li $t5, 0xf5e7f4
sw $t5, 0($t3)
addi $t3, $t4, 6736
li $t5, 0xf6f3f6
sw $t5, 0($t3)
addi $t3, $t4, 6740
li $t5, 0xe0dbe4
sw $t5, 0($t3)
addi $t3, $t4, 6744
li $t5, 0xfcf8fd
sw $t5, 0($t3)
addi $t3, $t4, 6748
li $t5, 0xfcfafb
sw $t5, 0($t3)
addi $t3, $t4, 6752
li $t5, 0xeae0e5
sw $t5, 0($t3)
addi $t3, $t4, 6756
li $t5, 0xfefcfd
sw $t5, 0($t3)
addi $t3, $t4, 6760
li $t5, 0xfaf8f9
sw $t5, 0($t3)
addi $t3, $t4, 6764
li $t5, 0xf9f5f5
sw $t5, 0($t3)
addi $t3, $t4, 6768
li $t5, 0xfbf8fa
sw $t5, 0($t3)
addi $t3, $t4, 6772
li $t5, 0xf3eaf2
sw $t5, 0($t3)
addi $t3, $t4, 6776
li $t5, 0xf8f3f7
sw $t5, 0($t3)
addi $t3, $t4, 6780
li $t5, 0xe4d6e5
sw $t5, 0($t3)
addi $t3, $t4, 6784
li $t5, 0xfdfbfd
sw $t5, 0($t3)
addi $t3, $t4, 6788
li $t5, 0xfdfdfb
sw $t5, 0($t3)
addi $t3, $t4, 6792
li $t5, 0xfdf6f6
sw $t5, 0($t3)
addi $t3, $t4, 6796
li $t5, 0xf6f0f6
sw $t5, 0($t3)
addi $t3, $t4, 6800
li $t5, 0xfcf3fa
sw $t5, 0($t3)
addi $t3, $t4, 6804
li $t5, 0xf9fbf7
sw $t5, 0($t3)
addi $t3, $t4, 6808
li $t5, 0xfefefc
sw $t5, 0($t3)
addi $t3, $t4, 6812
li $t5, 0xeeeee8
sw $t5, 0($t3)
addi $t3, $t4, 6816
li $t5, 0xfffffc
sw $t5, 0($t3)
addi $t3, $t4, 6820
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 6824
li $t5, 0xf0eeed
sw $t5, 0($t3)
addi $t3, $t4, 6828
li $t5, 0xe0b7e4
sw $t5, 0($t3)
addi $t3, $t4, 6832
li $t5, 0xecdee8
sw $t5, 0($t3)
addi $t3, $t4, 6836
li $t5, 0xd3a7a2
sw $t5, 0($t3)
addi $t3, $t4, 6840
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6844
sw $t5, 0($t3)
addi $t3, $t4, 6848
sw $t5, 0($t3)
addi $t3, $t4, 6852
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 6856
sw $t5, 0($t3)
addi $t3, $t4, 6860
sw $t5, 0($t3)
addi $t3, $t4, 6864
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6868
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6872
sw $t5, 0($t3)
addi $t3, $t4, 6876
li $t5, 0xffc0b7
sw $t5, 0($t3)
addi $t3, $t4, 6880
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6884
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6888
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6892
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6896
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 6900
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 6904
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6908
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 6912
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 6916
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6920
sw $t5, 0($t3)
addi $t3, $t4, 6924
sw $t5, 0($t3)
addi $t3, $t4, 6928
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 6932
li $t5, 0xfdcac2
sw $t5, 0($t3)
addi $t3, $t4, 6936
li $t5, 0xfdcfc8
sw $t5, 0($t3)
addi $t3, $t4, 6940
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 6944
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 6948
sw $t5, 0($t3)
addi $t3, $t4, 6952
sw $t5, 0($t3)
addi $t3, $t4, 6956
sw $t5, 0($t3)
addi $t3, $t4, 6960
sw $t5, 0($t3)
addi $t3, $t4, 6964
li $t5, 0xdccbce
sw $t5, 0($t3)
addi $t3, $t4, 6968
li $t5, 0xf5f1f9
sw $t5, 0($t3)
addi $t3, $t4, 6972
li $t5, 0xf5ebf3
sw $t5, 0($t3)
addi $t3, $t4, 6976
li $t5, 0xfcfcfc
sw $t5, 0($t3)
addi $t3, $t4, 6980
li $t5, 0xfaf9f9
sw $t5, 0($t3)
addi $t3, $t4, 6984
li $t5, 0xf8f1f9
sw $t5, 0($t3)
addi $t3, $t4, 6988
li $t5, 0xeee5ed
sw $t5, 0($t3)
addi $t3, $t4, 6992
li $t5, 0xe7e0e9
sw $t5, 0($t3)
addi $t3, $t4, 6996
li $t5, 0xf4f6f7
sw $t5, 0($t3)
addi $t3, $t4, 7000
li $t5, 0xfcfcfd
sw $t5, 0($t3)
addi $t3, $t4, 7004
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 7008
li $t5, 0xede7ec
sw $t5, 0($t3)
addi $t3, $t4, 7012
li $t5, 0xfefdfe
sw $t5, 0($t3)
addi $t3, $t4, 7016
li $t5, 0xf9faf6
sw $t5, 0($t3)
addi $t3, $t4, 7020
li $t5, 0xe7e0e1
sw $t5, 0($t3)
addi $t3, $t4, 7024
li $t5, 0xfefefc
sw $t5, 0($t3)
addi $t3, $t4, 7028
li $t5, 0xf7f8f5
sw $t5, 0($t3)
addi $t3, $t4, 7032
li $t5, 0xf1f1ed
sw $t5, 0($t3)
addi $t3, $t4, 7036
li $t5, 0xfaf4f8
sw $t5, 0($t3)
addi $t3, $t4, 7040
li $t5, 0xefeaeb
sw $t5, 0($t3)
addi $t3, $t4, 7044
li $t5, 0xffffff
sw $t5, 0($t3)
addi $t3, $t4, 7048
li $t5, 0xfdfdfa
sw $t5, 0($t3)
addi $t3, $t4, 7052
li $t5, 0xf6eff5
sw $t5, 0($t3)
addi $t3, $t4, 7056
li $t5, 0xf8f3f8
sw $t5, 0($t3)
addi $t3, $t4, 7060
li $t5, 0xf7ecf3
sw $t5, 0($t3)
addi $t3, $t4, 7064
li $t5, 0xf8f7f6
sw $t5, 0($t3)
addi $t3, $t4, 7068
li $t5, 0xfafbf7
sw $t5, 0($t3)
addi $t3, $t4, 7072
li $t5, 0xf1f1ef
sw $t5, 0($t3)
addi $t3, $t4, 7076
li $t5, 0xffffff
sw $t5, 0($t3)
addi $t3, $t4, 7080
li $t5, 0xfcfdfc
sw $t5, 0($t3)
addi $t3, $t4, 7084
li $t5, 0xe7cfda
sw $t5, 0($t3)
addi $t3, $t4, 7088
li $t5, 0xecd6ee
sw $t5, 0($t3)
addi $t3, $t4, 7092
li $t5, 0xc0b5b7
sw $t5, 0($t3)
addi $t3, $t4, 7096
li $t5, 0xfabeb5
sw $t5, 0($t3)
addi $t3, $t4, 7100
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7104
sw $t5, 0($t3)
addi $t3, $t4, 7108
sw $t5, 0($t3)
addi $t3, $t4, 7112
sw $t5, 0($t3)
addi $t3, $t4, 7116
sw $t5, 0($t3)
addi $t3, $t4, 7120
sw $t5, 0($t3)
addi $t3, $t4, 7124
sw $t5, 0($t3)
addi $t3, $t4, 7128
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7132
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7136
sw $t5, 0($t3)
addi $t3, $t4, 7140
sw $t5, 0($t3)
addi $t3, $t4, 7144
sw $t5, 0($t3)
addi $t3, $t4, 7148
sw $t5, 0($t3)
addi $t3, $t4, 7152
sw $t5, 0($t3)
addi $t3, $t4, 7156
sw $t5, 0($t3)
addi $t3, $t4, 7160
sw $t5, 0($t3)
addi $t3, $t4, 7164
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 7168
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 7172
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 7176
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7180
sw $t5, 0($t3)
addi $t3, $t4, 7184
sw $t5, 0($t3)
addi $t3, $t4, 7188
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 7192
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7196
sw $t5, 0($t3)
addi $t3, $t4, 7200
sw $t5, 0($t3)
addi $t3, $t4, 7204
sw $t5, 0($t3)
addi $t3, $t4, 7208
sw $t5, 0($t3)
addi $t3, $t4, 7212
sw $t5, 0($t3)
addi $t3, $t4, 7216
li $t5, 0xfabeb5
sw $t5, 0($t3)
addi $t3, $t4, 7220
li $t5, 0xd2d9e1
sw $t5, 0($t3)
addi $t3, $t4, 7224
li $t5, 0xefe0ee
sw $t5, 0($t3)
addi $t3, $t4, 7228
li $t5, 0xfbfbfb
sw $t5, 0($t3)
addi $t3, $t4, 7232
li $t5, 0xfcfefc
sw $t5, 0($t3)
addi $t3, $t4, 7236
li $t5, 0xfbf9fb
sw $t5, 0($t3)
addi $t3, $t4, 7240
li $t5, 0xe7dfea
sw $t5, 0($t3)
addi $t3, $t4, 7244
li $t5, 0xf6f3f5
sw $t5, 0($t3)
addi $t3, $t4, 7248
li $t5, 0xe8dfea
sw $t5, 0($t3)
addi $t3, $t4, 7252
li $t5, 0xf8f9f9
sw $t5, 0($t3)
addi $t3, $t4, 7256
li $t5, 0xfcf6f8
sw $t5, 0($t3)
addi $t3, $t4, 7260
li $t5, 0xfefffe
sw $t5, 0($t3)
addi $t3, $t4, 7264
li $t5, 0xeee5ef
sw $t5, 0($t3)
addi $t3, $t4, 7268
li $t5, 0xfbf7fb
sw $t5, 0($t3)
addi $t3, $t4, 7272
li $t5, 0xfbfdfc
sw $t5, 0($t3)
addi $t3, $t4, 7276
li $t5, 0xf0e9ee
sw $t5, 0($t3)
addi $t3, $t4, 7280
li $t5, 0xf2efee
sw $t5, 0($t3)
addi $t3, $t4, 7284
li $t5, 0xfdfefd
sw $t5, 0($t3)
addi $t3, $t4, 7288
li $t5, 0xf5f4f4
sw $t5, 0($t3)
addi $t3, $t4, 7292
li $t5, 0xf2f4f3
sw $t5, 0($t3)
addi $t3, $t4, 7296
li $t5, 0xfaf9f7
sw $t5, 0($t3)
addi $t3, $t4, 7300
li $t5, 0xf3f2f4
sw $t5, 0($t3)
addi $t3, $t4, 7304
li $t5, 0xfdf6f8
sw $t5, 0($t3)
addi $t3, $t4, 7308
li $t5, 0xf3eff2
sw $t5, 0($t3)
addi $t3, $t4, 7312
li $t5, 0xfdfcfc
sw $t5, 0($t3)
addi $t3, $t4, 7316
li $t5, 0xf9f2fb
sw $t5, 0($t3)
addi $t3, $t4, 7320
li $t5, 0xead6ea
sw $t5, 0($t3)
addi $t3, $t4, 7324
li $t5, 0xfcf7fb
sw $t5, 0($t3)
addi $t3, $t4, 7328
li $t5, 0xf0ece9
sw $t5, 0($t3)
addi $t3, $t4, 7332
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 7336
li $t5, 0xfcfffe
sw $t5, 0($t3)
addi $t3, $t4, 7340
li $t5, 0xf4efea
sw $t5, 0($t3)
addi $t3, $t4, 7344
li $t5, 0xeccfe9
sw $t5, 0($t3)
addi $t3, $t4, 7348
li $t5, 0xdac7d8
sw $t5, 0($t3)
addi $t3, $t4, 7352
li $t5, 0xefb6ae
sw $t5, 0($t3)
addi $t3, $t4, 7356
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7360
sw $t5, 0($t3)
addi $t3, $t4, 7364
sw $t5, 0($t3)
addi $t3, $t4, 7368
sw $t5, 0($t3)
addi $t3, $t4, 7372
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7376
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7380
sw $t5, 0($t3)
addi $t3, $t4, 7384
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7388
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7392
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7396
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7400
sw $t5, 0($t3)
addi $t3, $t4, 7404
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7408
li $t5, 0xfec1b7
sw $t5, 0($t3)
addi $t3, $t4, 7412
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7416
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 7420
li $t5, 0xfec2b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 7424
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 7428
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 7432
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7436
li $t5, 0xfec1b9
sw $t5, 0($t3)
addi $t3, $t4, 7440
li $t5, 0xfec8bf
sw $t5, 0($t3)
addi $t3, $t4, 7444
li $t5, 0xfcc8c1
sw $t5, 0($t3)
addi $t3, $t4, 7448
li $t5, 0xfdc7bf
sw $t5, 0($t3)
addi $t3, $t4, 7452
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7456
sw $t5, 0($t3)
addi $t3, $t4, 7460
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 7464
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7468
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 7472
li $t5, 0xe1b4b3
sw $t5, 0($t3)
addi $t3, $t4, 7476
li $t5, 0xe7e8fa
sw $t5, 0($t3)
addi $t3, $t4, 7480
li $t5, 0xeddfec
sw $t5, 0($t3)
addi $t3, $t4, 7484
li $t5, 0xfaf9fb
sw $t5, 0($t3)
addi $t3, $t4, 7488
li $t5, 0xfefefb
sw $t5, 0($t3)
addi $t3, $t4, 7492
li $t5, 0xf6f3f6
sw $t5, 0($t3)
addi $t3, $t4, 7496
li $t5, 0xf0edf1
sw $t5, 0($t3)
addi $t3, $t4, 7500
li $t5, 0xf9f3f8
sw $t5, 0($t3)
addi $t3, $t4, 7504
li $t5, 0xe9e4e8
sw $t5, 0($t3)
addi $t3, $t4, 7508
li $t5, 0xfbf7fc
sw $t5, 0($t3)
addi $t3, $t4, 7512
li $t5, 0xfbf7f9
sw $t5, 0($t3)
addi $t3, $t4, 7516
li $t5, 0xfbfbfb
sw $t5, 0($t3)
addi $t3, $t4, 7520
li $t5, 0xf0ebf3
sw $t5, 0($t3)
addi $t3, $t4, 7524
li $t5, 0xfcf4fb
sw $t5, 0($t3)
addi $t3, $t4, 7528
li $t5, 0xfdfdfd
sw $t5, 0($t3)
addi $t3, $t4, 7532
li $t5, 0xfaf8fa
sw $t5, 0($t3)
addi $t3, $t4, 7536
li $t5, 0xf2e0f2
sw $t5, 0($t3)
addi $t3, $t4, 7540
li $t5, 0xf5f3f0
sw $t5, 0($t3)
addi $t3, $t4, 7544
li $t5, 0xfdfdfc
sw $t5, 0($t3)
addi $t3, $t4, 7548
li $t5, 0xf5f6f6
sw $t5, 0($t3)
addi $t3, $t4, 7552
li $t5, 0xf5f5f6
sw $t5, 0($t3)
addi $t3, $t4, 7556
li $t5, 0xf3eff3
sw $t5, 0($t3)
addi $t3, $t4, 7560
li $t5, 0xfaf7f9
sw $t5, 0($t3)
addi $t3, $t4, 7564
li $t5, 0xf6f4f7
sw $t5, 0($t3)
addi $t3, $t4, 7568
li $t5, 0xfcfbfa
sw $t5, 0($t3)
addi $t3, $t4, 7572
li $t5, 0xfdfefc
sw $t5, 0($t3)
addi $t3, $t4, 7576
li $t5, 0xe6d8e9
sw $t5, 0($t3)
addi $t3, $t4, 7580
li $t5, 0xf9f4fa
sw $t5, 0($t3)
addi $t3, $t4, 7584
li $t5, 0xf7f5f5
sw $t5, 0($t3)
addi $t3, $t4, 7588
li $t5, 0xfbfaf8
sw $t5, 0($t3)
addi $t3, $t4, 7592
li $t5, 0xfdfdfc
sw $t5, 0($t3)
addi $t3, $t4, 7596
li $t5, 0xfdfdf9
sw $t5, 0($t3)
addi $t3, $t4, 7600
li $t5, 0xf3e6ec
sw $t5, 0($t3)
addi $t3, $t4, 7604
li $t5, 0xead0ec
sw $t5, 0($t3)
addi $t3, $t4, 7608
li $t5, 0xd4a3a3
sw $t5, 0($t3)
addi $t3, $t4, 7612
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7616
sw $t5, 0($t3)
addi $t3, $t4, 7620
sw $t5, 0($t3)
addi $t3, $t4, 7624
sw $t5, 0($t3)
addi $t3, $t4, 7628
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 7632
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7636
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 7640
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7644
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7648
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7652
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7656
sw $t5, 0($t3)
addi $t3, $t4, 7660
sw $t5, 0($t3)
addi $t3, $t4, 7664
sw $t5, 0($t3)
addi $t3, $t4, 7668
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 7672
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7676
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 7680
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 7684
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 7688
li $t5, 0xfec3bb
sw $t5, 0($t3)
addi $t3, $t4, 7692
li $t5, 0xfcd2cc
sw $t5, 0($t3)
addi $t3, $t4, 7696
li $t5, 0xfbd8d2
sw $t5, 0($t3)
addi $t3, $t4, 7700
li $t5, 0xfddad6
sw $t5, 0($t3)
addi $t3, $t4, 7704
li $t5, 0xfde1db
sw $t5, 0($t3)
addi $t3, $t4, 7708
li $t5, 0xfec7bd
sw $t5, 0($t3)
addi $t3, $t4, 7712
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7716
sw $t5, 0($t3)
addi $t3, $t4, 7720
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 7724
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7728
li $t5, 0xdabcc5
sw $t5, 0($t3)
addi $t3, $t4, 7732
li $t5, 0xe7dbf4
sw $t5, 0($t3)
addi $t3, $t4, 7736
li $t5, 0xf1ecef
sw $t5, 0($t3)
addi $t3, $t4, 7740
li $t5, 0xf3eef4
sw $t5, 0($t3)
addi $t3, $t4, 7744
li $t5, 0xfdfefb
sw $t5, 0($t3)
addi $t3, $t4, 7748
li $t5, 0xf8f5f8
sw $t5, 0($t3)
addi $t3, $t4, 7752
li $t5, 0xf3f1f3
sw $t5, 0($t3)
addi $t3, $t4, 7756
li $t5, 0xf6eef9
sw $t5, 0($t3)
addi $t3, $t4, 7760
li $t5, 0xe9e7e9
sw $t5, 0($t3)
addi $t3, $t4, 7764
li $t5, 0xfbf2fb
sw $t5, 0($t3)
addi $t3, $t4, 7768
li $t5, 0xfcfaf9
sw $t5, 0($t3)
addi $t3, $t4, 7772
li $t5, 0xf1eef3
sw $t5, 0($t3)
addi $t3, $t4, 7776
li $t5, 0xf8f3f8
sw $t5, 0($t3)
addi $t3, $t4, 7780
li $t5, 0xfaeffa
sw $t5, 0($t3)
addi $t3, $t4, 7784
li $t5, 0xfcfaf9
sw $t5, 0($t3)
addi $t3, $t4, 7788
li $t5, 0xfcf9f9
sw $t5, 0($t3)
addi $t3, $t4, 7792
li $t5, 0xf9f2f9
sw $t5, 0($t3)
addi $t3, $t4, 7796
li $t5, 0xf0e3f6
sw $t5, 0($t3)
addi $t3, $t4, 7800
li $t5, 0xf4eff0
sw $t5, 0($t3)
addi $t3, $t4, 7804
li $t5, 0xf8f5f0
sw $t5, 0($t3)
addi $t3, $t4, 7808
li $t5, 0xfbf7fa
sw $t5, 0($t3)
addi $t3, $t4, 7812
li $t5, 0xfcfafb
sw $t5, 0($t3)
addi $t3, $t4, 7816
li $t5, 0xf9f0f9
sw $t5, 0($t3)
addi $t3, $t4, 7820
li $t5, 0xfdf5fc
sw $t5, 0($t3)
addi $t3, $t4, 7824
li $t5, 0xf1eff0
sw $t5, 0($t3)
addi $t3, $t4, 7828
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 7832
li $t5, 0xf9f2fa
sw $t5, 0($t3)
addi $t3, $t4, 7836
li $t5, 0xf1e8f5
sw $t5, 0($t3)
addi $t3, $t4, 7840
li $t5, 0xfdfcfb
sw $t5, 0($t3)
addi $t3, $t4, 7844
li $t5, 0xf7f6f5
sw $t5, 0($t3)
addi $t3, $t4, 7848
li $t5, 0xf9f9f7
sw $t5, 0($t3)
addi $t3, $t4, 7852
li $t5, 0xfefffe
sw $t5, 0($t3)
addi $t3, $t4, 7856
li $t5, 0xf7f3ef
sw $t5, 0($t3)
addi $t3, $t4, 7860
li $t5, 0xeedaf4
sw $t5, 0($t3)
addi $t3, $t4, 7864
li $t5, 0xcea9b7
sw $t5, 0($t3)
addi $t3, $t4, 7868
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 7872
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7876
sw $t5, 0($t3)
addi $t3, $t4, 7880
sw $t5, 0($t3)
addi $t3, $t4, 7884
li $t5, 0xffc0b7
sw $t5, 0($t3)
addi $t3, $t4, 7888
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7892
sw $t5, 0($t3)
addi $t3, $t4, 7896
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7900
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 7904
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 7908
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7912
sw $t5, 0($t3)
addi $t3, $t4, 7916
sw $t5, 0($t3)
addi $t3, $t4, 7920
sw $t5, 0($t3)
addi $t3, $t4, 7924
sw $t5, 0($t3)
addi $t3, $t4, 7928
sw $t5, 0($t3)
addi $t3, $t4, 7932
li $t5, 0xffc2b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 7936
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 7940
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7944
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7948
li $t5, 0xfdc7be
sw $t5, 0($t3)
addi $t3, $t4, 7952
li $t5, 0xfdd5cf
sw $t5, 0($t3)
addi $t3, $t4, 7956
li $t5, 0xfedbd7
sw $t5, 0($t3)
addi $t3, $t4, 7960
li $t5, 0xfce0d9
sw $t5, 0($t3)
addi $t3, $t4, 7964
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7968
sw $t5, 0($t3)
addi $t3, $t4, 7972
sw $t5, 0($t3)
addi $t3, $t4, 7976
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 7980
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 7984
li $t5, 0xd3c4d7
sw $t5, 0($t3)
addi $t3, $t4, 7988
li $t5, 0xdecee5
sw $t5, 0($t3)
addi $t3, $t4, 7992
li $t5, 0xfcf9fb
sw $t5, 0($t3)
addi $t3, $t4, 7996
li $t5, 0xf2edf3
sw $t5, 0($t3)
addi $t3, $t4, 8000
li $t5, 0xfcfbf8
sw $t5, 0($t3)
addi $t3, $t4, 8004
li $t5, 0xfbfbfb
sw $t5, 0($t3)
addi $t3, $t4, 8008
li $t5, 0xf4f2f4
sw $t5, 0($t3)
addi $t3, $t4, 8012
li $t5, 0xe9e3eb
sw $t5, 0($t3)
addi $t3, $t4, 8016
li $t5, 0xf6f5f4
sw $t5, 0($t3)
addi $t3, $t4, 8020
li $t5, 0xf5eff6
sw $t5, 0($t3)
addi $t3, $t4, 8024
li $t5, 0xfbf8f9
sw $t5, 0($t3)
addi $t3, $t4, 8028
li $t5, 0xf0e7f5
sw $t5, 0($t3)
addi $t3, $t4, 8032
li $t5, 0xfaf9fb
sw $t5, 0($t3)
addi $t3, $t4, 8036
li $t5, 0xf5ebf6
sw $t5, 0($t3)
addi $t3, $t4, 8040
li $t5, 0xfdf9f6
sw $t5, 0($t3)
addi $t3, $t4, 8044
li $t5, 0xfefbfc
sw $t5, 0($t3)
addi $t3, $t4, 8048
li $t5, 0xfbfaf6
sw $t5, 0($t3)
addi $t3, $t4, 8052
li $t5, 0xf6f1f6
sw $t5, 0($t3)
addi $t3, $t4, 8056
li $t5, 0xf8edfb
sw $t5, 0($t3)
addi $t3, $t4, 8060
li $t5, 0xefece9
sw $t5, 0($t3)
addi $t3, $t4, 8064
li $t5, 0xece5e7
sw $t5, 0($t3)
addi $t3, $t4, 8068
li $t5, 0xfdfbfb
sw $t5, 0($t3)
addi $t3, $t4, 8072
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 8076
li $t5, 0xfffcfc
sw $t5, 0($t3)
addi $t3, $t4, 8080
li $t5, 0xf4eef2
sw $t5, 0($t3)
addi $t3, $t4, 8084
li $t5, 0xfdfaf7
sw $t5, 0($t3)
addi $t3, $t4, 8088
li $t5, 0xfdfafe
sw $t5, 0($t3)
addi $t3, $t4, 8092
li $t5, 0xead8eb
sw $t5, 0($t3)
addi $t3, $t4, 8096
li $t5, 0xfbfafb
sw $t5, 0($t3)
addi $t3, $t4, 8100
li $t5, 0xf6f1f3
sw $t5, 0($t3)
addi $t3, $t4, 8104
li $t5, 0xf6f4f5
sw $t5, 0($t3)
addi $t3, $t4, 8108
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 8112
li $t5, 0xebe7e4
sw $t5, 0($t3)
addi $t3, $t4, 8116
li $t5, 0xf5e3f7
sw $t5, 0($t3)
addi $t3, $t4, 8120
li $t5, 0xd9b8cb
sw $t5, 0($t3)
addi $t3, $t4, 8124
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8128
sw $t5, 0($t3)
addi $t3, $t4, 8132
sw $t5, 0($t3)
addi $t3, $t4, 8136
sw $t5, 0($t3)
addi $t3, $t4, 8140
sw $t5, 0($t3)
addi $t3, $t4, 8144
sw $t5, 0($t3)
addi $t3, $t4, 8148
sw $t5, 0($t3)
addi $t3, $t4, 8152
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8156
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 8160
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8164
sw $t5, 0($t3)
addi $t3, $t4, 8168
sw $t5, 0($t3)
addi $t3, $t4, 8172
sw $t5, 0($t3)
addi $t3, $t4, 8176
sw $t5, 0($t3)
addi $t3, $t4, 8180
sw $t5, 0($t3)
addi $t3, $t4, 8184
sw $t5, 0($t3)
addi $t3, $t4, 8188
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 8192
li $t5, 0xfebfb5
sw $t5, 0($t3)
addi $t3, $t4, 8196
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 8200
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8204
sw $t5, 0($t3)
addi $t3, $t4, 8208
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8212
li $t5, 0xfdc2b9
sw $t5, 0($t3)
addi $t3, $t4, 8216
li $t5, 0xfdc2b8
sw $t5, 0($t3)
addi $t3, $t4, 8220
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8224
sw $t5, 0($t3)
addi $t3, $t4, 8228
sw $t5, 0($t3)
addi $t3, $t4, 8232
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8236
li $t5, 0xf8beb4
sw $t5, 0($t3)
addi $t3, $t4, 8240
li $t5, 0xd8cfe8
sw $t5, 0($t3)
addi $t3, $t4, 8244
li $t5, 0xe3d5e1
sw $t5, 0($t3)
addi $t3, $t4, 8248
li $t5, 0xf2eef3
sw $t5, 0($t3)
addi $t3, $t4, 8252
li $t5, 0xf9f8fa
sw $t5, 0($t3)
addi $t3, $t4, 8256
li $t5, 0xfbf9f9
sw $t5, 0($t3)
addi $t3, $t4, 8260
li $t5, 0xfaf8fb
sw $t5, 0($t3)
addi $t3, $t4, 8264
li $t5, 0xf2eff2
sw $t5, 0($t3)
addi $t3, $t4, 8268
li $t5, 0xe8ddea
sw $t5, 0($t3)
addi $t3, $t4, 8272
li $t5, 0xf9f7f7
sw $t5, 0($t3)
addi $t3, $t4, 8276
li $t5, 0xf8f5f8
sw $t5, 0($t3)
addi $t3, $t4, 8280
li $t5, 0xf7f3f8
sw $t5, 0($t3)
addi $t3, $t4, 8284
li $t5, 0xe9dfee
sw $t5, 0($t3)
addi $t3, $t4, 8288
li $t5, 0xfdfcfc
sw $t5, 0($t3)
addi $t3, $t4, 8292
li $t5, 0xf5eaf5
sw $t5, 0($t3)
addi $t3, $t4, 8296
li $t5, 0xfbfbf9
sw $t5, 0($t3)
addi $t3, $t4, 8300
li $t5, 0xf9f1f5
sw $t5, 0($t3)
addi $t3, $t4, 8304
li $t5, 0xfcfdfd
sw $t5, 0($t3)
addi $t3, $t4, 8308
li $t5, 0xfcfdf8
sw $t5, 0($t3)
addi $t3, $t4, 8312
li $t5, 0xf6e4ee
sw $t5, 0($t3)
addi $t3, $t4, 8316
li $t5, 0xfaf3fc
sw $t5, 0($t3)
addi $t3, $t4, 8320
li $t5, 0xf6f2f6
sw $t5, 0($t3)
addi $t3, $t4, 8324
li $t5, 0xefe6ee
sw $t5, 0($t3)
addi $t3, $t4, 8328
li $t5, 0xf0e7ef
sw $t5, 0($t3)
addi $t3, $t4, 8332
li $t5, 0xe3dbe2
sw $t5, 0($t3)
addi $t3, $t4, 8336
li $t5, 0xdbd8da
sw $t5, 0($t3)
addi $t3, $t4, 8340
li $t5, 0xecefe5
sw $t5, 0($t3)
addi $t3, $t4, 8344
li $t5, 0xfcfefb
sw $t5, 0($t3)
addi $t3, $t4, 8348
li $t5, 0xf0e2ec
sw $t5, 0($t3)
addi $t3, $t4, 8352
li $t5, 0xf7f3f9
sw $t5, 0($t3)
addi $t3, $t4, 8356
li $t5, 0xf2eaeb
sw $t5, 0($t3)
addi $t3, $t4, 8360
li $t5, 0xfbf6f8
sw $t5, 0($t3)
addi $t3, $t4, 8364
li $t5, 0xfaf6f8
sw $t5, 0($t3)
addi $t3, $t4, 8368
li $t5, 0xf7f0f2
sw $t5, 0($t3)
addi $t3, $t4, 8372
li $t5, 0xead6e8
sw $t5, 0($t3)
addi $t3, $t4, 8376
li $t5, 0xd5bbd7
sw $t5, 0($t3)
addi $t3, $t4, 8380
li $t5, 0xf7bcb3
sw $t5, 0($t3)
addi $t3, $t4, 8384
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8388
sw $t5, 0($t3)
addi $t3, $t4, 8392
sw $t5, 0($t3)
addi $t3, $t4, 8396
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8400
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8404
sw $t5, 0($t3)
addi $t3, $t4, 8408
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8412
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8416
sw $t5, 0($t3)
addi $t3, $t4, 8420
sw $t5, 0($t3)
addi $t3, $t4, 8424
sw $t5, 0($t3)
addi $t3, $t4, 8428
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8432
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8436
sw $t5, 0($t3)
addi $t3, $t4, 8440
sw $t5, 0($t3)
addi $t3, $t4, 8444
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 8448
li $t5, 0xfeb6ad
sw $t5, 0($t3)
addi $t3, $t4, 8452
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 8456
li $t5, 0xfebeb4
sw $t5, 0($t3)
addi $t3, $t4, 8460
li $t5, 0xfebbb2
sw $t5, 0($t3)
addi $t3, $t4, 8464
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8468
sw $t5, 0($t3)
addi $t3, $t4, 8472
sw $t5, 0($t3)
addi $t3, $t4, 8476
sw $t5, 0($t3)
addi $t3, $t4, 8480
sw $t5, 0($t3)
addi $t3, $t4, 8484
sw $t5, 0($t3)
addi $t3, $t4, 8488
sw $t5, 0($t3)
addi $t3, $t4, 8492
li $t5, 0xe8b3b0
sw $t5, 0($t3)
addi $t3, $t4, 8496
li $t5, 0xe9d9f5
sw $t5, 0($t3)
addi $t3, $t4, 8500
li $t5, 0xeee5e8
sw $t5, 0($t3)
addi $t3, $t4, 8504
li $t5, 0xeee8f2
sw $t5, 0($t3)
addi $t3, $t4, 8508
li $t5, 0xf8f8f7
sw $t5, 0($t3)
addi $t3, $t4, 8512
li $t5, 0xfefefc
sw $t5, 0($t3)
addi $t3, $t4, 8516
li $t5, 0xece7f0
sw $t5, 0($t3)
addi $t3, $t4, 8520
li $t5, 0xfbfafc
sw $t5, 0($t3)
addi $t3, $t4, 8524
li $t5, 0xeee3ef
sw $t5, 0($t3)
addi $t3, $t4, 8528
li $t5, 0xf6f5f6
sw $t5, 0($t3)
addi $t3, $t4, 8532
li $t5, 0xfbf9fb
sw $t5, 0($t3)
addi $t3, $t4, 8536
li $t5, 0xf6f1f7
sw $t5, 0($t3)
addi $t3, $t4, 8540
li $t5, 0xf0e9f1
sw $t5, 0($t3)
addi $t3, $t4, 8544
li $t5, 0xf7f4f3
sw $t5, 0($t3)
addi $t3, $t4, 8548
li $t5, 0xf0eaf1
sw $t5, 0($t3)
addi $t3, $t4, 8552
li $t5, 0xfcfcfa
sw $t5, 0($t3)
addi $t3, $t4, 8556
li $t5, 0xf7ebf2
sw $t5, 0($t3)
addi $t3, $t4, 8560
li $t5, 0xfcfcfd
sw $t5, 0($t3)
addi $t3, $t4, 8564
li $t5, 0xfbfefb
sw $t5, 0($t3)
addi $t3, $t4, 8568
li $t5, 0xf7f6f4
sw $t5, 0($t3)
addi $t3, $t4, 8572
li $t5, 0xe9e1e9
sw $t5, 0($t3)
addi $t3, $t4, 8576
li $t5, 0xf9f7f8
sw $t5, 0($t3)
addi $t3, $t4, 8580
li $t5, 0xfbfafd
sw $t5, 0($t3)
addi $t3, $t4, 8584
li $t5, 0xf7f1f8
sw $t5, 0($t3)
addi $t3, $t4, 8588
li $t5, 0xfaf6fc
sw $t5, 0($t3)
addi $t3, $t4, 8592
li $t5, 0xf6eef9
sw $t5, 0($t3)
addi $t3, $t4, 8596
li $t5, 0xf6ecf3
sw $t5, 0($t3)
addi $t3, $t4, 8600
li $t5, 0xfcfafa
sw $t5, 0($t3)
addi $t3, $t4, 8604
li $t5, 0xf9f5f6
sw $t5, 0($t3)
addi $t3, $t4, 8608
li $t5, 0xf6f0f3
sw $t5, 0($t3)
addi $t3, $t4, 8612
li $t5, 0xf1edee
sw $t5, 0($t3)
addi $t3, $t4, 8616
li $t5, 0xfefcfc
sw $t5, 0($t3)
addi $t3, $t4, 8620
li $t5, 0xf6eff1
sw $t5, 0($t3)
addi $t3, $t4, 8624
li $t5, 0xfdfafa
sw $t5, 0($t3)
addi $t3, $t4, 8628
li $t5, 0xe4d2dd
sw $t5, 0($t3)
addi $t3, $t4, 8632
li $t5, 0xe9c5e9
sw $t5, 0($t3)
addi $t3, $t4, 8636
li $t5, 0xe2afb4
sw $t5, 0($t3)
addi $t3, $t4, 8640
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 8644
sw $t5, 0($t3)
addi $t3, $t4, 8648
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8652
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8656
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8660
sw $t5, 0($t3)
addi $t3, $t4, 8664
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8668
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8672
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 8676
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8680
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8684
sw $t5, 0($t3)
addi $t3, $t4, 8688
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 8692
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8696
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8700
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 8704
li $t5, 0xfdbfb6
sw $t5, 0($t3)
addi $t3, $t4, 8708
li $t5, 0xfdc3ba
sw $t5, 0($t3)
addi $t3, $t4, 8712
li $t5, 0xfdb3a9
sw $t5, 0($t3)
addi $t3, $t4, 8716
li $t5, 0xffb4a9
sw $t5, 0($t3)
addi $t3, $t4, 8720
li $t5, 0xfebfb6
sw $t5, 0($t3)
addi $t3, $t4, 8724
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8728
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8732
sw $t5, 0($t3)
addi $t3, $t4, 8736
sw $t5, 0($t3)
addi $t3, $t4, 8740
sw $t5, 0($t3)
addi $t3, $t4, 8744
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8748
li $t5, 0xebbcbc
sw $t5, 0($t3)
addi $t3, $t4, 8752
li $t5, 0xefdcf4
sw $t5, 0($t3)
addi $t3, $t4, 8756
li $t5, 0xf3f0ef
sw $t5, 0($t3)
addi $t3, $t4, 8760
li $t5, 0xf4eef6
sw $t5, 0($t3)
addi $t3, $t4, 8764
li $t5, 0xfbfbfa
sw $t5, 0($t3)
addi $t3, $t4, 8768
li $t5, 0xfefffb
sw $t5, 0($t3)
addi $t3, $t4, 8772
li $t5, 0xeae4ee
sw $t5, 0($t3)
addi $t3, $t4, 8776
li $t5, 0xfcfcfb
sw $t5, 0($t3)
addi $t3, $t4, 8780
li $t5, 0xeee3ef
sw $t5, 0($t3)
addi $t3, $t4, 8784
li $t5, 0xcdc3cc
sw $t5, 0($t3)
addi $t3, $t4, 8788
li $t5, 0xfdfefb
sw $t5, 0($t3)
addi $t3, $t4, 8792
li $t5, 0xf6effa
sw $t5, 0($t3)
addi $t3, $t4, 8796
li $t5, 0xf4eff4
sw $t5, 0($t3)
addi $t3, $t4, 8800
li $t5, 0xf3ebea
sw $t5, 0($t3)
addi $t3, $t4, 8804
li $t5, 0xedebf2
sw $t5, 0($t3)
addi $t3, $t4, 8808
li $t5, 0xfefcfd
sw $t5, 0($t3)
addi $t3, $t4, 8812
li $t5, 0xf8f1f6
sw $t5, 0($t3)
addi $t3, $t4, 8816
li $t5, 0xf4e6f0
sw $t5, 0($t3)
addi $t3, $t4, 8820
li $t5, 0xfcfcfa
sw $t5, 0($t3)
addi $t3, $t4, 8824
li $t5, 0xf7f9f5
sw $t5, 0($t3)
addi $t3, $t4, 8828
li $t5, 0xf6e9f0
sw $t5, 0($t3)
addi $t3, $t4, 8832
li $t5, 0xf5def2
sw $t5, 0($t3)
addi $t3, $t4, 8836
li $t5, 0xfdf9f9
sw $t5, 0($t3)
addi $t3, $t4, 8840
li $t5, 0xf0f2f1
sw $t5, 0($t3)
addi $t3, $t4, 8844
li $t5, 0xfcfdfb
sw $t5, 0($t3)
addi $t3, $t4, 8848
li $t5, 0xfbf8fa
sw $t5, 0($t3)
addi $t3, $t4, 8852
li $t5, 0xf5e6f6
sw $t5, 0($t3)
addi $t3, $t4, 8856
li $t5, 0xfdfdfc
sw $t5, 0($t3)
addi $t3, $t4, 8860
li $t5, 0xfcfefc
sw $t5, 0($t3)
addi $t3, $t4, 8864
li $t5, 0xf6f3f4
sw $t5, 0($t3)
addi $t3, $t4, 8868
li $t5, 0xecdeea
sw $t5, 0($t3)
addi $t3, $t4, 8872
li $t5, 0xfbfaf6
sw $t5, 0($t3)
addi $t3, $t4, 8876
li $t5, 0xfbf5f5
sw $t5, 0($t3)
addi $t3, $t4, 8880
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 8884
li $t5, 0xeee4e6
sw $t5, 0($t3)
addi $t3, $t4, 8888
li $t5, 0xebc9e8
sw $t5, 0($t3)
addi $t3, $t4, 8892
li $t5, 0xdaafbe
sw $t5, 0($t3)
addi $t3, $t4, 8896
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8900
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8904
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8908
sw $t5, 0($t3)
addi $t3, $t4, 8912
sw $t5, 0($t3)
addi $t3, $t4, 8916
sw $t5, 0($t3)
addi $t3, $t4, 8920
li $t5, 0xfec1b7
sw $t5, 0($t3)
addi $t3, $t4, 8924
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8928
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8932
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8936
sw $t5, 0($t3)
addi $t3, $t4, 8940
sw $t5, 0($t3)
addi $t3, $t4, 8944
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 8948
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 8952
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8956
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 8960
li $t5, 0xfbcac3
sw $t5, 0($t3)
addi $t3, $t4, 8964
li $t5, 0xf9c5bd
sw $t5, 0($t3)
addi $t3, $t4, 8968
li $t5, 0xfcb7ae
sw $t5, 0($t3)
addi $t3, $t4, 8972
li $t5, 0xffb2a8
sw $t5, 0($t3)
addi $t3, $t4, 8976
li $t5, 0xfebdb3
sw $t5, 0($t3)
addi $t3, $t4, 8980
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 8984
sw $t5, 0($t3)
addi $t3, $t4, 8988
sw $t5, 0($t3)
addi $t3, $t4, 8992
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 8996
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9000
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9004
li $t5, 0xe1b5bc
sw $t5, 0($t3)
addi $t3, $t4, 9008
li $t5, 0xf0e1f3
sw $t5, 0($t3)
addi $t3, $t4, 9012
li $t5, 0xeee8eb
sw $t5, 0($t3)
addi $t3, $t4, 9016
li $t5, 0xf8f5fa
sw $t5, 0($t3)
addi $t3, $t4, 9020
li $t5, 0xf4f4f5
sw $t5, 0($t3)
addi $t3, $t4, 9024
li $t5, 0xfefffe
sw $t5, 0($t3)
addi $t3, $t4, 9028
li $t5, 0xf0ecf1
sw $t5, 0($t3)
addi $t3, $t4, 9032
li $t5, 0xf9fafa
sw $t5, 0($t3)
addi $t3, $t4, 9036
li $t5, 0xdac7dc
sw $t5, 0($t3)
addi $t3, $t4, 9040
li $t5, 0xe7dde1
sw $t5, 0($t3)
addi $t3, $t4, 9044
li $t5, 0xfdfefd
sw $t5, 0($t3)
addi $t3, $t4, 9048
li $t5, 0xfbf4fc
sw $t5, 0($t3)
addi $t3, $t4, 9052
li $t5, 0xf0e2ef
sw $t5, 0($t3)
addi $t3, $t4, 9056
li $t5, 0xe9dde1
sw $t5, 0($t3)
addi $t3, $t4, 9060
li $t5, 0xeee9ee
sw $t5, 0($t3)
addi $t3, $t4, 9064
li $t5, 0xf9eff3
sw $t5, 0($t3)
addi $t3, $t4, 9068
li $t5, 0xf9f6f8
sw $t5, 0($t3)
addi $t3, $t4, 9072
li $t5, 0xf4d7eb
sw $t5, 0($t3)
addi $t3, $t4, 9076
li $t5, 0xfbeff8
sw $t5, 0($t3)
addi $t3, $t4, 9080
li $t5, 0xfbf4f6
sw $t5, 0($t3)
addi $t3, $t4, 9084
li $t5, 0xede4e7
sw $t5, 0($t3)
addi $t3, $t4, 9088
li $t5, 0xefcce8
sw $t5, 0($t3)
addi $t3, $t4, 9092
li $t5, 0xf7e5ef
sw $t5, 0($t3)
addi $t3, $t4, 9096
li $t5, 0xf8f3f7
sw $t5, 0($t3)
addi $t3, $t4, 9100
li $t5, 0xe7dbe8
sw $t5, 0($t3)
addi $t3, $t4, 9104
li $t5, 0xfaf8fa
sw $t5, 0($t3)
addi $t3, $t4, 9108
li $t5, 0xf1e2f0
sw $t5, 0($t3)
addi $t3, $t4, 9112
li $t5, 0xfaf2f9
sw $t5, 0($t3)
addi $t3, $t4, 9116
li $t5, 0xfbf8f9
sw $t5, 0($t3)
addi $t3, $t4, 9120
li $t5, 0xfcfcfc
sw $t5, 0($t3)
addi $t3, $t4, 9124
li $t5, 0xf5e3f5
sw $t5, 0($t3)
addi $t3, $t4, 9128
li $t5, 0xe8e8e5
sw $t5, 0($t3)
addi $t3, $t4, 9132
li $t5, 0xfdf1f3
sw $t5, 0($t3)
addi $t3, $t4, 9136
li $t5, 0xfdfdfd
sw $t5, 0($t3)
addi $t3, $t4, 9140
li $t5, 0xfaf3f1
sw $t5, 0($t3)
addi $t3, $t4, 9144
li $t5, 0xeed3e9
sw $t5, 0($t3)
addi $t3, $t4, 9148
li $t5, 0xdcb4c8
sw $t5, 0($t3)
addi $t3, $t4, 9152
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9156
sw $t5, 0($t3)
addi $t3, $t4, 9160
sw $t5, 0($t3)
addi $t3, $t4, 9164
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9168
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9172
sw $t5, 0($t3)
addi $t3, $t4, 9176
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9180
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9184
sw $t5, 0($t3)
addi $t3, $t4, 9188
sw $t5, 0($t3)
addi $t3, $t4, 9192
sw $t5, 0($t3)
addi $t3, $t4, 9196
sw $t5, 0($t3)
addi $t3, $t4, 9200
sw $t5, 0($t3)
addi $t3, $t4, 9204
sw $t5, 0($t3)
addi $t3, $t4, 9208
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9212
li $t5, 0xffc1b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 9216
li $t5, 0xfad7d1
sw $t5, 0($t3)
addi $t3, $t4, 9220
li $t5, 0xfac9c0
sw $t5, 0($t3)
addi $t3, $t4, 9224
li $t5, 0xfcc3ba
sw $t5, 0($t3)
addi $t3, $t4, 9228
li $t5, 0xfec0b6
sw $t5, 0($t3)
addi $t3, $t4, 9232
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9236
sw $t5, 0($t3)
addi $t3, $t4, 9240
sw $t5, 0($t3)
addi $t3, $t4, 9244
sw $t5, 0($t3)
addi $t3, $t4, 9248
sw $t5, 0($t3)
addi $t3, $t4, 9252
sw $t5, 0($t3)
addi $t3, $t4, 9256
sw $t5, 0($t3)
addi $t3, $t4, 9260
li $t5, 0xe5bac0
sw $t5, 0($t3)
addi $t3, $t4, 9264
li $t5, 0xece1f2
sw $t5, 0($t3)
addi $t3, $t4, 9268
li $t5, 0xf8f1f3
sw $t5, 0($t3)
addi $t3, $t4, 9272
li $t5, 0xf3f1f5
sw $t5, 0($t3)
addi $t3, $t4, 9276
li $t5, 0xf7f6f8
sw $t5, 0($t3)
addi $t3, $t4, 9280
li $t5, 0xfeffff
sw $t5, 0($t3)
addi $t3, $t4, 9284
li $t5, 0xfafaf7
sw $t5, 0($t3)
addi $t3, $t4, 9288
li $t5, 0xf3edf7
sw $t5, 0($t3)
addi $t3, $t4, 9292
li $t5, 0xdeccd7
sw $t5, 0($t3)
addi $t3, $t4, 9296
li $t5, 0xf7f1f2
sw $t5, 0($t3)
addi $t3, $t4, 9300
li $t5, 0xfdfefd
sw $t5, 0($t3)
addi $t3, $t4, 9304
li $t5, 0xfaf4f8
sw $t5, 0($t3)
addi $t3, $t4, 9308
li $t5, 0xe8c7dc
sw $t5, 0($t3)
addi $t3, $t4, 9312
li $t5, 0xf4e9e8
sw $t5, 0($t3)
addi $t3, $t4, 9316
li $t5, 0xe5d9e0
sw $t5, 0($t3)
addi $t3, $t4, 9320
li $t5, 0xe8d6df
sw $t5, 0($t3)
addi $t3, $t4, 9324
li $t5, 0xfdf8fa
sw $t5, 0($t3)
addi $t3, $t4, 9328
li $t5, 0xefd9e9
sw $t5, 0($t3)
addi $t3, $t4, 9332
li $t5, 0xfae2ef
sw $t5, 0($t3)
addi $t3, $t4, 9336
li $t5, 0xfcecf4
sw $t5, 0($t3)
addi $t3, $t4, 9340
li $t5, 0xf2d8e5
sw $t5, 0($t3)
addi $t3, $t4, 9344
li $t5, 0xe4c4d8
sw $t5, 0($t3)
addi $t3, $t4, 9348
li $t5, 0xeac6e2
sw $t5, 0($t3)
addi $t3, $t4, 9352
li $t5, 0xf5e1ed
sw $t5, 0($t3)
addi $t3, $t4, 9356
li $t5, 0xf7e5f0
sw $t5, 0($t3)
addi $t3, $t4, 9360
li $t5, 0xe2c2db
sw $t5, 0($t3)
addi $t3, $t4, 9364
li $t5, 0xefe5ee
sw $t5, 0($t3)
addi $t3, $t4, 9368
li $t5, 0xefe6ef
sw $t5, 0($t3)
addi $t3, $t4, 9372
li $t5, 0xf2e6ef
sw $t5, 0($t3)
addi $t3, $t4, 9376
li $t5, 0xf9f4f8
sw $t5, 0($t3)
addi $t3, $t4, 9380
li $t5, 0xfcf9fb
sw $t5, 0($t3)
addi $t3, $t4, 9384
li $t5, 0xf0e8ea
sw $t5, 0($t3)
addi $t3, $t4, 9388
li $t5, 0xfbebf2
sw $t5, 0($t3)
addi $t3, $t4, 9392
li $t5, 0xfdfaf8
sw $t5, 0($t3)
addi $t3, $t4, 9396
li $t5, 0xfcf3f6
sw $t5, 0($t3)
addi $t3, $t4, 9400
li $t5, 0xf9e5f1
sw $t5, 0($t3)
addi $t3, $t4, 9404
li $t5, 0xdabcd9
sw $t5, 0($t3)
addi $t3, $t4, 9408
li $t5, 0xfdbfb7
sw $t5, 0($t3)
addi $t3, $t4, 9412
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9416
sw $t5, 0($t3)
addi $t3, $t4, 9420
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9424
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9428
sw $t5, 0($t3)
addi $t3, $t4, 9432
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 9436
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9440
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 9444
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9448
sw $t5, 0($t3)
addi $t3, $t4, 9452
sw $t5, 0($t3)
addi $t3, $t4, 9456
sw $t5, 0($t3)
addi $t3, $t4, 9460
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9464
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9468
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 9472
li $t5, 0xfaccc3
sw $t5, 0($t3)
addi $t3, $t4, 9476
li $t5, 0xfac3bb
sw $t5, 0($t3)
addi $t3, $t4, 9480
li $t5, 0xfcbeb5
sw $t5, 0($t3)
addi $t3, $t4, 9484
li $t5, 0xfeb8af
sw $t5, 0($t3)
addi $t3, $t4, 9488
li $t5, 0xfebfb5
sw $t5, 0($t3)
addi $t3, $t4, 9492
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 9496
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9500
sw $t5, 0($t3)
addi $t3, $t4, 9504
sw $t5, 0($t3)
addi $t3, $t4, 9508
sw $t5, 0($t3)
addi $t3, $t4, 9512
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9516
li $t5, 0xe7c3c4
sw $t5, 0($t3)
addi $t3, $t4, 9520
li $t5, 0xe7e2ee
sw $t5, 0($t3)
addi $t3, $t4, 9524
li $t5, 0xf9f5f6
sw $t5, 0($t3)
addi $t3, $t4, 9528
li $t5, 0xf0e6f1
sw $t5, 0($t3)
addi $t3, $t4, 9532
li $t5, 0xfdfbfe
sw $t5, 0($t3)
addi $t3, $t4, 9536
li $t5, 0xffffff
sw $t5, 0($t3)
addi $t3, $t4, 9540
li $t5, 0xfcf9fa
sw $t5, 0($t3)
addi $t3, $t4, 9544
li $t5, 0xe9deec
sw $t5, 0($t3)
addi $t3, $t4, 9548
li $t5, 0xdcd1d3
sw $t5, 0($t3)
addi $t3, $t4, 9552
li $t5, 0xebd8da
sw $t5, 0($t3)
addi $t3, $t4, 9556
li $t5, 0xe1ccd8
sw $t5, 0($t3)
addi $t3, $t4, 9560
li $t5, 0xdfcad6
sw $t5, 0($t3)
addi $t3, $t4, 9564
li $t5, 0xdbb5ca
sw $t5, 0($t3)
addi $t3, $t4, 9568
li $t5, 0xe3d8d7
sw $t5, 0($t3)
addi $t3, $t4, 9572
li $t5, 0xdec5d2
sw $t5, 0($t3)
addi $t3, $t4, 9576
li $t5, 0xebd9e5
sw $t5, 0($t3)
addi $t3, $t4, 9580
li $t5, 0xfce5ed
sw $t5, 0($t3)
addi $t3, $t4, 9584
li $t5, 0xf4e2ed
sw $t5, 0($t3)
addi $t3, $t4, 9588
li $t5, 0xe9d0db
sw $t5, 0($t3)
addi $t3, $t4, 9592
li $t5, 0xf9dfea
sw $t5, 0($t3)
addi $t3, $t4, 9596
li $t5, 0xfddfec
sw $t5, 0($t3)
addi $t3, $t4, 9600
li $t5, 0xf2d4e4
sw $t5, 0($t3)
addi $t3, $t4, 9604
li $t5, 0xe0b7cf
sw $t5, 0($t3)
addi $t3, $t4, 9608
li $t5, 0xe5bbd4
sw $t5, 0($t3)
addi $t3, $t4, 9612
li $t5, 0xebd0de
sw $t5, 0($t3)
addi $t3, $t4, 9616
li $t5, 0xdbc0d0
sw $t5, 0($t3)
addi $t3, $t4, 9620
li $t5, 0xc799b9
sw $t5, 0($t3)
addi $t3, $t4, 9624
li $t5, 0xd3b4ce
sw $t5, 0($t3)
addi $t3, $t4, 9628
li $t5, 0xf2e5f0
sw $t5, 0($t3)
addi $t3, $t4, 9632
li $t5, 0xdfd5dc
sw $t5, 0($t3)
addi $t3, $t4, 9636
li $t5, 0xfcfbf5
sw $t5, 0($t3)
addi $t3, $t4, 9640
li $t5, 0xf9f8f7
sw $t5, 0($t3)
addi $t3, $t4, 9644
li $t5, 0xf1e0e8
sw $t5, 0($t3)
addi $t3, $t4, 9648
li $t5, 0xfdeef6
sw $t5, 0($t3)
addi $t3, $t4, 9652
li $t5, 0xf9eff3
sw $t5, 0($t3)
addi $t3, $t4, 9656
li $t5, 0xf7e5ef
sw $t5, 0($t3)
addi $t3, $t4, 9660
li $t5, 0xe6cfe6
sw $t5, 0($t3)
addi $t3, $t4, 9664
li $t5, 0xeeb6b6
sw $t5, 0($t3)
addi $t3, $t4, 9668
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9672
sw $t5, 0($t3)
addi $t3, $t4, 9676
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 9680
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9684
sw $t5, 0($t3)
addi $t3, $t4, 9688
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9692
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9696
sw $t5, 0($t3)
addi $t3, $t4, 9700
sw $t5, 0($t3)
addi $t3, $t4, 9704
sw $t5, 0($t3)
addi $t3, $t4, 9708
sw $t5, 0($t3)
addi $t3, $t4, 9712
sw $t5, 0($t3)
addi $t3, $t4, 9716
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9720
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9724
li $t5, 0xfec2b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 9728
li $t5, 0xfcc7bf
sw $t5, 0($t3)
addi $t3, $t4, 9732
li $t5, 0xfcc1b9
sw $t5, 0($t3)
addi $t3, $t4, 9736
li $t5, 0xfdb2a9
sw $t5, 0($t3)
addi $t3, $t4, 9740
li $t5, 0xffb3a9
sw $t5, 0($t3)
addi $t3, $t4, 9744
li $t5, 0xfeb6ac
sw $t5, 0($t3)
addi $t3, $t4, 9748
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9752
sw $t5, 0($t3)
addi $t3, $t4, 9756
sw $t5, 0($t3)
addi $t3, $t4, 9760
sw $t5, 0($t3)
addi $t3, $t4, 9764
sw $t5, 0($t3)
addi $t3, $t4, 9768
sw $t5, 0($t3)
addi $t3, $t4, 9772
li $t5, 0xe9c7c7
sw $t5, 0($t3)
addi $t3, $t4, 9776
li $t5, 0xf1f5f7
sw $t5, 0($t3)
addi $t3, $t4, 9780
li $t5, 0xf9f8f6
sw $t5, 0($t3)
addi $t3, $t4, 9784
li $t5, 0xf0e5f1
sw $t5, 0($t3)
addi $t3, $t4, 9788
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 9792
li $t5, 0xfffefd
sw $t5, 0($t3)
addi $t3, $t4, 9796
li $t5, 0xf7f0f9
sw $t5, 0($t3)
addi $t3, $t4, 9800
li $t5, 0xdacad9
sw $t5, 0($t3)
addi $t3, $t4, 9804
li $t5, 0xf7f2f2
sw $t5, 0($t3)
addi $t3, $t4, 9808
li $t5, 0xfde8ef
sw $t5, 0($t3)
addi $t3, $t4, 9812
li $t5, 0xe6bdcd
sw $t5, 0($t3)
addi $t3, $t4, 9816
li $t5, 0xf8d6e6
sw $t5, 0($t3)
addi $t3, $t4, 9820
li $t5, 0xf2c5d6
sw $t5, 0($t3)
addi $t3, $t4, 9824
li $t5, 0xe5c2cf
sw $t5, 0($t3)
addi $t3, $t4, 9828
li $t5, 0xc7a8af
sw $t5, 0($t3)
addi $t3, $t4, 9832
li $t5, 0xbea1ac
sw $t5, 0($t3)
addi $t3, $t4, 9836
li $t5, 0xe6c9d4
sw $t5, 0($t3)
addi $t3, $t4, 9840
li $t5, 0xfde9f3
sw $t5, 0($t3)
addi $t3, $t4, 9844
li $t5, 0xf0d7e5
sw $t5, 0($t3)
addi $t3, $t4, 9848
li $t5, 0xe3c4d0
sw $t5, 0($t3)
addi $t3, $t4, 9852
li $t5, 0xedccd6
sw $t5, 0($t3)
addi $t3, $t4, 9856
li $t5, 0xddbcc9
sw $t5, 0($t3)
addi $t3, $t4, 9860
li $t5, 0xc59daf
sw $t5, 0($t3)
addi $t3, $t4, 9864
li $t5, 0xc99fb4
sw $t5, 0($t3)
addi $t3, $t4, 9868
li $t5, 0xdfb6c9
sw $t5, 0($t3)
addi $t3, $t4, 9872
li $t5, 0xf4cede
sw $t5, 0($t3)
addi $t3, $t4, 9876
li $t5, 0xf4cfe6
sw $t5, 0($t3)
addi $t3, $t4, 9880
li $t5, 0xd4a9c9
sw $t5, 0($t3)
addi $t3, $t4, 9884
li $t5, 0xf2c8ec
sw $t5, 0($t3)
addi $t3, $t4, 9888
li $t5, 0xeacfeb
sw $t5, 0($t3)
addi $t3, $t4, 9892
li $t5, 0xf9f0f8
sw $t5, 0($t3)
addi $t3, $t4, 9896
li $t5, 0xfdfbfa
sw $t5, 0($t3)
addi $t3, $t4, 9900
li $t5, 0xf9f6f6
sw $t5, 0($t3)
addi $t3, $t4, 9904
li $t5, 0xf9e9f0
sw $t5, 0($t3)
addi $t3, $t4, 9908
li $t5, 0xefe3ed
sw $t5, 0($t3)
addi $t3, $t4, 9912
li $t5, 0xecdbe4
sw $t5, 0($t3)
addi $t3, $t4, 9916
li $t5, 0xf0dbeb
sw $t5, 0($t3)
addi $t3, $t4, 9920
li $t5, 0xe3b7bf
sw $t5, 0($t3)
addi $t3, $t4, 9924
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9928
sw $t5, 0($t3)
addi $t3, $t4, 9932
sw $t5, 0($t3)
addi $t3, $t4, 9936
sw $t5, 0($t3)
addi $t3, $t4, 9940
sw $t5, 0($t3)
addi $t3, $t4, 9944
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 9948
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 9952
sw $t5, 0($t3)
addi $t3, $t4, 9956
sw $t5, 0($t3)
addi $t3, $t4, 9960
sw $t5, 0($t3)
addi $t3, $t4, 9964
sw $t5, 0($t3)
addi $t3, $t4, 9968
sw $t5, 0($t3)
addi $t3, $t4, 9972
sw $t5, 0($t3)
addi $t3, $t4, 9976
sw $t5, 0($t3)
addi $t3, $t4, 9980
li $t5, 0xfec1b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 9984
li $t5, 0xfdb4a9
sw $t5, 0($t3)
addi $t3, $t4, 9988
li $t5, 0xfdbeb4
sw $t5, 0($t3)
addi $t3, $t4, 9992
li $t5, 0xfeb9ae
sw $t5, 0($t3)
addi $t3, $t4, 9996
li $t5, 0xfeb3aa
sw $t5, 0($t3)
addi $t3, $t4, 10000
li $t5, 0xfec1b7
sw $t5, 0($t3)
addi $t3, $t4, 10004
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10008
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10012
sw $t5, 0($t3)
addi $t3, $t4, 10016
sw $t5, 0($t3)
addi $t3, $t4, 10020
sw $t5, 0($t3)
addi $t3, $t4, 10024
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10028
li $t5, 0xe0c2c1
sw $t5, 0($t3)
addi $t3, $t4, 10032
li $t5, 0xf0f2f5
sw $t5, 0($t3)
addi $t3, $t4, 10036
li $t5, 0xf9f6fa
sw $t5, 0($t3)
addi $t3, $t4, 10040
li $t5, 0xf7edf8
sw $t5, 0($t3)
addi $t3, $t4, 10044
li $t5, 0xfffffd
sw $t5, 0($t3)
addi $t3, $t4, 10048
li $t5, 0xfefdfc
sw $t5, 0($t3)
addi $t3, $t4, 10052
li $t5, 0xf6ecf8
sw $t5, 0($t3)
addi $t3, $t4, 10056
li $t5, 0xd2c3d5
sw $t5, 0($t3)
addi $t3, $t4, 10060
li $t5, 0xe8dddd
sw $t5, 0($t3)
addi $t3, $t4, 10064
li $t5, 0xe5d5d9
sw $t5, 0($t3)
addi $t3, $t4, 10068
li $t5, 0xc99cac
sw $t5, 0($t3)
addi $t3, $t4, 10072
li $t5, 0xc294a5
sw $t5, 0($t3)
addi $t3, $t4, 10076
li $t5, 0xd8a6b5
sw $t5, 0($t3)
addi $t3, $t4, 10080
li $t5, 0xcd9eab
sw $t5, 0($t3)
addi $t3, $t4, 10084
li $t5, 0xf7e2e1
sw $t5, 0($t3)
addi $t3, $t4, 10088
li $t5, 0xf2d1d9
sw $t5, 0($t3)
addi $t3, $t4, 10092
li $t5, 0xefc7d9
sw $t5, 0($t3)
addi $t3, $t4, 10096
li $t5, 0xfbe4f0
sw $t5, 0($t3)
addi $t3, $t4, 10100
li $t5, 0xf0e0e8
sw $t5, 0($t3)
addi $t3, $t4, 10104
li $t5, 0xf1dbe1
sw $t5, 0($t3)
addi $t3, $t4, 10108
li $t5, 0xf9d8dc
sw $t5, 0($t3)
addi $t3, $t4, 10112
li $t5, 0xf5c8d1
sw $t5, 0($t3)
addi $t3, $t4, 10116
li $t5, 0xf8cad8
sw $t5, 0($t3)
addi $t3, $t4, 10120
li $t5, 0xf8cbdc
sw $t5, 0($t3)
addi $t3, $t4, 10124
li $t5, 0xe9b8c7
sw $t5, 0($t3)
addi $t3, $t4, 10128
li $t5, 0xecc0cc
sw $t5, 0($t3)
addi $t3, $t4, 10132
li $t5, 0xf2c9d5
sw $t5, 0($t3)
addi $t3, $t4, 10136
li $t5, 0xefd3df
sw $t5, 0($t3)
addi $t3, $t4, 10140
li $t5, 0xdebbd4
sw $t5, 0($t3)
addi $t3, $t4, 10144
li $t5, 0xe1bcda
sw $t5, 0($t3)
addi $t3, $t4, 10148
li $t5, 0xf2dff4
sw $t5, 0($t3)
addi $t3, $t4, 10152
li $t5, 0xf8f3f7
sw $t5, 0($t3)
addi $t3, $t4, 10156
li $t5, 0xf7f5f3
sw $t5, 0($t3)
addi $t3, $t4, 10160
li $t5, 0xfef9f9
sw $t5, 0($t3)
addi $t3, $t4, 10164
li $t5, 0xf1e8ef
sw $t5, 0($t3)
addi $t3, $t4, 10168
li $t5, 0xe9d6e2
sw $t5, 0($t3)
addi $t3, $t4, 10172
li $t5, 0xeed7e5
sw $t5, 0($t3)
addi $t3, $t4, 10176
li $t5, 0xdeb8c8
sw $t5, 0($t3)
addi $t3, $t4, 10180
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10184
sw $t5, 0($t3)
addi $t3, $t4, 10188
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 10192
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10196
sw $t5, 0($t3)
addi $t3, $t4, 10200
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10204
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10208
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10212
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10216
sw $t5, 0($t3)
addi $t3, $t4, 10220
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 10224
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10228
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10232
sw $t5, 0($t3)
addi $t3, $t4, 10236
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 10240
li $t5, 0xffb3a8
sw $t5, 0($t3)
addi $t3, $t4, 10244
li $t5, 0xfebbb2
sw $t5, 0($t3)
addi $t3, $t4, 10248
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10252
sw $t5, 0($t3)
addi $t3, $t4, 10256
sw $t5, 0($t3)
addi $t3, $t4, 10260
sw $t5, 0($t3)
addi $t3, $t4, 10264
sw $t5, 0($t3)
addi $t3, $t4, 10268
sw $t5, 0($t3)
addi $t3, $t4, 10272
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10276
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10280
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10284
li $t5, 0xe8d6d6
sw $t5, 0($t3)
addi $t3, $t4, 10288
li $t5, 0xf5f3f5
sw $t5, 0($t3)
addi $t3, $t4, 10292
li $t5, 0xf8eff9
sw $t5, 0($t3)
addi $t3, $t4, 10296
li $t5, 0xf9f6fa
sw $t5, 0($t3)
addi $t3, $t4, 10300
li $t5, 0xfffefd
sw $t5, 0($t3)
addi $t3, $t4, 10304
li $t5, 0xf8f0f9
sw $t5, 0($t3)
addi $t3, $t4, 10308
li $t5, 0xefe4f0
sw $t5, 0($t3)
addi $t3, $t4, 10312
li $t5, 0xd2c8d5
sw $t5, 0($t3)
addi $t3, $t4, 10316
li $t5, 0xc2b1b5
sw $t5, 0($t3)
addi $t3, $t4, 10320
li $t5, 0x4d353e
sw $t5, 0($t3)
addi $t3, $t4, 10324
li $t5, 0x552643
sw $t5, 0($t3)
addi $t3, $t4, 10328
li $t5, 0x511940
sw $t5, 0($t3)
addi $t3, $t4, 10332
li $t5, 0x64354d
sw $t5, 0($t3)
addi $t3, $t4, 10336
li $t5, 0xad8b98
sw $t5, 0($t3)
addi $t3, $t4, 10340
li $t5, 0xc9b8b9
sw $t5, 0($t3)
addi $t3, $t4, 10344
li $t5, 0xebd9d8
sw $t5, 0($t3)
addi $t3, $t4, 10348
li $t5, 0xf6d2dd
sw $t5, 0($t3)
addi $t3, $t4, 10352
li $t5, 0xecd0dd
sw $t5, 0($t3)
addi $t3, $t4, 10356
li $t5, 0xfbebf6
sw $t5, 0($t3)
addi $t3, $t4, 10360
li $t5, 0xeedfe5
sw $t5, 0($t3)
addi $t3, $t4, 10364
li $t5, 0xf8f0ed
sw $t5, 0($t3)
addi $t3, $t4, 10368
li $t5, 0xfcf5f3
sw $t5, 0($t3)
addi $t3, $t4, 10372
li $t5, 0xf0d9de
sw $t5, 0($t3)
addi $t3, $t4, 10376
li $t5, 0xbe9ca4
sw $t5, 0($t3)
addi $t3, $t4, 10380
li $t5, 0xaa8189
sw $t5, 0($t3)
addi $t3, $t4, 10384
li $t5, 0x9d7179
sw $t5, 0($t3)
addi $t3, $t4, 10388
li $t5, 0x9e6f79
sw $t5, 0($t3)
addi $t3, $t4, 10392
li $t5, 0x8c6271
sw $t5, 0($t3)
addi $t3, $t4, 10396
li $t5, 0xa58b96
sw $t5, 0($t3)
addi $t3, $t4, 10400
li $t5, 0xc1a0b3
sw $t5, 0($t3)
addi $t3, $t4, 10404
li $t5, 0xe7dce2
sw $t5, 0($t3)
addi $t3, $t4, 10408
li $t5, 0xf5edf4
sw $t5, 0($t3)
addi $t3, $t4, 10412
li $t5, 0xebdae5
sw $t5, 0($t3)
addi $t3, $t4, 10416
li $t5, 0xfbecf2
sw $t5, 0($t3)
addi $t3, $t4, 10420
li $t5, 0xf9eef5
sw $t5, 0($t3)
addi $t3, $t4, 10424
li $t5, 0xe9d5e1
sw $t5, 0($t3)
addi $t3, $t4, 10428
li $t5, 0xdcc1d8
sw $t5, 0($t3)
addi $t3, $t4, 10432
li $t5, 0xd9b7c9
sw $t5, 0($t3)
addi $t3, $t4, 10436
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10440
sw $t5, 0($t3)
addi $t3, $t4, 10444
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 10448
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10452
sw $t5, 0($t3)
addi $t3, $t4, 10456
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10460
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 10464
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10468
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10472
sw $t5, 0($t3)
addi $t3, $t4, 10476
sw $t5, 0($t3)
addi $t3, $t4, 10480
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 10484
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 10488
sw $t5, 0($t3)
addi $t3, $t4, 10492
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 10496
li $t5, 0xfebbb1
sw $t5, 0($t3)
addi $t3, $t4, 10500
li $t5, 0xfec0b7
sw $t5, 0($t3)
addi $t3, $t4, 10504
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10508
sw $t5, 0($t3)
addi $t3, $t4, 10512
sw $t5, 0($t3)
addi $t3, $t4, 10516
sw $t5, 0($t3)
addi $t3, $t4, 10520
sw $t5, 0($t3)
addi $t3, $t4, 10524
sw $t5, 0($t3)
addi $t3, $t4, 10528
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10532
sw $t5, 0($t3)
addi $t3, $t4, 10536
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10540
li $t5, 0xf3e0e1
sw $t5, 0($t3)
addi $t3, $t4, 10544
li $t5, 0xe9e1ea
sw $t5, 0($t3)
addi $t3, $t4, 10548
li $t5, 0xf4e6f2
sw $t5, 0($t3)
addi $t3, $t4, 10552
li $t5, 0xfdfbfc
sw $t5, 0($t3)
addi $t3, $t4, 10556
li $t5, 0xfbf9f8
sw $t5, 0($t3)
addi $t3, $t4, 10560
li $t5, 0xf2e7f3
sw $t5, 0($t3)
addi $t3, $t4, 10564
li $t5, 0xe2e0e4
sw $t5, 0($t3)
addi $t3, $t4, 10568
li $t5, 0x908592
sw $t5, 0($t3)
addi $t3, $t4, 10572
li $t5, 0xc7c1c1
sw $t5, 0($t3)
addi $t3, $t4, 10576
li $t5, 0xaf9dab
sw $t5, 0($t3)
addi $t3, $t4, 10580
li $t5, 0xbc5da4
sw $t5, 0($t3)
addi $t3, $t4, 10584
li $t5, 0xb64c98
sw $t5, 0($t3)
addi $t3, $t4, 10588
li $t5, 0xb267a1
sw $t5, 0($t3)
addi $t3, $t4, 10592
li $t5, 0xdcced8
sw $t5, 0($t3)
addi $t3, $t4, 10596
li $t5, 0x9f8d92
sw $t5, 0($t3)
addi $t3, $t4, 10600
li $t5, 0xd9cdca
sw $t5, 0($t3)
addi $t3, $t4, 10604
li $t5, 0xf9e5e4
sw $t5, 0($t3)
addi $t3, $t4, 10608
li $t5, 0xf3d6df
sw $t5, 0($t3)
addi $t3, $t4, 10612
li $t5, 0xf0d5e3
sw $t5, 0($t3)
addi $t3, $t4, 10616
li $t5, 0xf0dfe6
sw $t5, 0($t3)
addi $t3, $t4, 10620
li $t5, 0xf9eee8
sw $t5, 0($t3)
addi $t3, $t4, 10624
li $t5, 0xf8e9e8
sw $t5, 0($t3)
addi $t3, $t4, 10628
li $t5, 0xb49fa6
sw $t5, 0($t3)
addi $t3, $t4, 10632
li $t5, 0x684b57
sw $t5, 0($t3)
addi $t3, $t4, 10636
li $t5, 0x8f4c75
sw $t5, 0($t3)
addi $t3, $t4, 10640
li $t5, 0xa44989
sw $t5, 0($t3)
addi $t3, $t4, 10644
li $t5, 0xb152a0
sw $t5, 0($t3)
addi $t3, $t4, 10648
li $t5, 0xcea5c6
sw $t5, 0($t3)
addi $t3, $t4, 10652
li $t5, 0xd7d2d3
sw $t5, 0($t3)
addi $t3, $t4, 10656
li $t5, 0xb4a6ac
sw $t5, 0($t3)
addi $t3, $t4, 10660
li $t5, 0xe6dfdf
sw $t5, 0($t3)
addi $t3, $t4, 10664
li $t5, 0xf2ecf4
sw $t5, 0($t3)
addi $t3, $t4, 10668
li $t5, 0xe3d2e5
sw $t5, 0($t3)
addi $t3, $t4, 10672
li $t5, 0xfaeef3
sw $t5, 0($t3)
addi $t3, $t4, 10676
li $t5, 0xf7e9f1
sw $t5, 0($t3)
addi $t3, $t4, 10680
li $t5, 0xebdae3
sw $t5, 0($t3)
addi $t3, $t4, 10684
li $t5, 0xd4b2d2
sw $t5, 0($t3)
addi $t3, $t4, 10688
li $t5, 0xd5bbce
sw $t5, 0($t3)
addi $t3, $t4, 10692
li $t5, 0xfabeb6
sw $t5, 0($t3)
addi $t3, $t4, 10696
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10700
sw $t5, 0($t3)
addi $t3, $t4, 10704
sw $t5, 0($t3)
addi $t3, $t4, 10708
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 10712
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10716
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10720
sw $t5, 0($t3)
addi $t3, $t4, 10724
sw $t5, 0($t3)
addi $t3, $t4, 10728
sw $t5, 0($t3)
addi $t3, $t4, 10732
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10736
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 10740
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10744
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10748
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 10752
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 10756
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10760
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10764
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 10768
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10772
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 10776
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10780
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10784
sw $t5, 0($t3)
addi $t3, $t4, 10788
sw $t5, 0($t3)
addi $t3, $t4, 10792
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10796
li $t5, 0xdacad3
sw $t5, 0($t3)
addi $t3, $t4, 10800
li $t5, 0xe4c3d3
sw $t5, 0($t3)
addi $t3, $t4, 10804
li $t5, 0xeadfe8
sw $t5, 0($t3)
addi $t3, $t4, 10808
li $t5, 0xfbfdfc
sw $t5, 0($t3)
addi $t3, $t4, 10812
li $t5, 0xf8f2f8
sw $t5, 0($t3)
addi $t3, $t4, 10816
li $t5, 0xf8eef8
sw $t5, 0($t3)
addi $t3, $t4, 10820
li $t5, 0xcccad4
sw $t5, 0($t3)
addi $t3, $t4, 10824
li $t5, 0xb1a0b2
sw $t5, 0($t3)
addi $t3, $t4, 10828
li $t5, 0xe7dcdc
sw $t5, 0($t3)
addi $t3, $t4, 10832
li $t5, 0xc6b7be
sw $t5, 0($t3)
addi $t3, $t4, 10836
li $t5, 0xdd94ce
sw $t5, 0($t3)
addi $t3, $t4, 10840
li $t5, 0xd96abf
sw $t5, 0($t3)
addi $t3, $t4, 10844
li $t5, 0xcf4ebb
sw $t5, 0($t3)
addi $t3, $t4, 10848
li $t5, 0xe3addb
sw $t5, 0($t3)
addi $t3, $t4, 10852
li $t5, 0xb2a2aa
sw $t5, 0($t3)
addi $t3, $t4, 10856
li $t5, 0xd0c6c2
sw $t5, 0($t3)
addi $t3, $t4, 10860
li $t5, 0xf6ede5
sw $t5, 0($t3)
addi $t3, $t4, 10864
li $t5, 0xf7e1e0
sw $t5, 0($t3)
addi $t3, $t4, 10868
li $t5, 0xf7e2e6
sw $t5, 0($t3)
addi $t3, $t4, 10872
li $t5, 0xeec4d5
sw $t5, 0($t3)
addi $t3, $t4, 10876
li $t5, 0xfaf7f2
sw $t5, 0($t3)
addi $t3, $t4, 10880
li $t5, 0xede1de
sw $t5, 0($t3)
addi $t3, $t4, 10884
li $t5, 0xb09c9e
sw $t5, 0($t3)
addi $t3, $t4, 10888
li $t5, 0x937b85
sw $t5, 0($t3)
addi $t3, $t4, 10892
li $t5, 0xc06ca5
sw $t5, 0($t3)
addi $t3, $t4, 10896
li $t5, 0xc950b0
sw $t5, 0($t3)
addi $t3, $t4, 10900
li $t5, 0xd85cc4
sw $t5, 0($t3)
addi $t3, $t4, 10904
li $t5, 0xe3bedf
sw $t5, 0($t3)
addi $t3, $t4, 10908
li $t5, 0xececec
sw $t5, 0($t3)
addi $t3, $t4, 10912
li $t5, 0xb5a4a9
sw $t5, 0($t3)
addi $t3, $t4, 10916
li $t5, 0xede4e7
sw $t5, 0($t3)
addi $t3, $t4, 10920
li $t5, 0xf6f0f8
sw $t5, 0($t3)
addi $t3, $t4, 10924
li $t5, 0xf2e1f4
sw $t5, 0($t3)
addi $t3, $t4, 10928
li $t5, 0xfdf3f7
sw $t5, 0($t3)
addi $t3, $t4, 10932
li $t5, 0xf8e7f2
sw $t5, 0($t3)
addi $t3, $t4, 10936
li $t5, 0xeadce5
sw $t5, 0($t3)
addi $t3, $t4, 10940
li $t5, 0xd7b6d5
sw $t5, 0($t3)
addi $t3, $t4, 10944
li $t5, 0xe4c9dc
sw $t5, 0($t3)
addi $t3, $t4, 10948
li $t5, 0xd8a7a1
sw $t5, 0($t3)
addi $t3, $t4, 10952
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10956
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 10960
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10964
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10968
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10972
sw $t5, 0($t3)
addi $t3, $t4, 10976
sw $t5, 0($t3)
addi $t3, $t4, 10980
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 10984
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 10988
sw $t5, 0($t3)
addi $t3, $t4, 10992
sw $t5, 0($t3)
addi $t3, $t4, 10996
sw $t5, 0($t3)
addi $t3, $t4, 11000
sw $t5, 0($t3)
addi $t3, $t4, 11004
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 11008
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 11012
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 11016
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11020
sw $t5, 0($t3)
addi $t3, $t4, 11024
sw $t5, 0($t3)
addi $t3, $t4, 11028
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 11032
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11036
sw $t5, 0($t3)
addi $t3, $t4, 11040
sw $t5, 0($t3)
addi $t3, $t4, 11044
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 11048
li $t5, 0xfdbfb7
sw $t5, 0($t3)
addi $t3, $t4, 11052
li $t5, 0xcbb7c9
sw $t5, 0($t3)
addi $t3, $t4, 11056
li $t5, 0xe8cbd9
sw $t5, 0($t3)
addi $t3, $t4, 11060
li $t5, 0xf0e8f1
sw $t5, 0($t3)
addi $t3, $t4, 11064
li $t5, 0xfcfbfc
sw $t5, 0($t3)
addi $t3, $t4, 11068
li $t5, 0xfbedfa
sw $t5, 0($t3)
addi $t3, $t4, 11072
li $t5, 0xf4f1f6
sw $t5, 0($t3)
addi $t3, $t4, 11076
li $t5, 0xdfdfe9
sw $t5, 0($t3)
addi $t3, $t4, 11080
li $t5, 0xe0cbde
sw $t5, 0($t3)
addi $t3, $t4, 11084
li $t5, 0xe3c3cc
sw $t5, 0($t3)
addi $t3, $t4, 11088
li $t5, 0xf5eef0
sw $t5, 0($t3)
addi $t3, $t4, 11092
li $t5, 0xe1bae1
sw $t5, 0($t3)
addi $t3, $t4, 11096
li $t5, 0xf5bef2
sw $t5, 0($t3)
addi $t3, $t4, 11100
li $t5, 0xee96ea
sw $t5, 0($t3)
addi $t3, $t4, 11104
li $t5, 0xe789df
sw $t5, 0($t3)
addi $t3, $t4, 11108
li $t5, 0xdad2d7
sw $t5, 0($t3)
addi $t3, $t4, 11112
li $t5, 0xfbf7f2
sw $t5, 0($t3)
addi $t3, $t4, 11116
li $t5, 0xfdf6ec
sw $t5, 0($t3)
addi $t3, $t4, 11120
li $t5, 0xfcf1e8
sw $t5, 0($t3)
addi $t3, $t4, 11124
li $t5, 0xf8e3de
sw $t5, 0($t3)
addi $t3, $t4, 11128
li $t5, 0xedcdd6
sw $t5, 0($t3)
addi $t3, $t4, 11132
li $t5, 0xf3e4e2
sw $t5, 0($t3)
addi $t3, $t4, 11136
li $t5, 0xfaf7ed
sw $t5, 0($t3)
addi $t3, $t4, 11140
li $t5, 0xe1dad6
sw $t5, 0($t3)
addi $t3, $t4, 11144
li $t5, 0xdfd8db
sw $t5, 0($t3)
addi $t3, $t4, 11148
li $t5, 0xe8c4e5
sw $t5, 0($t3)
addi $t3, $t4, 11152
li $t5, 0xf0a7ed
sw $t5, 0($t3)
addi $t3, $t4, 11156
li $t5, 0xef83e6
sw $t5, 0($t3)
addi $t3, $t4, 11160
li $t5, 0xdab3d6
sw $t5, 0($t3)
addi $t3, $t4, 11164
li $t5, 0xe9e6e6
sw $t5, 0($t3)
addi $t3, $t4, 11168
li $t5, 0xe0d0d3
sw $t5, 0($t3)
addi $t3, $t4, 11172
li $t5, 0xf8f4f5
sw $t5, 0($t3)
addi $t3, $t4, 11176
li $t5, 0xefe8ee
sw $t5, 0($t3)
addi $t3, $t4, 11180
li $t5, 0xf6e7f8
sw $t5, 0($t3)
addi $t3, $t4, 11184
li $t5, 0xfaf2f5
sw $t5, 0($t3)
addi $t3, $t4, 11188
li $t5, 0xf9e7f4
sw $t5, 0($t3)
addi $t3, $t4, 11192
li $t5, 0xeedfe8
sw $t5, 0($t3)
addi $t3, $t4, 11196
li $t5, 0xd9bfd8
sw $t5, 0($t3)
addi $t3, $t4, 11200
li $t5, 0xe5c4e2
sw $t5, 0($t3)
addi $t3, $t4, 11204
li $t5, 0xd1b2b4
sw $t5, 0($t3)
addi $t3, $t4, 11208
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11212
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 11216
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11220
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 11224
li $t5, 0xfec1b7
sw $t5, 0($t3)
addi $t3, $t4, 11228
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 11232
sw $t5, 0($t3)
addi $t3, $t4, 11236
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11240
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 11244
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11248
sw $t5, 0($t3)
addi $t3, $t4, 11252
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 11256
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11260
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 11264
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 11268
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11272
sw $t5, 0($t3)
addi $t3, $t4, 11276
sw $t5, 0($t3)
addi $t3, $t4, 11280
sw $t5, 0($t3)
addi $t3, $t4, 11284
sw $t5, 0($t3)
addi $t3, $t4, 11288
sw $t5, 0($t3)
addi $t3, $t4, 11292
sw $t5, 0($t3)
addi $t3, $t4, 11296
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 11300
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11304
li $t5, 0xebb9b8
sw $t5, 0($t3)
addi $t3, $t4, 11308
li $t5, 0xb5abc7
sw $t5, 0($t3)
addi $t3, $t4, 11312
li $t5, 0xd1c2d8
sw $t5, 0($t3)
addi $t3, $t4, 11316
li $t5, 0xf6f4f7
sw $t5, 0($t3)
addi $t3, $t4, 11320
li $t5, 0xfcf7fb
sw $t5, 0($t3)
addi $t3, $t4, 11324
li $t5, 0xfdf6fa
sw $t5, 0($t3)
addi $t3, $t4, 11328
li $t5, 0xe4e8e5
sw $t5, 0($t3)
addi $t3, $t4, 11332
li $t5, 0xf5f3f7
sw $t5, 0($t3)
addi $t3, $t4, 11336
li $t5, 0xe2cfde
sw $t5, 0($t3)
addi $t3, $t4, 11340
li $t5, 0xf8c5ce
sw $t5, 0($t3)
addi $t3, $t4, 11344
li $t5, 0xeed7da
sw $t5, 0($t3)
addi $t3, $t4, 11348
li $t5, 0xf2ecef
sw $t5, 0($t3)
addi $t3, $t4, 11352
li $t5, 0xecd1ed
sw $t5, 0($t3)
addi $t3, $t4, 11356
li $t5, 0xf0c8f3
sw $t5, 0($t3)
addi $t3, $t4, 11360
li $t5, 0xeccbea
sw $t5, 0($t3)
addi $t3, $t4, 11364
li $t5, 0xfcf4f4
sw $t5, 0($t3)
addi $t3, $t4, 11368
li $t5, 0xfdf3eb
sw $t5, 0($t3)
addi $t3, $t4, 11372
li $t5, 0xfdf5ea
sw $t5, 0($t3)
addi $t3, $t4, 11376
li $t5, 0xfcf6ec
sw $t5, 0($t3)
addi $t3, $t4, 11380
li $t5, 0xf8e9e1
sw $t5, 0($t3)
addi $t3, $t4, 11384
li $t5, 0xf6e7e3
sw $t5, 0($t3)
addi $t3, $t4, 11388
li $t5, 0xe8d6d3
sw $t5, 0($t3)
addi $t3, $t4, 11392
li $t5, 0xfef8ec
sw $t5, 0($t3)
addi $t3, $t4, 11396
li $t5, 0xfcf8ef
sw $t5, 0($t3)
addi $t3, $t4, 11400
li $t5, 0xfcfbf7
sw $t5, 0($t3)
addi $t3, $t4, 11404
li $t5, 0xf0eaf1
sw $t5, 0($t3)
addi $t3, $t4, 11408
li $t5, 0xf4e4f4
sw $t5, 0($t3)
addi $t3, $t4, 11412
li $t5, 0xf7e1f6
sw $t5, 0($t3)
addi $t3, $t4, 11416
li $t5, 0xf8f4f9
sw $t5, 0($t3)
addi $t3, $t4, 11420
li $t5, 0xf4dfe4
sw $t5, 0($t3)
addi $t3, $t4, 11424
li $t5, 0xe5cfd5
sw $t5, 0($t3)
addi $t3, $t4, 11428
li $t5, 0xfaf7f6
sw $t5, 0($t3)
addi $t3, $t4, 11432
li $t5, 0xeae4e9
sw $t5, 0($t3)
addi $t3, $t4, 11436
li $t5, 0xfaecfa
sw $t5, 0($t3)
addi $t3, $t4, 11440
li $t5, 0xf9eff5
sw $t5, 0($t3)
addi $t3, $t4, 11444
li $t5, 0xfaecf7
sw $t5, 0($t3)
addi $t3, $t4, 11448
li $t5, 0xede1ea
sw $t5, 0($t3)
addi $t3, $t4, 11452
li $t5, 0xc9b7c7
sw $t5, 0($t3)
addi $t3, $t4, 11456
li $t5, 0xdfbfdf
sw $t5, 0($t3)
addi $t3, $t4, 11460
li $t5, 0xe3cadb
sw $t5, 0($t3)
addi $t3, $t4, 11464
li $t5, 0xefb7af
sw $t5, 0($t3)
addi $t3, $t4, 11468
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11472
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 11476
sw $t5, 0($t3)
addi $t3, $t4, 11480
sw $t5, 0($t3)
addi $t3, $t4, 11484
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11488
sw $t5, 0($t3)
addi $t3, $t4, 11492
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 11496
sw $t5, 0($t3)
addi $t3, $t4, 11500
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11504
sw $t5, 0($t3)
addi $t3, $t4, 11508
sw $t5, 0($t3)
addi $t3, $t4, 11512
sw $t5, 0($t3)
addi $t3, $t4, 11516
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 11520
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 11524
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11528
sw $t5, 0($t3)
addi $t3, $t4, 11532
sw $t5, 0($t3)
addi $t3, $t4, 11536
sw $t5, 0($t3)
addi $t3, $t4, 11540
sw $t5, 0($t3)
addi $t3, $t4, 11544
sw $t5, 0($t3)
addi $t3, $t4, 11548
sw $t5, 0($t3)
addi $t3, $t4, 11552
sw $t5, 0($t3)
addi $t3, $t4, 11556
sw $t5, 0($t3)
addi $t3, $t4, 11560
li $t5, 0xcaa4b1
sw $t5, 0($t3)
addi $t3, $t4, 11564
li $t5, 0xb69397
sw $t5, 0($t3)
addi $t3, $t4, 11568
li $t5, 0xc2d0e2
sw $t5, 0($t3)
addi $t3, $t4, 11572
li $t5, 0xf0f1f2
sw $t5, 0($t3)
addi $t3, $t4, 11576
li $t5, 0xfcfafb
sw $t5, 0($t3)
addi $t3, $t4, 11580
li $t5, 0xfaf9f7
sw $t5, 0($t3)
addi $t3, $t4, 11584
li $t5, 0xe9ebe7
sw $t5, 0($t3)
addi $t3, $t4, 11588
li $t5, 0xfdfafc
sw $t5, 0($t3)
addi $t3, $t4, 11592
li $t5, 0xcfb4cd
sw $t5, 0($t3)
addi $t3, $t4, 11596
li $t5, 0xe3bcc6
sw $t5, 0($t3)
addi $t3, $t4, 11600
li $t5, 0xf6c7d3
sw $t5, 0($t3)
addi $t3, $t4, 11604
li $t5, 0xe5bac5
sw $t5, 0($t3)
addi $t3, $t4, 11608
li $t5, 0xe5cccf
sw $t5, 0($t3)
addi $t3, $t4, 11612
li $t5, 0xeedddd
sw $t5, 0($t3)
addi $t3, $t4, 11616
li $t5, 0xf7e9e5
sw $t5, 0($t3)
addi $t3, $t4, 11620
li $t5, 0xfaede4
sw $t5, 0($t3)
addi $t3, $t4, 11624
li $t5, 0xfcf1e7
sw $t5, 0($t3)
addi $t3, $t4, 11628
li $t5, 0xfcf3e8
sw $t5, 0($t3)
addi $t3, $t4, 11632
li $t5, 0xfbf6eb
sw $t5, 0($t3)
addi $t3, $t4, 11636
li $t5, 0xfbebe4
sw $t5, 0($t3)
addi $t3, $t4, 11640
li $t5, 0xf9e9e2
sw $t5, 0($t3)
addi $t3, $t4, 11644
li $t5, 0xefe6df
sw $t5, 0($t3)
addi $t3, $t4, 11648
li $t5, 0xfcf7ec
sw $t5, 0($t3)
addi $t3, $t4, 11652
li $t5, 0xfef2e8
sw $t5, 0($t3)
addi $t3, $t4, 11656
li $t5, 0xfbf0e9
sw $t5, 0($t3)
addi $t3, $t4, 11660
li $t5, 0xf3e9e3
sw $t5, 0($t3)
addi $t3, $t4, 11664
li $t5, 0xe2d6d1
sw $t5, 0($t3)
addi $t3, $t4, 11668
li $t5, 0xe7d7d8
sw $t5, 0($t3)
addi $t3, $t4, 11672
li $t5, 0xe9d0d5
sw $t5, 0($t3)
addi $t3, $t4, 11676
li $t5, 0xfbd7df
sw $t5, 0($t3)
addi $t3, $t4, 11680
li $t5, 0xd9c5ca
sw $t5, 0($t3)
addi $t3, $t4, 11684
li $t5, 0xf5f0ef
sw $t5, 0($t3)
addi $t3, $t4, 11688
li $t5, 0xe9dfe6
sw $t5, 0($t3)
addi $t3, $t4, 11692
li $t5, 0xfaeffa
sw $t5, 0($t3)
addi $t3, $t4, 11696
li $t5, 0xf9eef6
sw $t5, 0($t3)
addi $t3, $t4, 11700
li $t5, 0xfaf1f6
sw $t5, 0($t3)
addi $t3, $t4, 11704
li $t5, 0xf4e9f4
sw $t5, 0($t3)
addi $t3, $t4, 11708
li $t5, 0xc0acc0
sw $t5, 0($t3)
addi $t3, $t4, 11712
li $t5, 0xd7b9d9
sw $t5, 0($t3)
addi $t3, $t4, 11716
li $t5, 0xebcbe4
sw $t5, 0($t3)
addi $t3, $t4, 11720
li $t5, 0xeecaca
sw $t5, 0($t3)
addi $t3, $t4, 11724
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11728
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 11732
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11736
sw $t5, 0($t3)
addi $t3, $t4, 11740
sw $t5, 0($t3)
addi $t3, $t4, 11744
sw $t5, 0($t3)
addi $t3, $t4, 11748
sw $t5, 0($t3)
addi $t3, $t4, 11752
sw $t5, 0($t3)
addi $t3, $t4, 11756
sw $t5, 0($t3)
addi $t3, $t4, 11760
sw $t5, 0($t3)
addi $t3, $t4, 11764
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 11768
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 11772
li $t5, 0xffc1b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 11776
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 11780
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11784
sw $t5, 0($t3)
addi $t3, $t4, 11788
sw $t5, 0($t3)
addi $t3, $t4, 11792
sw $t5, 0($t3)
addi $t3, $t4, 11796
sw $t5, 0($t3)
addi $t3, $t4, 11800
sw $t5, 0($t3)
addi $t3, $t4, 11804
sw $t5, 0($t3)
addi $t3, $t4, 11808
sw $t5, 0($t3)
addi $t3, $t4, 11812
li $t5, 0xfbbeb5
sw $t5, 0($t3)
addi $t3, $t4, 11816
li $t5, 0xc299a1
sw $t5, 0($t3)
addi $t3, $t4, 11820
li $t5, 0xafa1b3
sw $t5, 0($t3)
addi $t3, $t4, 11824
li $t5, 0xd8e6f5
sw $t5, 0($t3)
addi $t3, $t4, 11828
li $t5, 0xfbfcfc
sw $t5, 0($t3)
addi $t3, $t4, 11832
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 11836
li $t5, 0xf6f6f4
sw $t5, 0($t3)
addi $t3, $t4, 11840
li $t5, 0xf0f3f3
sw $t5, 0($t3)
addi $t3, $t4, 11844
li $t5, 0xfcf3fc
sw $t5, 0($t3)
addi $t3, $t4, 11848
li $t5, 0xe4d3e3
sw $t5, 0($t3)
addi $t3, $t4, 11852
li $t5, 0x412531
sw $t5, 0($t3)
addi $t3, $t4, 11856
li $t5, 0x85696f
sw $t5, 0($t3)
addi $t3, $t4, 11860
li $t5, 0xba9699
sw $t5, 0($t3)
addi $t3, $t4, 11864
li $t5, 0xd1aaad
sw $t5, 0($t3)
addi $t3, $t4, 11868
li $t5, 0xd9bdbc
sw $t5, 0($t3)
addi $t3, $t4, 11872
li $t5, 0xddc8c5
sw $t5, 0($t3)
addi $t3, $t4, 11876
li $t5, 0xd5c8c2
sw $t5, 0($t3)
addi $t3, $t4, 11880
li $t5, 0xc8bfb8
sw $t5, 0($t3)
addi $t3, $t4, 11884
li $t5, 0xb6ada7
sw $t5, 0($t3)
addi $t3, $t4, 11888
li $t5, 0x928c87
sw $t5, 0($t3)
addi $t3, $t4, 11892
li $t5, 0x645653
sw $t5, 0($t3)
addi $t3, $t4, 11896
li $t5, 0x867a78
sw $t5, 0($t3)
addi $t3, $t4, 11900
li $t5, 0xaaa7a1
sw $t5, 0($t3)
addi $t3, $t4, 11904
li $t5, 0xd3d0c7
sw $t5, 0($t3)
addi $t3, $t4, 11908
li $t5, 0xefe8e0
sw $t5, 0($t3)
addi $t3, $t4, 11912
li $t5, 0xf8eae4
sw $t5, 0($t3)
addi $t3, $t4, 11916
li $t5, 0xfbe9e1
sw $t5, 0($t3)
addi $t3, $t4, 11920
li $t5, 0xfbe3dc
sw $t5, 0($t3)
addi $t3, $t4, 11924
li $t5, 0xfadcdb
sw $t5, 0($t3)
addi $t3, $t4, 11928
li $t5, 0xfbd8db
sw $t5, 0($t3)
addi $t3, $t4, 11932
li $t5, 0xf2dedc
sw $t5, 0($t3)
addi $t3, $t4, 11936
li $t5, 0xd2c9d1
sw $t5, 0($t3)
addi $t3, $t4, 11940
li $t5, 0xdfd9dd
sw $t5, 0($t3)
addi $t3, $t4, 11944
li $t5, 0xded5e0
sw $t5, 0($t3)
addi $t3, $t4, 11948
li $t5, 0xfbf2fa
sw $t5, 0($t3)
addi $t3, $t4, 11952
li $t5, 0xfbf0f8
sw $t5, 0($t3)
addi $t3, $t4, 11956
sw $t5, 0($t3)
addi $t3, $t4, 11960
li $t5, 0xecdaed
sw $t5, 0($t3)
addi $t3, $t4, 11964
li $t5, 0xbca9c0
sw $t5, 0($t3)
addi $t3, $t4, 11968
li $t5, 0xc5a6d0
sw $t5, 0($t3)
addi $t3, $t4, 11972
li $t5, 0xdfbddf
sw $t5, 0($t3)
addi $t3, $t4, 11976
li $t5, 0xe7cddf
sw $t5, 0($t3)
addi $t3, $t4, 11980
li $t5, 0xf7bcb3
sw $t5, 0($t3)
addi $t3, $t4, 11984
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 11988
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 11992
sw $t5, 0($t3)
addi $t3, $t4, 11996
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12000
sw $t5, 0($t3)
addi $t3, $t4, 12004
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12008
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12012
sw $t5, 0($t3)
addi $t3, $t4, 12016
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 12020
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12024
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12028
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 12032
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 12036
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12040
sw $t5, 0($t3)
addi $t3, $t4, 12044
sw $t5, 0($t3)
addi $t3, $t4, 12048
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12052
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12056
sw $t5, 0($t3)
addi $t3, $t4, 12060
sw $t5, 0($t3)
addi $t3, $t4, 12064
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12068
li $t5, 0xe9b3ac
sw $t5, 0($t3)
addi $t3, $t4, 12072
li $t5, 0xe6b7b6
sw $t5, 0($t3)
addi $t3, $t4, 12076
li $t5, 0xded2de
sw $t5, 0($t3)
addi $t3, $t4, 12080
li $t5, 0xddb8b7
sw $t5, 0($t3)
addi $t3, $t4, 12084
li $t5, 0xf2e5e5
sw $t5, 0($t3)
addi $t3, $t4, 12088
li $t5, 0xfafafa
sw $t5, 0($t3)
addi $t3, $t4, 12092
li $t5, 0xfafaf9
sw $t5, 0($t3)
addi $t3, $t4, 12096
li $t5, 0xf1edf4
sw $t5, 0($t3)
addi $t3, $t4, 12100
li $t5, 0xf9eef8
sw $t5, 0($t3)
addi $t3, $t4, 12104
li $t5, 0xefe7ed
sw $t5, 0($t3)
addi $t3, $t4, 12108
li $t5, 0x361b31
sw $t5, 0($t3)
addi $t3, $t4, 12112
li $t5, 0x49323a
sw $t5, 0($t3)
addi $t3, $t4, 12116
li $t5, 0x422d30
sw $t5, 0($t3)
addi $t3, $t4, 12120
li $t5, 0x3f2b2d
sw $t5, 0($t3)
addi $t3, $t4, 12124
li $t5, 0x3c2a2b
sw $t5, 0($t3)
addi $t3, $t4, 12128
li $t5, 0x392b2b
sw $t5, 0($t3)
addi $t3, $t4, 12132
li $t5, 0x392b2c
sw $t5, 0($t3)
addi $t3, $t4, 12136
li $t5, 0x3a2c2d
sw $t5, 0($t3)
addi $t3, $t4, 12140
sw $t5, 0($t3)
addi $t3, $t4, 12144
sw $t5, 0($t3)
addi $t3, $t4, 12148
li $t5, 0x463838
sw $t5, 0($t3)
addi $t3, $t4, 12152
li $t5, 0x483b3b
sw $t5, 0($t3)
addi $t3, $t4, 12156
li $t5, 0x413334
sw $t5, 0($t3)
addi $t3, $t4, 12160
li $t5, 0x413434
sw $t5, 0($t3)
addi $t3, $t4, 12164
li $t5, 0x433838
sw $t5, 0($t3)
addi $t3, $t4, 12168
li $t5, 0x4a3e3e
sw $t5, 0($t3)
addi $t3, $t4, 12172
li $t5, 0x574949
sw $t5, 0($t3)
addi $t3, $t4, 12176
li $t5, 0x5e4d4e
sw $t5, 0($t3)
addi $t3, $t4, 12180
li $t5, 0x675657
sw $t5, 0($t3)
addi $t3, $t4, 12184
li $t5, 0x7f6864
sw $t5, 0($t3)
addi $t3, $t4, 12188
li $t5, 0xd3cec7
sw $t5, 0($t3)
addi $t3, $t4, 12192
li $t5, 0xf2edf3
sw $t5, 0($t3)
addi $t3, $t4, 12196
li $t5, 0xd7cfd7
sw $t5, 0($t3)
addi $t3, $t4, 12200
li $t5, 0xe4d8e3
sw $t5, 0($t3)
addi $t3, $t4, 12204
li $t5, 0xfcf4fc
sw $t5, 0($t3)
addi $t3, $t4, 12208
li $t5, 0xf7f0f7
sw $t5, 0($t3)
addi $t3, $t4, 12212
li $t5, 0xfcf0fb
sw $t5, 0($t3)
addi $t3, $t4, 12216
li $t5, 0xe7d7ea
sw $t5, 0($t3)
addi $t3, $t4, 12220
li $t5, 0xcbb0cf
sw $t5, 0($t3)
addi $t3, $t4, 12224
li $t5, 0xc8a9d2
sw $t5, 0($t3)
addi $t3, $t4, 12228
li $t5, 0xbfa6c4
sw $t5, 0($t3)
addi $t3, $t4, 12232
li $t5, 0xe6c6e3
sw $t5, 0($t3)
addi $t3, $t4, 12236
li $t5, 0xeabfbf
sw $t5, 0($t3)
addi $t3, $t4, 12240
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12244
sw $t5, 0($t3)
addi $t3, $t4, 12248
sw $t5, 0($t3)
addi $t3, $t4, 12252
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12256
sw $t5, 0($t3)
addi $t3, $t4, 12260
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12264
sw $t5, 0($t3)
addi $t3, $t4, 12268
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12272
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12276
sw $t5, 0($t3)
addi $t3, $t4, 12280
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 12284
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 12288
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 12292
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 12296
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12300
sw $t5, 0($t3)
addi $t3, $t4, 12304
sw $t5, 0($t3)
addi $t3, $t4, 12308
sw $t5, 0($t3)
addi $t3, $t4, 12312
sw $t5, 0($t3)
addi $t3, $t4, 12316
sw $t5, 0($t3)
addi $t3, $t4, 12320
sw $t5, 0($t3)
addi $t3, $t4, 12324
sw $t5, 0($t3)
addi $t3, $t4, 12328
li $t5, 0xefc1c2
sw $t5, 0($t3)
addi $t3, $t4, 12332
li $t5, 0xf2ecf5
sw $t5, 0($t3)
addi $t3, $t4, 12336
li $t5, 0xe8ecf0
sw $t5, 0($t3)
addi $t3, $t4, 12340
li $t5, 0xf8f3f4
sw $t5, 0($t3)
addi $t3, $t4, 12344
li $t5, 0xf5faf8
sw $t5, 0($t3)
addi $t3, $t4, 12348
li $t5, 0xfbf7fd
sw $t5, 0($t3)
addi $t3, $t4, 12352
li $t5, 0xf9f2f5
sw $t5, 0($t3)
addi $t3, $t4, 12356
li $t5, 0xf7eaf6
sw $t5, 0($t3)
addi $t3, $t4, 12360
li $t5, 0xeedeea
sw $t5, 0($t3)
addi $t3, $t4, 12364
li $t5, 0x8a758f
sw $t5, 0($t3)
addi $t3, $t4, 12368
li $t5, 0x5a4852
sw $t5, 0($t3)
addi $t3, $t4, 12372
li $t5, 0x4c3a3b
sw $t5, 0($t3)
addi $t3, $t4, 12376
li $t5, 0x402e2f
sw $t5, 0($t3)
addi $t3, $t4, 12380
li $t5, 0x3b2d2d
sw $t5, 0($t3)
addi $t3, $t4, 12384
li $t5, 0x392b2b
sw $t5, 0($t3)
addi $t3, $t4, 12388
sw $t5, 0($t3)
addi $t3, $t4, 12392
li $t5, 0x3a2c2c
sw $t5, 0($t3)
addi $t3, $t4, 12396
li $t5, 0x3b2d2d
sw $t5, 0($t3)
addi $t3, $t4, 12400
sw $t5, 0($t3)
addi $t3, $t4, 12404
li $t5, 0x3c2e2e
sw $t5, 0($t3)
addi $t3, $t4, 12408
li $t5, 0x3e3030
sw $t5, 0($t3)
addi $t3, $t4, 12412
li $t5, 0x413333
sw $t5, 0($t3)
addi $t3, $t4, 12416
li $t5, 0x453737
sw $t5, 0($t3)
addi $t3, $t4, 12420
li $t5, 0x463a3a
sw $t5, 0($t3)
addi $t3, $t4, 12424
li $t5, 0x4d4040
sw $t5, 0($t3)
addi $t3, $t4, 12428
li $t5, 0x58494a
sw $t5, 0($t3)
addi $t3, $t4, 12432
li $t5, 0x625054
sw $t5, 0($t3)
addi $t3, $t4, 12436
li $t5, 0x6a5a5c
sw $t5, 0($t3)
addi $t3, $t4, 12440
li $t5, 0xa89991
sw $t5, 0($t3)
addi $t3, $t4, 12444
li $t5, 0xebe8e7
sw $t5, 0($t3)
addi $t3, $t4, 12448
li $t5, 0xf7f4f8
sw $t5, 0($t3)
addi $t3, $t4, 12452
li $t5, 0xe7dee8
sw $t5, 0($t3)
addi $t3, $t4, 12456
li $t5, 0xeadce8
sw $t5, 0($t3)
addi $t3, $t4, 12460
li $t5, 0xfbf5fc
sw $t5, 0($t3)
addi $t3, $t4, 12464
li $t5, 0xfcf5fc
sw $t5, 0($t3)
addi $t3, $t4, 12468
li $t5, 0xf7ecf7
sw $t5, 0($t3)
addi $t3, $t4, 12472
li $t5, 0xeadcee
sw $t5, 0($t3)
addi $t3, $t4, 12476
li $t5, 0xd4c0d6
sw $t5, 0($t3)
addi $t3, $t4, 12480
li $t5, 0xd5c0e2
sw $t5, 0($t3)
addi $t3, $t4, 12484
li $t5, 0xb696c3
sw $t5, 0($t3)
addi $t3, $t4, 12488
li $t5, 0xd2b3d3
sw $t5, 0($t3)
addi $t3, $t4, 12492
li $t5, 0xe6c9dc
sw $t5, 0($t3)
addi $t3, $t4, 12496
li $t5, 0xf9beb5
sw $t5, 0($t3)
addi $t3, $t4, 12500
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12504
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12508
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12512
sw $t5, 0($t3)
addi $t3, $t4, 12516
sw $t5, 0($t3)
addi $t3, $t4, 12520
sw $t5, 0($t3)
addi $t3, $t4, 12524
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12528
sw $t5, 0($t3)
addi $t3, $t4, 12532
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 12536
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12540
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 12544
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 12548
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 12552
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12556
sw $t5, 0($t3)
addi $t3, $t4, 12560
sw $t5, 0($t3)
addi $t3, $t4, 12564
sw $t5, 0($t3)
addi $t3, $t4, 12568
sw $t5, 0($t3)
addi $t3, $t4, 12572
sw $t5, 0($t3)
addi $t3, $t4, 12576
sw $t5, 0($t3)
addi $t3, $t4, 12580
sw $t5, 0($t3)
addi $t3, $t4, 12584
li $t5, 0xe8c4c3
sw $t5, 0($t3)
addi $t3, $t4, 12588
li $t5, 0xf5e9f3
sw $t5, 0($t3)
addi $t3, $t4, 12592
li $t5, 0xeee9f0
sw $t5, 0($t3)
addi $t3, $t4, 12596
li $t5, 0xf7f6f7
sw $t5, 0($t3)
addi $t3, $t4, 12600
li $t5, 0xfbf9fd
sw $t5, 0($t3)
addi $t3, $t4, 12604
li $t5, 0xfdf8fc
sw $t5, 0($t3)
addi $t3, $t4, 12608
li $t5, 0xf9f8f6
sw $t5, 0($t3)
addi $t3, $t4, 12612
li $t5, 0xf1e4f4
sw $t5, 0($t3)
addi $t3, $t4, 12616
li $t5, 0xe7cceb
sw $t5, 0($t3)
addi $t3, $t4, 12620
li $t5, 0xc2b2c7
sw $t5, 0($t3)
addi $t3, $t4, 12624
li $t5, 0xb5acb9
sw $t5, 0($t3)
addi $t3, $t4, 12628
li $t5, 0x5d4d4f
sw $t5, 0($t3)
addi $t3, $t4, 12632
li $t5, 0x403232
sw $t5, 0($t3)
addi $t3, $t4, 12636
li $t5, 0x3b2d2d
sw $t5, 0($t3)
addi $t3, $t4, 12640
li $t5, 0x392b2b
sw $t5, 0($t3)
addi $t3, $t4, 12644
li $t5, 0x382a2a
sw $t5, 0($t3)
addi $t3, $t4, 12648
sw $t5, 0($t3)
addi $t3, $t4, 12652
li $t5, 0x3a2c2c
sw $t5, 0($t3)
addi $t3, $t4, 12656
li $t5, 0x3c2e2e
sw $t5, 0($t3)
addi $t3, $t4, 12660
li $t5, 0x3d2f2f
sw $t5, 0($t3)
addi $t3, $t4, 12664
li $t5, 0x3f3131
sw $t5, 0($t3)
addi $t3, $t4, 12668
li $t5, 0x423434
sw $t5, 0($t3)
addi $t3, $t4, 12672
li $t5, 0x463838
sw $t5, 0($t3)
addi $t3, $t4, 12676
li $t5, 0x4c3c3d
sw $t5, 0($t3)
addi $t3, $t4, 12680
li $t5, 0x534344
sw $t5, 0($t3)
addi $t3, $t4, 12684
li $t5, 0x5d4d4f
sw $t5, 0($t3)
addi $t3, $t4, 12688
li $t5, 0x695959
sw $t5, 0($t3)
addi $t3, $t4, 12692
li $t5, 0x736967
sw $t5, 0($t3)
addi $t3, $t4, 12696
li $t5, 0x978885
sw $t5, 0($t3)
addi $t3, $t4, 12700
li $t5, 0xd1cdd3
sw $t5, 0($t3)
addi $t3, $t4, 12704
li $t5, 0xf4f3f5
sw $t5, 0($t3)
addi $t3, $t4, 12708
li $t5, 0xf1ecf1
sw $t5, 0($t3)
addi $t3, $t4, 12712
li $t5, 0xede2ec
sw $t5, 0($t3)
addi $t3, $t4, 12716
li $t5, 0xfcf3fc
sw $t5, 0($t3)
addi $t3, $t4, 12720
li $t5, 0xfaf4f6
sw $t5, 0($t3)
addi $t3, $t4, 12724
li $t5, 0xf6e9f7
sw $t5, 0($t3)
addi $t3, $t4, 12728
li $t5, 0xefe1f0
sw $t5, 0($t3)
addi $t3, $t4, 12732
li $t5, 0xd2c1d3
sw $t5, 0($t3)
addi $t3, $t4, 12736
li $t5, 0xdecbe5
sw $t5, 0($t3)
addi $t3, $t4, 12740
li $t5, 0xbfa2c9
sw $t5, 0($t3)
addi $t3, $t4, 12744
li $t5, 0xc0a0cb
sw $t5, 0($t3)
addi $t3, $t4, 12748
li $t5, 0xddc2d9
sw $t5, 0($t3)
addi $t3, $t4, 12752
li $t5, 0xe9cecf
sw $t5, 0($t3)
addi $t3, $t4, 12756
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12760
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12764
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12768
sw $t5, 0($t3)
addi $t3, $t4, 12772
sw $t5, 0($t3)
addi $t3, $t4, 12776
sw $t5, 0($t3)
addi $t3, $t4, 12780
sw $t5, 0($t3)
addi $t3, $t4, 12784
sw $t5, 0($t3)
addi $t3, $t4, 12788
sw $t5, 0($t3)
addi $t3, $t4, 12792
sw $t5, 0($t3)
addi $t3, $t4, 12796
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 12800
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 12804
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12808
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12812
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12816
sw $t5, 0($t3)
addi $t3, $t4, 12820
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12824
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12828
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12832
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 12836
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 12840
li $t5, 0xe0cacb
sw $t5, 0($t3)
addi $t3, $t4, 12844
li $t5, 0xfbf8fb
sw $t5, 0($t3)
addi $t3, $t4, 12848
li $t5, 0xf3efef
sw $t5, 0($t3)
addi $t3, $t4, 12852
li $t5, 0xf8eff7
sw $t5, 0($t3)
addi $t3, $t4, 12856
li $t5, 0xfbf2fb
sw $t5, 0($t3)
addi $t3, $t4, 12860
li $t5, 0xfdfbfd
sw $t5, 0($t3)
addi $t3, $t4, 12864
li $t5, 0xfcfbfb
sw $t5, 0($t3)
addi $t3, $t4, 12868
li $t5, 0xf1e9f6
sw $t5, 0($t3)
addi $t3, $t4, 12872
li $t5, 0xe4d3ea
sw $t5, 0($t3)
addi $t3, $t4, 12876
li $t5, 0xdbc1d7
sw $t5, 0($t3)
addi $t3, $t4, 12880
li $t5, 0xf6f5f7
sw $t5, 0($t3)
addi $t3, $t4, 12884
li $t5, 0x736971
sw $t5, 0($t3)
addi $t3, $t4, 12888
li $t5, 0x3f3132
sw $t5, 0($t3)
addi $t3, $t4, 12892
li $t5, 0x3a2c2c
sw $t5, 0($t3)
addi $t3, $t4, 12896
li $t5, 0x392b2b
sw $t5, 0($t3)
addi $t3, $t4, 12900
li $t5, 0x382a2a
sw $t5, 0($t3)
addi $t3, $t4, 12904
sw $t5, 0($t3)
addi $t3, $t4, 12908
sw $t5, 0($t3)
addi $t3, $t4, 12912
li $t5, 0x392b2b
sw $t5, 0($t3)
addi $t3, $t4, 12916
li $t5, 0x3c2c2d
sw $t5, 0($t3)
addi $t3, $t4, 12920
li $t5, 0x3e2f30
sw $t5, 0($t3)
addi $t3, $t4, 12924
li $t5, 0x413333
sw $t5, 0($t3)
addi $t3, $t4, 12928
li $t5, 0x463838
sw $t5, 0($t3)
addi $t3, $t4, 12932
li $t5, 0x4d3d3e
sw $t5, 0($t3)
addi $t3, $t4, 12936
li $t5, 0x564648
sw $t5, 0($t3)
addi $t3, $t4, 12940
li $t5, 0x615153
sw $t5, 0($t3)
addi $t3, $t4, 12944
li $t5, 0x6d5f5e
sw $t5, 0($t3)
addi $t3, $t4, 12948
li $t5, 0x7f6c77
sw $t5, 0($t3)
addi $t3, $t4, 12952
li $t5, 0xcebccd
sw $t5, 0($t3)
addi $t3, $t4, 12956
li $t5, 0xc1b3c4
sw $t5, 0($t3)
addi $t3, $t4, 12960
li $t5, 0xf3f3f4
sw $t5, 0($t3)
addi $t3, $t4, 12964
li $t5, 0xfafbfa
sw $t5, 0($t3)
addi $t3, $t4, 12968
li $t5, 0xede6e8
sw $t5, 0($t3)
addi $t3, $t4, 12972
li $t5, 0xfdf6fd
sw $t5, 0($t3)
addi $t3, $t4, 12976
li $t5, 0xf9f3fa
sw $t5, 0($t3)
addi $t3, $t4, 12980
li $t5, 0xf6e9f7
sw $t5, 0($t3)
addi $t3, $t4, 12984
li $t5, 0xf1e5f5
sw $t5, 0($t3)
addi $t3, $t4, 12988
li $t5, 0xc3b4c4
sw $t5, 0($t3)
addi $t3, $t4, 12992
li $t5, 0xe2d3e8
sw $t5, 0($t3)
addi $t3, $t4, 12996
li $t5, 0xd6bee1
sw $t5, 0($t3)
addi $t3, $t4, 13000
li $t5, 0xae8fbc
sw $t5, 0($t3)
addi $t3, $t4, 13004
li $t5, 0xc8a6ce
sw $t5, 0($t3)
addi $t3, $t4, 13008
li $t5, 0xeadae7
sw $t5, 0($t3)
addi $t3, $t4, 13012
li $t5, 0xf6c4be
sw $t5, 0($t3)
addi $t3, $t4, 13016
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13020
sw $t5, 0($t3)
addi $t3, $t4, 13024
sw $t5, 0($t3)
addi $t3, $t4, 13028
sw $t5, 0($t3)
addi $t3, $t4, 13032
sw $t5, 0($t3)
addi $t3, $t4, 13036
sw $t5, 0($t3)
addi $t3, $t4, 13040
sw $t5, 0($t3)
addi $t3, $t4, 13044
sw $t5, 0($t3)
addi $t3, $t4, 13048
sw $t5, 0($t3)
addi $t3, $t4, 13052
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 13056
sw $t5, 0($t3)
addi $t3, $t4, 13060
sw $t5, 0($t3)
addi $t3, $t4, 13064
sw $t5, 0($t3)
addi $t3, $t4, 13068
sw $t5, 0($t3)
addi $t3, $t4, 13072
sw $t5, 0($t3)
addi $t3, $t4, 13076
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 13080
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13084
sw $t5, 0($t3)
addi $t3, $t4, 13088
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 13092
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13096
li $t5, 0xd3c1c6
sw $t5, 0($t3)
addi $t3, $t4, 13100
li $t5, 0xf9f7fb
sw $t5, 0($t3)
addi $t3, $t4, 13104
li $t5, 0xe8dde5
sw $t5, 0($t3)
addi $t3, $t4, 13108
li $t5, 0xfbf5fb
sw $t5, 0($t3)
addi $t3, $t4, 13112
li $t5, 0xfaf8fb
sw $t5, 0($t3)
addi $t3, $t4, 13116
sw $t5, 0($t3)
addi $t3, $t4, 13120
li $t5, 0xfefefb
sw $t5, 0($t3)
addi $t3, $t4, 13124
li $t5, 0xf8edfb
sw $t5, 0($t3)
addi $t3, $t4, 13128
li $t5, 0xe8e5f2
sw $t5, 0($t3)
addi $t3, $t4, 13132
li $t5, 0xf0d4ed
sw $t5, 0($t3)
addi $t3, $t4, 13136
li $t5, 0xfcfbfd
sw $t5, 0($t3)
addi $t3, $t4, 13140
li $t5, 0xc8bece
sw $t5, 0($t3)
addi $t3, $t4, 13144
li $t5, 0x3b2c32
sw $t5, 0($t3)
addi $t3, $t4, 13148
li $t5, 0x3a2c2d
sw $t5, 0($t3)
addi $t3, $t4, 13152
li $t5, 0x392b2b
sw $t5, 0($t3)
addi $t3, $t4, 13156
li $t5, 0x382a2a
sw $t5, 0($t3)
addi $t3, $t4, 13160
sw $t5, 0($t3)
addi $t3, $t4, 13164
li $t5, 0x352627
sw $t5, 0($t3)
addi $t3, $t4, 13168
li $t5, 0x382627
sw $t5, 0($t3)
addi $t3, $t4, 13172
li $t5, 0x3d292b
sw $t5, 0($t3)
addi $t3, $t4, 13176
li $t5, 0x3e2e2f
sw $t5, 0($t3)
addi $t3, $t4, 13180
li $t5, 0x3a2b2c
sw $t5, 0($t3)
addi $t3, $t4, 13184
li $t5, 0x483839
sw $t5, 0($t3)
addi $t3, $t4, 13188
li $t5, 0x4e3e3f
sw $t5, 0($t3)
addi $t3, $t4, 13192
li $t5, 0x58484b
sw $t5, 0($t3)
addi $t3, $t4, 13196
li $t5, 0x65555a
sw $t5, 0($t3)
addi $t3, $t4, 13200
li $t5, 0x6e5d64
sw $t5, 0($t3)
addi $t3, $t4, 13204
li $t5, 0xb8aeb8
sw $t5, 0($t3)
addi $t3, $t4, 13208
li $t5, 0xfcfdfc
sw $t5, 0($t3)
addi $t3, $t4, 13212
li $t5, 0xd9c4d5
sw $t5, 0($t3)
addi $t3, $t4, 13216
li $t5, 0xfafaf9
sw $t5, 0($t3)
addi $t3, $t4, 13220
li $t5, 0xf5f5f8
sw $t5, 0($t3)
addi $t3, $t4, 13224
li $t5, 0xf3efed
sw $t5, 0($t3)
addi $t3, $t4, 13228
li $t5, 0xfcf5fc
sw $t5, 0($t3)
addi $t3, $t4, 13232
li $t5, 0xf6f4f8
sw $t5, 0($t3)
addi $t3, $t4, 13236
li $t5, 0xf5ecf9
sw $t5, 0($t3)
addi $t3, $t4, 13240
li $t5, 0xf4e9f7
sw $t5, 0($t3)
addi $t3, $t4, 13244
li $t5, 0xd4c4d3
sw $t5, 0($t3)
addi $t3, $t4, 13248
li $t5, 0xe3d4e6
sw $t5, 0($t3)
addi $t3, $t4, 13252
li $t5, 0xe0caea
sw $t5, 0($t3)
addi $t3, $t4, 13256
li $t5, 0xbaa5c4
sw $t5, 0($t3)
addi $t3, $t4, 13260
li $t5, 0xc5a3d4
sw $t5, 0($t3)
addi $t3, $t4, 13264
li $t5, 0xd6b9d7
sw $t5, 0($t3)
addi $t3, $t4, 13268
li $t5, 0xead6dd
sw $t5, 0($t3)
addi $t3, $t4, 13272
li $t5, 0xf5bdb4
sw $t5, 0($t3)
addi $t3, $t4, 13276
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13280
sw $t5, 0($t3)
addi $t3, $t4, 13284
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 13288
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 13292
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13296
sw $t5, 0($t3)
addi $t3, $t4, 13300
sw $t5, 0($t3)
addi $t3, $t4, 13304
sw $t5, 0($t3)
addi $t3, $t4, 13308
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 13312
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 13316
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13320
sw $t5, 0($t3)
addi $t3, $t4, 13324
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 13328
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13332
sw $t5, 0($t3)
addi $t3, $t4, 13336
sw $t5, 0($t3)
addi $t3, $t4, 13340
sw $t5, 0($t3)
addi $t3, $t4, 13344
sw $t5, 0($t3)
addi $t3, $t4, 13348
li $t5, 0xfcbfb6
sw $t5, 0($t3)
addi $t3, $t4, 13352
li $t5, 0xc4bbcd
sw $t5, 0($t3)
addi $t3, $t4, 13356
li $t5, 0xf3f1f4
sw $t5, 0($t3)
addi $t3, $t4, 13360
li $t5, 0xf4ecf1
sw $t5, 0($t3)
addi $t3, $t4, 13364
li $t5, 0xfefefb
sw $t5, 0($t3)
addi $t3, $t4, 13368
li $t5, 0xfdfbfd
sw $t5, 0($t3)
addi $t3, $t4, 13372
li $t5, 0xf3f0f4
sw $t5, 0($t3)
addi $t3, $t4, 13376
li $t5, 0xfefffd
sw $t5, 0($t3)
addi $t3, $t4, 13380
li $t5, 0xf6edf9
sw $t5, 0($t3)
addi $t3, $t4, 13384
li $t5, 0xe6e7f1
sw $t5, 0($t3)
addi $t3, $t4, 13388
li $t5, 0xebd4e8
sw $t5, 0($t3)
addi $t3, $t4, 13392
li $t5, 0xfdf3fb
sw $t5, 0($t3)
addi $t3, $t4, 13396
li $t5, 0xd2c5df
sw $t5, 0($t3)
addi $t3, $t4, 13400
li $t5, 0x816b8e
sw $t5, 0($t3)
addi $t3, $t4, 13404
li $t5, 0x2e2329
sw $t5, 0($t3)
addi $t3, $t4, 13408
li $t5, 0x392c2d
sw $t5, 0($t3)
addi $t3, $t4, 13412
li $t5, 0x392a2b
sw $t5, 0($t3)
addi $t3, $t4, 13416
li $t5, 0x382a2a
sw $t5, 0($t3)
addi $t3, $t4, 13420
li $t5, 0x392a2a
sw $t5, 0($t3)
addi $t3, $t4, 13424
li $t5, 0x3c2b2c
sw $t5, 0($t3)
addi $t3, $t4, 13428
li $t5, 0x3d2b2c
sw $t5, 0($t3)
addi $t3, $t4, 13432
li $t5, 0x3e2f30
sw $t5, 0($t3)
addi $t3, $t4, 13436
li $t5, 0x423434
sw $t5, 0($t3)
addi $t3, $t4, 13440
li $t5, 0x483839
sw $t5, 0($t3)
addi $t3, $t4, 13444
li $t5, 0x4e3f3f
sw $t5, 0($t3)
addi $t3, $t4, 13448
li $t5, 0x58494a
sw $t5, 0($t3)
addi $t3, $t4, 13452
li $t5, 0x695162
sw $t5, 0($t3)
addi $t3, $t4, 13456
li $t5, 0x614361
sw $t5, 0($t3)
addi $t3, $t4, 13460
li $t5, 0xd1cbd5
sw $t5, 0($t3)
addi $t3, $t4, 13464
li $t5, 0xfefdfe
sw $t5, 0($t3)
addi $t3, $t4, 13468
li $t5, 0xebd9e6
sw $t5, 0($t3)
addi $t3, $t4, 13472
li $t5, 0xfdfdfc
sw $t5, 0($t3)
addi $t3, $t4, 13476
li $t5, 0xf0f0f3
sw $t5, 0($t3)
addi $t3, $t4, 13480
li $t5, 0xeee5ea
sw $t5, 0($t3)
addi $t3, $t4, 13484
li $t5, 0xfbf2fa
sw $t5, 0($t3)
addi $t3, $t4, 13488
li $t5, 0xfbf9fb
sw $t5, 0($t3)
addi $t3, $t4, 13492
li $t5, 0xf7edfa
sw $t5, 0($t3)
addi $t3, $t4, 13496
li $t5, 0xf0e6f4
sw $t5, 0($t3)
addi $t3, $t4, 13500
li $t5, 0xe6d6e8
sw $t5, 0($t3)
addi $t3, $t4, 13504
li $t5, 0xd7c9da
sw $t5, 0($t3)
addi $t3, $t4, 13508
li $t5, 0xe6d2f0
sw $t5, 0($t3)
addi $t3, $t4, 13512
li $t5, 0xdccae3
sw $t5, 0($t3)
addi $t3, $t4, 13516
li $t5, 0xb599c0
sw $t5, 0($t3)
addi $t3, $t4, 13520
li $t5, 0xd0b3db
sw $t5, 0($t3)
addi $t3, $t4, 13524
li $t5, 0xe5cde2
sw $t5, 0($t3)
addi $t3, $t4, 13528
li $t5, 0xdec2c7
sw $t5, 0($t3)
addi $t3, $t4, 13532
li $t5, 0xfbbeb5
sw $t5, 0($t3)
addi $t3, $t4, 13536
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13540
sw $t5, 0($t3)
addi $t3, $t4, 13544
sw $t5, 0($t3)
addi $t3, $t4, 13548
sw $t5, 0($t3)
addi $t3, $t4, 13552
sw $t5, 0($t3)
addi $t3, $t4, 13556
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 13560
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13564
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 13568
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 13572
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 13576
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13580
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 13584
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 13588
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13592
sw $t5, 0($t3)
addi $t3, $t4, 13596
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 13600
sw $t5, 0($t3)
addi $t3, $t4, 13604
li $t5, 0xe3afab
sw $t5, 0($t3)
addi $t3, $t4, 13608
li $t5, 0xc1accd
sw $t5, 0($t3)
addi $t3, $t4, 13612
li $t5, 0xfcf9fc
sw $t5, 0($t3)
addi $t3, $t4, 13616
li $t5, 0xf7ecf3
sw $t5, 0($t3)
addi $t3, $t4, 13620
li $t5, 0xf8f7f6
sw $t5, 0($t3)
addi $t3, $t4, 13624
li $t5, 0xfcfbfb
sw $t5, 0($t3)
addi $t3, $t4, 13628
li $t5, 0xf0eaf2
sw $t5, 0($t3)
addi $t3, $t4, 13632
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 13636
li $t5, 0xf6eff8
sw $t5, 0($t3)
addi $t3, $t4, 13640
li $t5, 0xdadaec
sw $t5, 0($t3)
addi $t3, $t4, 13644
li $t5, 0xf1e6f5
sw $t5, 0($t3)
addi $t3, $t4, 13648
li $t5, 0xefd1ed
sw $t5, 0($t3)
addi $t3, $t4, 13652
li $t5, 0xd9bfe7
sw $t5, 0($t3)
addi $t3, $t4, 13656
li $t5, 0x9b81b4
sw $t5, 0($t3)
addi $t3, $t4, 13660
li $t5, 0x2f2b38
sw $t5, 0($t3)
addi $t3, $t4, 13664
li $t5, 0x272020
sw $t5, 0($t3)
addi $t3, $t4, 13668
li $t5, 0x38282b
sw $t5, 0($t3)
addi $t3, $t4, 13672
li $t5, 0x382a2a
sw $t5, 0($t3)
addi $t3, $t4, 13676
sw $t5, 0($t3)
addi $t3, $t4, 13680
li $t5, 0x3a2c2c
sw $t5, 0($t3)
addi $t3, $t4, 13684
li $t5, 0x3c2b2e
sw $t5, 0($t3)
addi $t3, $t4, 13688
li $t5, 0x3f2d31
sw $t5, 0($t3)
addi $t3, $t4, 13692
li $t5, 0x423132
sw $t5, 0($t3)
addi $t3, $t4, 13696
li $t5, 0x483638
sw $t5, 0($t3)
addi $t3, $t4, 13700
li $t5, 0x4c3e3d
sw $t5, 0($t3)
addi $t3, $t4, 13704
li $t5, 0x504046
sw $t5, 0($t3)
addi $t3, $t4, 13708
li $t5, 0xb38cb3
sw $t5, 0($t3)
addi $t3, $t4, 13712
li $t5, 0xb08eb4
sw $t5, 0($t3)
addi $t3, $t4, 13716
li $t5, 0xbbb5bd
sw $t5, 0($t3)
addi $t3, $t4, 13720
li $t5, 0xfbfcfa
sw $t5, 0($t3)
addi $t3, $t4, 13724
li $t5, 0xfbf0fa
sw $t5, 0($t3)
addi $t3, $t4, 13728
li $t5, 0xfef6fd
sw $t5, 0($t3)
addi $t3, $t4, 13732
li $t5, 0xf3f3f6
sw $t5, 0($t3)
addi $t3, $t4, 13736
li $t5, 0xf1e8f0
sw $t5, 0($t3)
addi $t3, $t4, 13740
li $t5, 0xfbf9fa
sw $t5, 0($t3)
addi $t3, $t4, 13744
li $t5, 0xfbfbfa
sw $t5, 0($t3)
addi $t3, $t4, 13748
li $t5, 0xf8edf9
sw $t5, 0($t3)
addi $t3, $t4, 13752
li $t5, 0xe8e0ec
sw $t5, 0($t3)
addi $t3, $t4, 13756
li $t5, 0xf3e9f6
sw $t5, 0($t3)
addi $t3, $t4, 13760
li $t5, 0xdccadd
sw $t5, 0($t3)
addi $t3, $t4, 13764
li $t5, 0xecddf2
sw $t5, 0($t3)
addi $t3, $t4, 13768
li $t5, 0xe5d3ec
sw $t5, 0($t3)
addi $t3, $t4, 13772
li $t5, 0xd5c2dd
sw $t5, 0($t3)
addi $t3, $t4, 13776
li $t5, 0xcbafd4
sw $t5, 0($t3)
addi $t3, $t4, 13780
li $t5, 0xdfc6e2
sw $t5, 0($t3)
addi $t3, $t4, 13784
li $t5, 0xe7c8e2
sw $t5, 0($t3)
addi $t3, $t4, 13788
li $t5, 0xe7c6ca
sw $t5, 0($t3)
addi $t3, $t4, 13792
li $t5, 0xfcbfb6
sw $t5, 0($t3)
addi $t3, $t4, 13796
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13800
sw $t5, 0($t3)
addi $t3, $t4, 13804
sw $t5, 0($t3)
addi $t3, $t4, 13808
sw $t5, 0($t3)
addi $t3, $t4, 13812
sw $t5, 0($t3)
addi $t3, $t4, 13816
sw $t5, 0($t3)
addi $t3, $t4, 13820
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 13824
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 13828
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 13832
sw $t5, 0($t3)
addi $t3, $t4, 13836
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 13840
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 13844
li $t5, 0xffc1b7
sw $t5, 0($t3)
addi $t3, $t4, 13848
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 13852
sw $t5, 0($t3)
addi $t3, $t4, 13856
sw $t5, 0($t3)
addi $t3, $t4, 13860
li $t5, 0xdfadb4
sw $t5, 0($t3)
addi $t3, $t4, 13864
li $t5, 0xd5b8de
sw $t5, 0($t3)
addi $t3, $t4, 13868
li $t5, 0xfcfbfd
sw $t5, 0($t3)
addi $t3, $t4, 13872
li $t5, 0xfbf6fb
sw $t5, 0($t3)
addi $t3, $t4, 13876
li $t5, 0xf1edef
sw $t5, 0($t3)
addi $t3, $t4, 13880
li $t5, 0xe5e1e0
sw $t5, 0($t3)
addi $t3, $t4, 13884
li $t5, 0xf2eaf2
sw $t5, 0($t3)
addi $t3, $t4, 13888
li $t5, 0xfaf7fa
sw $t5, 0($t3)
addi $t3, $t4, 13892
li $t5, 0xfaeef9
sw $t5, 0($t3)
addi $t3, $t4, 13896
li $t5, 0xc6b9d7
sw $t5, 0($t3)
addi $t3, $t4, 13900
li $t5, 0xe4ebf7
sw $t5, 0($t3)
addi $t3, $t4, 13904
li $t5, 0xe6cbe6
sw $t5, 0($t3)
addi $t3, $t4, 13908
li $t5, 0xb694bd
sw $t5, 0($t3)
addi $t3, $t4, 13912
li $t5, 0x6b5c7e
sw $t5, 0($t3)
addi $t3, $t4, 13916
li $t5, 0x4f4b57
sw $t5, 0($t3)
addi $t3, $t4, 13920
li $t5, 0x1b0d10
sw $t5, 0($t3)
addi $t3, $t4, 13924
li $t5, 0x311a1e
sw $t5, 0($t3)
addi $t3, $t4, 13928
li $t5, 0x362828
sw $t5, 0($t3)
addi $t3, $t4, 13932
li $t5, 0x38292a
sw $t5, 0($t3)
addi $t3, $t4, 13936
li $t5, 0x392b2b
sw $t5, 0($t3)
addi $t3, $t4, 13940
li $t5, 0x3b2a2b
sw $t5, 0($t3)
addi $t3, $t4, 13944
li $t5, 0x3d2b2d
sw $t5, 0($t3)
addi $t3, $t4, 13948
li $t5, 0x422f31
sw $t5, 0($t3)
addi $t3, $t4, 13952
li $t5, 0x453536
sw $t5, 0($t3)
addi $t3, $t4, 13956
li $t5, 0x453133
sw $t5, 0($t3)
addi $t3, $t4, 13960
li $t5, 0x34262b
sw $t5, 0($t3)
addi $t3, $t4, 13964
li $t5, 0xb390bb
sw $t5, 0($t3)
addi $t3, $t4, 13968
li $t5, 0xd7bee1
sw $t5, 0($t3)
addi $t3, $t4, 13972
li $t5, 0xa097a5
sw $t5, 0($t3)
addi $t3, $t4, 13976
li $t5, 0xf5f5f8
sw $t5, 0($t3)
addi $t3, $t4, 13980
li $t5, 0xfdfbfe
sw $t5, 0($t3)
addi $t3, $t4, 13984
li $t5, 0xfaeaf8
sw $t5, 0($t3)
addi $t3, $t4, 13988
li $t5, 0xf3f1f5
sw $t5, 0($t3)
addi $t3, $t4, 13992
li $t5, 0xf4eef3
sw $t5, 0($t3)
addi $t3, $t4, 13996
li $t5, 0xfbfbfa
sw $t5, 0($t3)
addi $t3, $t4, 14000
li $t5, 0xf8f8f6
sw $t5, 0($t3)
addi $t3, $t4, 14004
li $t5, 0xf3ebf5
sw $t5, 0($t3)
addi $t3, $t4, 14008
li $t5, 0xf1ebf4
sw $t5, 0($t3)
addi $t3, $t4, 14012
li $t5, 0xf2eaf6
sw $t5, 0($t3)
addi $t3, $t4, 14016
li $t5, 0xe0d1e3
sw $t5, 0($t3)
addi $t3, $t4, 14020
li $t5, 0xf4e9f4
sw $t5, 0($t3)
addi $t3, $t4, 14024
li $t5, 0xeedcf3
sw $t5, 0($t3)
addi $t3, $t4, 14028
li $t5, 0xe6d6ea
sw $t5, 0($t3)
addi $t3, $t4, 14032
li $t5, 0xd3b7d0
sw $t5, 0($t3)
addi $t3, $t4, 14036
li $t5, 0xdcc4e1
sw $t5, 0($t3)
addi $t3, $t4, 14040
li $t5, 0xecd7e9
sw $t5, 0($t3)
addi $t3, $t4, 14044
li $t5, 0xe1bddd
sw $t5, 0($t3)
addi $t3, $t4, 14048
li $t5, 0xddbfcb
sw $t5, 0($t3)
addi $t3, $t4, 14052
li $t5, 0xf2b9b2
sw $t5, 0($t3)
addi $t3, $t4, 14056
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14060
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 14064
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 14068
sw $t5, 0($t3)
addi $t3, $t4, 14072
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14076
li $t5, 0xfec1b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 14080
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 14084
li $t5, 0xffc2b8
sw $t5, 0($t3)
addi $t3, $t4, 14088
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14092
sw $t5, 0($t3)
addi $t3, $t4, 14096
sw $t5, 0($t3)
addi $t3, $t4, 14100
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 14104
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14108
sw $t5, 0($t3)
addi $t3, $t4, 14112
sw $t5, 0($t3)
addi $t3, $t4, 14116
li $t5, 0xd7b2cb
sw $t5, 0($t3)
addi $t3, $t4, 14120
li $t5, 0xd6c3e2
sw $t5, 0($t3)
addi $t3, $t4, 14124
li $t5, 0xfcf9fc
sw $t5, 0($t3)
addi $t3, $t4, 14128
li $t5, 0xfcf8fc
sw $t5, 0($t3)
addi $t3, $t4, 14132
li $t5, 0xf0e4ec
sw $t5, 0($t3)
addi $t3, $t4, 14136
li $t5, 0xe0d0d3
sw $t5, 0($t3)
addi $t3, $t4, 14140
li $t5, 0xf9f4f8
sw $t5, 0($t3)
addi $t3, $t4, 14144
li $t5, 0xeee5f3
sw $t5, 0($t3)
addi $t3, $t4, 14148
li $t5, 0xfef1fb
sw $t5, 0($t3)
addi $t3, $t4, 14152
li $t5, 0xd3bbdf
sw $t5, 0($t3)
addi $t3, $t4, 14156
li $t5, 0xc4cfd9
sw $t5, 0($t3)
addi $t3, $t4, 14160
li $t5, 0xe5dee7
sw $t5, 0($t3)
addi $t3, $t4, 14164
li $t5, 0xbf9cc7
sw $t5, 0($t3)
addi $t3, $t4, 14168
li $t5, 0x4a4256
sw $t5, 0($t3)
addi $t3, $t4, 14172
li $t5, 0x251d1d
sw $t5, 0($t3)
addi $t3, $t4, 14176
li $t5, 0x1e1111
sw $t5, 0($t3)
addi $t3, $t4, 14180
li $t5, 0x31181c
sw $t5, 0($t3)
addi $t3, $t4, 14184
li $t5, 0x241617
sw $t5, 0($t3)
addi $t3, $t4, 14188
li $t5, 0x342324
sw $t5, 0($t3)
addi $t3, $t4, 14192
li $t5, 0x3a282a
sw $t5, 0($t3)
addi $t3, $t4, 14196
li $t5, 0x3a292a
sw $t5, 0($t3)
addi $t3, $t4, 14200
li $t5, 0x3b2b2c
sw $t5, 0($t3)
addi $t3, $t4, 14204
li $t5, 0x3d2c2d
sw $t5, 0($t3)
addi $t3, $t4, 14208
li $t5, 0x3b2629
sw $t5, 0($t3)
addi $t3, $t4, 14212
li $t5, 0x45272e
sw $t5, 0($t3)
addi $t3, $t4, 14216
li $t5, 0x403d40
sw $t5, 0($t3)
addi $t3, $t4, 14220
li $t5, 0x715c7c
sw $t5, 0($t3)
addi $t3, $t4, 14224
li $t5, 0xd1badd
sw $t5, 0($t3)
addi $t3, $t4, 14228
li $t5, 0x99819c
sw $t5, 0($t3)
addi $t3, $t4, 14232
li $t5, 0xf0eef2
sw $t5, 0($t3)
addi $t3, $t4, 14236
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 14240
li $t5, 0xf2e2f1
sw $t5, 0($t3)
addi $t3, $t4, 14244
li $t5, 0xf9f5f8
sw $t5, 0($t3)
addi $t3, $t4, 14248
li $t5, 0xf1e9f0
sw $t5, 0($t3)
addi $t3, $t4, 14252
li $t5, 0xfdfbfa
sw $t5, 0($t3)
addi $t3, $t4, 14256
li $t5, 0xfaf9fb
sw $t5, 0($t3)
addi $t3, $t4, 14260
li $t5, 0xf6ecfa
sw $t5, 0($t3)
addi $t3, $t4, 14264
li $t5, 0xf0edf3
sw $t5, 0($t3)
addi $t3, $t4, 14268
li $t5, 0xf4ecf6
sw $t5, 0($t3)
addi $t3, $t4, 14272
li $t5, 0xf4eaf5
sw $t5, 0($t3)
addi $t3, $t4, 14276
li $t5, 0xede6f1
sw $t5, 0($t3)
addi $t3, $t4, 14280
li $t5, 0xf4e9f7
sw $t5, 0($t3)
addi $t3, $t4, 14284
li $t5, 0xf0e2f5
sw $t5, 0($t3)
addi $t3, $t4, 14288
li $t5, 0xe5d7ea
sw $t5, 0($t3)
addi $t3, $t4, 14292
li $t5, 0xdab7cb
sw $t5, 0($t3)
addi $t3, $t4, 14296
li $t5, 0xe9d9eb
sw $t5, 0($t3)
addi $t3, $t4, 14300
li $t5, 0xe8cee6
sw $t5, 0($t3)
addi $t3, $t4, 14304
li $t5, 0xe1c4e4
sw $t5, 0($t3)
addi $t3, $t4, 14308
li $t5, 0xddc9db
sw $t5, 0($t3)
addi $t3, $t4, 14312
li $t5, 0xf1bbb9
sw $t5, 0($t3)
addi $t3, $t4, 14316
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14320
sw $t5, 0($t3)
addi $t3, $t4, 14324
sw $t5, 0($t3)
addi $t3, $t4, 14328
sw $t5, 0($t3)
addi $t3, $t4, 14332
li $t5, 0xffc1b7
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 14336
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 14340
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 14344
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14348
sw $t5, 0($t3)
addi $t3, $t4, 14352
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 14356
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 14360
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 14364
sw $t5, 0($t3)
addi $t3, $t4, 14368
li $t5, 0xfdbfb6
sw $t5, 0($t3)
addi $t3, $t4, 14372
li $t5, 0xc6a6da
sw $t5, 0($t3)
addi $t3, $t4, 14376
li $t5, 0xe3caec
sw $t5, 0($t3)
addi $t3, $t4, 14380
li $t5, 0xfdf8fb
sw $t5, 0($t3)
addi $t3, $t4, 14384
li $t5, 0xfdfcfd
sw $t5, 0($t3)
addi $t3, $t4, 14388
li $t5, 0xecdaed
sw $t5, 0($t3)
addi $t3, $t4, 14392
li $t5, 0xeaddde
sw $t5, 0($t3)
addi $t3, $t4, 14396
li $t5, 0xecdedf
sw $t5, 0($t3)
addi $t3, $t4, 14400
li $t5, 0xeedbf2
sw $t5, 0($t3)
addi $t3, $t4, 14404
li $t5, 0xf7e8f5
sw $t5, 0($t3)
addi $t3, $t4, 14408
li $t5, 0xe2c4e6
sw $t5, 0($t3)
addi $t3, $t4, 14412
li $t5, 0xb9bdd1
sw $t5, 0($t3)
addi $t3, $t4, 14416
li $t5, 0xf5f5f7
sw $t5, 0($t3)
addi $t3, $t4, 14420
li $t5, 0xcdadd9
sw $t5, 0($t3)
addi $t3, $t4, 14424
li $t5, 0x5f526a
sw $t5, 0($t3)
addi $t3, $t4, 14428
li $t5, 0x21171a
sw $t5, 0($t3)
addi $t3, $t4, 14432
li $t5, 0x1f1413
sw $t5, 0($t3)
addi $t3, $t4, 14436
li $t5, 0x2f1b1d
sw $t5, 0($t3)
addi $t3, $t4, 14440
li $t5, 0x2a1b1b
sw $t5, 0($t3)
addi $t3, $t4, 14444
li $t5, 0x271416
sw $t5, 0($t3)
addi $t3, $t4, 14448
li $t5, 0x2a1b1d
sw $t5, 0($t3)
addi $t3, $t4, 14452
li $t5, 0x322325
sw $t5, 0($t3)
addi $t3, $t4, 14456
li $t5, 0x332022
sw $t5, 0($t3)
addi $t3, $t4, 14460
li $t5, 0x381e21
sw $t5, 0($t3)
addi $t3, $t4, 14464
li $t5, 0x402228
sw $t5, 0($t3)
addi $t3, $t4, 14468
li $t5, 0x3f2329
sw $t5, 0($t3)
addi $t3, $t4, 14472
li $t5, 0x464247
sw $t5, 0($t3)
addi $t3, $t4, 14476
li $t5, 0x5d5159
sw $t5, 0($t3)
addi $t3, $t4, 14480
li $t5, 0xb2a6ba
sw $t5, 0($t3)
addi $t3, $t4, 14484
li $t5, 0xc8b6ca
sw $t5, 0($t3)
addi $t3, $t4, 14488
li $t5, 0xebe6eb
sw $t5, 0($t3)
addi $t3, $t4, 14492
li $t5, 0xf7f8f9
sw $t5, 0($t3)
addi $t3, $t4, 14496
li $t5, 0xfbf6fa
sw $t5, 0($t3)
addi $t3, $t4, 14500
li $t5, 0xebe4eb
sw $t5, 0($t3)
addi $t3, $t4, 14504
li $t5, 0xf3eef4
sw $t5, 0($t3)
addi $t3, $t4, 14508
li $t5, 0xfffefd
sw $t5, 0($t3)
addi $t3, $t4, 14512
li $t5, 0xfaf8fb
sw $t5, 0($t3)
addi $t3, $t4, 14516
li $t5, 0xf6eaf8
sw $t5, 0($t3)
addi $t3, $t4, 14520
li $t5, 0xefeaf4
sw $t5, 0($t3)
addi $t3, $t4, 14524
li $t5, 0xf6f2f8
sw $t5, 0($t3)
addi $t3, $t4, 14528
li $t5, 0xfaf4fa
sw $t5, 0($t3)
addi $t3, $t4, 14532
li $t5, 0xf4eef7
sw $t5, 0($t3)
addi $t3, $t4, 14536
li $t5, 0xf7f0f8
sw $t5, 0($t3)
addi $t3, $t4, 14540
li $t5, 0xf5ebf7
sw $t5, 0($t3)
addi $t3, $t4, 14544
li $t5, 0xf2e7f4
sw $t5, 0($t3)
addi $t3, $t4, 14548
li $t5, 0xe8d2dc
sw $t5, 0($t3)
addi $t3, $t4, 14552
li $t5, 0xe5c8d7
sw $t5, 0($t3)
addi $t3, $t4, 14556
li $t5, 0xf5eaf4
sw $t5, 0($t3)
addi $t3, $t4, 14560
li $t5, 0xe3cce5
sw $t5, 0($t3)
addi $t3, $t4, 14564
li $t5, 0xdcd0e9
sw $t5, 0($t3)
addi $t3, $t4, 14568
li $t5, 0xd6d0e3
sw $t5, 0($t3)
addi $t3, $t4, 14572
li $t5, 0xd5adb1
sw $t5, 0($t3)
addi $t3, $t4, 14576
li $t5, 0xfdc0b7
sw $t5, 0($t3)
addi $t3, $t4, 14580
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 14584
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14588
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 14592
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 14596
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14600
sw $t5, 0($t3)
addi $t3, $t4, 14604
sw $t5, 0($t3)
addi $t3, $t4, 14608
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 14612
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 14616
sw $t5, 0($t3)
addi $t3, $t4, 14620
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 14624
li $t5, 0xddaaaf
sw $t5, 0($t3)
addi $t3, $t4, 14628
li $t5, 0xd7bbe5
sw $t5, 0($t3)
addi $t3, $t4, 14632
li $t5, 0xe8cbea
sw $t5, 0($t3)
addi $t3, $t4, 14636
li $t5, 0xf2ecee
sw $t5, 0($t3)
addi $t3, $t4, 14640
li $t5, 0xf6f7fa
sw $t5, 0($t3)
addi $t3, $t4, 14644
li $t5, 0xf0e2f4
sw $t5, 0($t3)
addi $t3, $t4, 14648
li $t5, 0xe6d9e5
sw $t5, 0($t3)
addi $t3, $t4, 14652
li $t5, 0xcaa3a6
sw $t5, 0($t3)
addi $t3, $t4, 14656
li $t5, 0xefe2ed
sw $t5, 0($t3)
addi $t3, $t4, 14660
li $t5, 0xe7ceea
sw $t5, 0($t3)
addi $t3, $t4, 14664
li $t5, 0xefcfea
sw $t5, 0($t3)
addi $t3, $t4, 14668
li $t5, 0xcbc4de
sw $t5, 0($t3)
addi $t3, $t4, 14672
li $t5, 0xeaecef
sw $t5, 0($t3)
addi $t3, $t4, 14676
li $t5, 0xb2a4be
sw $t5, 0($t3)
addi $t3, $t4, 14680
li $t5, 0x715d7b
sw $t5, 0($t3)
addi $t3, $t4, 14684
li $t5, 0x312128
sw $t5, 0($t3)
addi $t3, $t4, 14688
li $t5, 0x231314
sw $t5, 0($t3)
addi $t3, $t4, 14692
li $t5, 0x342022
sw $t5, 0($t3)
addi $t3, $t4, 14696
li $t5, 0x332123
sw $t5, 0($t3)
addi $t3, $t4, 14700
li $t5, 0x33191b
sw $t5, 0($t3)
addi $t3, $t4, 14704
li $t5, 0x2e191a
sw $t5, 0($t3)
addi $t3, $t4, 14708
li $t5, 0x312124
sw $t5, 0($t3)
addi $t3, $t4, 14712
li $t5, 0x331921
sw $t5, 0($t3)
addi $t3, $t4, 14716
li $t5, 0x3c1e22
sw $t5, 0($t3)
addi $t3, $t4, 14720
li $t5, 0x392025
sw $t5, 0($t3)
addi $t3, $t4, 14724
li $t5, 0x432d32
sw $t5, 0($t3)
addi $t3, $t4, 14728
li $t5, 0x412f32
sw $t5, 0($t3)
addi $t3, $t4, 14732
li $t5, 0x5d4d59
sw $t5, 0($t3)
addi $t3, $t4, 14736
li $t5, 0xcec3d1
sw $t5, 0($t3)
addi $t3, $t4, 14740
li $t5, 0xf7eff4
sw $t5, 0($t3)
addi $t3, $t4, 14744
li $t5, 0xe8dbe6
sw $t5, 0($t3)
addi $t3, $t4, 14748
li $t5, 0xf4f2f6
sw $t5, 0($t3)
addi $t3, $t4, 14752
li $t5, 0xfbfafb
sw $t5, 0($t3)
addi $t3, $t4, 14756
li $t5, 0xe2d8e5
sw $t5, 0($t3)
addi $t3, $t4, 14760
li $t5, 0xf3eff0
sw $t5, 0($t3)
addi $t3, $t4, 14764
li $t5, 0xfffefd
sw $t5, 0($t3)
addi $t3, $t4, 14768
li $t5, 0xfcfafc
sw $t5, 0($t3)
addi $t3, $t4, 14772
li $t5, 0xf6f1f6
sw $t5, 0($t3)
addi $t3, $t4, 14776
li $t5, 0xf2ebf7
sw $t5, 0($t3)
addi $t3, $t4, 14780
li $t5, 0xfaf7fc
sw $t5, 0($t3)
addi $t3, $t4, 14784
li $t5, 0xf7f3f8
sw $t5, 0($t3)
addi $t3, $t4, 14788
li $t5, 0xfcf5fd
sw $t5, 0($t3)
addi $t3, $t4, 14792
li $t5, 0xfaf3fb
sw $t5, 0($t3)
addi $t3, $t4, 14796
li $t5, 0xf8f1f9
sw $t5, 0($t3)
addi $t3, $t4, 14800
li $t5, 0xf6eff7
sw $t5, 0($t3)
addi $t3, $t4, 14804
li $t5, 0xf1ecf3
sw $t5, 0($t3)
addi $t3, $t4, 14808
li $t5, 0xdebcc7
sw $t5, 0($t3)
addi $t3, $t4, 14812
li $t5, 0xeee3ec
sw $t5, 0($t3)
addi $t3, $t4, 14816
li $t5, 0xf9f0fb
sw $t5, 0($t3)
addi $t3, $t4, 14820
li $t5, 0xe6d3ef
sw $t5, 0($t3)
addi $t3, $t4, 14824
li $t5, 0xb89caf
sw $t5, 0($t3)
addi $t3, $t4, 14828
li $t5, 0xd5afb3
sw $t5, 0($t3)
addi $t3, $t4, 14832
li $t5, 0xc1a9bb
sw $t5, 0($t3)
addi $t3, $t4, 14836
li $t5, 0xe1b0b0
sw $t5, 0($t3)
addi $t3, $t4, 14840
li $t5, 0xfcc0b7
sw $t5, 0($t3)
addi $t3, $t4, 14844
li $t5, 0xffc1b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 14848
sw $t5, 0($t3)
addi $t3, $t4, 14852
sw $t5, 0($t3)
addi $t3, $t4, 14856
sw $t5, 0($t3)
addi $t3, $t4, 14860
sw $t5, 0($t3)
addi $t3, $t4, 14864
sw $t5, 0($t3)
addi $t3, $t4, 14868
sw $t5, 0($t3)
addi $t3, $t4, 14872
sw $t5, 0($t3)
addi $t3, $t4, 14876
sw $t5, 0($t3)
addi $t3, $t4, 14880
li $t5, 0xc7a2bd
sw $t5, 0($t3)
addi $t3, $t4, 14884
li $t5, 0xddcde9
sw $t5, 0($t3)
addi $t3, $t4, 14888
li $t5, 0xf5e0f5
sw $t5, 0($t3)
addi $t3, $t4, 14892
li $t5, 0xdfc5cf
sw $t5, 0($t3)
addi $t3, $t4, 14896
li $t5, 0xece4f2
sw $t5, 0($t3)
addi $t3, $t4, 14900
li $t5, 0xeddff6
sw $t5, 0($t3)
addi $t3, $t4, 14904
li $t5, 0xe9cfe6
sw $t5, 0($t3)
addi $t3, $t4, 14908
li $t5, 0xe8b4b1
sw $t5, 0($t3)
addi $t3, $t4, 14912
li $t5, 0xd8c1cf
sw $t5, 0($t3)
addi $t3, $t4, 14916
li $t5, 0xe8cbe8
sw $t5, 0($t3)
addi $t3, $t4, 14920
li $t5, 0xf0d3ea
sw $t5, 0($t3)
addi $t3, $t4, 14924
li $t5, 0xc9b6d8
sw $t5, 0($t3)
addi $t3, $t4, 14928
li $t5, 0xc5c5d9
sw $t5, 0($t3)
addi $t3, $t4, 14932
li $t5, 0xb2aac6
sw $t5, 0($t3)
addi $t3, $t4, 14936
li $t5, 0x483b4a
sw $t5, 0($t3)
addi $t3, $t4, 14940
li $t5, 0x76675d
sw $t5, 0($t3)
addi $t3, $t4, 14944
li $t5, 0x31201f
sw $t5, 0($t3)
addi $t3, $t4, 14948
li $t5, 0x36212a
sw $t5, 0($t3)
addi $t3, $t4, 14952
li $t5, 0x342223
sw $t5, 0($t3)
addi $t3, $t4, 14956
li $t5, 0x2d1a1d
sw $t5, 0($t3)
addi $t3, $t4, 14960
li $t5, 0x352024
sw $t5, 0($t3)
addi $t3, $t4, 14964
li $t5, 0x392329
sw $t5, 0($t3)
addi $t3, $t4, 14968
li $t5, 0x372125
sw $t5, 0($t3)
addi $t3, $t4, 14972
li $t5, 0x331b21
sw $t5, 0($t3)
addi $t3, $t4, 14976
li $t5, 0x402b2f
sw $t5, 0($t3)
addi $t3, $t4, 14980
li $t5, 0x462d31
sw $t5, 0($t3)
addi $t3, $t4, 14984
li $t5, 0x412c31
sw $t5, 0($t3)
addi $t3, $t4, 14988
li $t5, 0x4e3b45
sw $t5, 0($t3)
addi $t3, $t4, 14992
li $t5, 0xddd1ea
sw $t5, 0($t3)
addi $t3, $t4, 14996
li $t5, 0xfdfbfd
sw $t5, 0($t3)
addi $t3, $t4, 15000
li $t5, 0xebd7e6
sw $t5, 0($t3)
addi $t3, $t4, 15004
li $t5, 0xf9f9f9
sw $t5, 0($t3)
addi $t3, $t4, 15008
li $t5, 0xfaf9f9
sw $t5, 0($t3)
addi $t3, $t4, 15012
li $t5, 0xf0e5ee
sw $t5, 0($t3)
addi $t3, $t4, 15016
li $t5, 0xede9ed
sw $t5, 0($t3)
addi $t3, $t4, 15020
li $t5, 0xfffefe
sw $t5, 0($t3)
addi $t3, $t4, 15024
li $t5, 0xfbf9fa
sw $t5, 0($t3)
addi $t3, $t4, 15028
li $t5, 0xeeebee
sw $t5, 0($t3)
addi $t3, $t4, 15032
li $t5, 0xf4edf6
sw $t5, 0($t3)
addi $t3, $t4, 15036
li $t5, 0xfefbfb
sw $t5, 0($t3)
addi $t3, $t4, 15040
li $t5, 0xf8f2f9
sw $t5, 0($t3)
addi $t3, $t4, 15044
li $t5, 0xfcf6fe
sw $t5, 0($t3)
addi $t3, $t4, 15048
li $t5, 0xfdf7fe
sw $t5, 0($t3)
addi $t3, $t4, 15052
li $t5, 0xf9f4fb
sw $t5, 0($t3)
addi $t3, $t4, 15056
sw $t5, 0($t3)
addi $t3, $t4, 15060
li $t5, 0xf7f1f9
sw $t5, 0($t3)
addi $t3, $t4, 15064
li $t5, 0xf0e5f2
sw $t5, 0($t3)
addi $t3, $t4, 15068
li $t5, 0xddcddb
sw $t5, 0($t3)
addi $t3, $t4, 15072
li $t5, 0xf9f4f7
sw $t5, 0($t3)
addi $t3, $t4, 15076
li $t5, 0xf7eef7
sw $t5, 0($t3)
addi $t3, $t4, 15080
li $t5, 0xe7d8f2
sw $t5, 0($t3)
addi $t3, $t4, 15084
li $t5, 0xc6aab9
sw $t5, 0($t3)
addi $t3, $t4, 15088
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 15092
li $t5, 0xf0b8b2
sw $t5, 0($t3)
addi $t3, $t4, 15096
li $t5, 0xd1a7a7
sw $t5, 0($t3)
addi $t3, $t4, 15100
li $t5, 0xe3afab
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 15104
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 15108
li $t5, 0xfec1b8
sw $t5, 0($t3)
addi $t3, $t4, 15112
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 15116
sw $t5, 0($t3)
addi $t3, $t4, 15120
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 15124
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 15128
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 15132
li $t5, 0xf5bbb2
sw $t5, 0($t3)
addi $t3, $t4, 15136
li $t5, 0xb99fd3
sw $t5, 0($t3)
addi $t3, $t4, 15140
li $t5, 0xe9dff6
sw $t5, 0($t3)
addi $t3, $t4, 15144
li $t5, 0xf1dff0
sw $t5, 0($t3)
addi $t3, $t4, 15148
li $t5, 0xe6bcb9
sw $t5, 0($t3)
addi $t3, $t4, 15152
li $t5, 0xefddee
sw $t5, 0($t3)
addi $t3, $t4, 15156
li $t5, 0xe6d8f5
sw $t5, 0($t3)
addi $t3, $t4, 15160
li $t5, 0xe8c4e9
sw $t5, 0($t3)
addi $t3, $t4, 15164
li $t5, 0xe0b3b9
sw $t5, 0($t3)
addi $t3, $t4, 15168
li $t5, 0xddaaaf
sw $t5, 0($t3)
addi $t3, $t4, 15172
li $t5, 0xe8cce7
sw $t5, 0($t3)
addi $t3, $t4, 15176
li $t5, 0xeccfea
sw $t5, 0($t3)
addi $t3, $t4, 15180
li $t5, 0xd2b1d3
sw $t5, 0($t3)
addi $t3, $t4, 15184
li $t5, 0xc7bee0
sw $t5, 0($t3)
addi $t3, $t4, 15188
li $t5, 0xbaa8ce
sw $t5, 0($t3)
addi $t3, $t4, 15192
li $t5, 0x47394c
sw $t5, 0($t3)
addi $t3, $t4, 15196
li $t5, 0xae9e82
sw $t5, 0($t3)
addi $t3, $t4, 15200
li $t5, 0x392721
sw $t5, 0($t3)
addi $t3, $t4, 15204
li $t5, 0x382127
sw $t5, 0($t3)
addi $t3, $t4, 15208
li $t5, 0x43312c
sw $t5, 0($t3)
addi $t3, $t4, 15212
li $t5, 0x7a6a5c
sw $t5, 0($t3)
addi $t3, $t4, 15216
li $t5, 0x3c2228
sw $t5, 0($t3)
addi $t3, $t4, 15220
li $t5, 0x3c2529
sw $t5, 0($t3)
addi $t3, $t4, 15224
li $t5, 0x3e282c
sw $t5, 0($t3)
addi $t3, $t4, 15228
li $t5, 0x44322d
sw $t5, 0($t3)
addi $t3, $t4, 15232
li $t5, 0x432b32
sw $t5, 0($t3)
addi $t3, $t4, 15236
li $t5, 0x493036
sw $t5, 0($t3)
addi $t3, $t4, 15240
li $t5, 0x483335
sw $t5, 0($t3)
addi $t3, $t4, 15244
li $t5, 0x503747
sw $t5, 0($t3)
addi $t3, $t4, 15248
li $t5, 0xdcc9e8
sw $t5, 0($t3)
addi $t3, $t4, 15252
li $t5, 0xfcfafc
sw $t5, 0($t3)
addi $t3, $t4, 15256
li $t5, 0xe7dbe6
sw $t5, 0($t3)
addi $t3, $t4, 15260
li $t5, 0xfdfdfd
sw $t5, 0($t3)
addi $t3, $t4, 15264
li $t5, 0xf2f3f4
sw $t5, 0($t3)
addi $t3, $t4, 15268
li $t5, 0xf5e9f6
sw $t5, 0($t3)
addi $t3, $t4, 15272
li $t5, 0xf8f6f8
sw $t5, 0($t3)
addi $t3, $t4, 15276
li $t5, 0xffffff
sw $t5, 0($t3)
addi $t3, $t4, 15280
li $t5, 0xf7f2f7
sw $t5, 0($t3)
addi $t3, $t4, 15284
li $t5, 0xe0d8e1
sw $t5, 0($t3)
addi $t3, $t4, 15288
li $t5, 0xf6f1f7
sw $t5, 0($t3)
addi $t3, $t4, 15292
li $t5, 0xfcfbfa
sw $t5, 0($t3)
addi $t3, $t4, 15296
li $t5, 0xf8f6f8
sw $t5, 0($t3)
addi $t3, $t4, 15300
li $t5, 0xfcf8f8
sw $t5, 0($t3)
addi $t3, $t4, 15304
li $t5, 0xfdf9fe
sw $t5, 0($t3)
addi $t3, $t4, 15308
li $t5, 0xfbf6fd
sw $t5, 0($t3)
addi $t3, $t4, 15312
li $t5, 0xfbf7fd
sw $t5, 0($t3)
addi $t3, $t4, 15316
li $t5, 0xfaf5fc
sw $t5, 0($t3)
addi $t3, $t4, 15320
li $t5, 0xfbf2fb
sw $t5, 0($t3)
addi $t3, $t4, 15324
li $t5, 0xe5dae7
sw $t5, 0($t3)
addi $t3, $t4, 15328
li $t5, 0xfaf1f9
sw $t5, 0($t3)
addi $t3, $t4, 15332
li $t5, 0xfbf9f8
sw $t5, 0($t3)
addi $t3, $t4, 15336
li $t5, 0xf8eff9
sw $t5, 0($t3)
addi $t3, $t4, 15340
li $t5, 0xe2d7e6
sw $t5, 0($t3)
addi $t3, $t4, 15344
li $t5, 0xe1b7c1
sw $t5, 0($t3)
addi $t3, $t4, 15348
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 15352
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 15356
li $t5, 0xfec2b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 15360
li $t5, 0xffc2b7
sw $t5, 0($t3)
addi $t3, $t4, 15364
li $t5, 0xffc0b7
sw $t5, 0($t3)
addi $t3, $t4, 15368
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 15372
sw $t5, 0($t3)
addi $t3, $t4, 15376
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 15380
sw $t5, 0($t3)
addi $t3, $t4, 15384
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 15388
li $t5, 0xd3a3b0
sw $t5, 0($t3)
addi $t3, $t4, 15392
li $t5, 0xd2bde6
sw $t5, 0($t3)
addi $t3, $t4, 15396
li $t5, 0xf4effd
sw $t5, 0($t3)
addi $t3, $t4, 15400
li $t5, 0xe8d2e3
sw $t5, 0($t3)
addi $t3, $t4, 15404
li $t5, 0xaf8397
sw $t5, 0($t3)
addi $t3, $t4, 15408
li $t5, 0xf1dcef
sw $t5, 0($t3)
addi $t3, $t4, 15412
li $t5, 0xddc8e7
sw $t5, 0($t3)
addi $t3, $t4, 15416
li $t5, 0xe1c4e7
sw $t5, 0($t3)
addi $t3, $t4, 15420
li $t5, 0xd3aabf
sw $t5, 0($t3)
addi $t3, $t4, 15424
li $t5, 0xfbbeb6
sw $t5, 0($t3)
addi $t3, $t4, 15428
li $t5, 0xc6a2c6
sw $t5, 0($t3)
addi $t3, $t4, 15432
li $t5, 0xf1d8ef
sw $t5, 0($t3)
addi $t3, $t4, 15436
li $t5, 0xeacae5
sw $t5, 0($t3)
addi $t3, $t4, 15440
li $t5, 0xcebfe5
sw $t5, 0($t3)
addi $t3, $t4, 15444
li $t5, 0xa99bc5
sw $t5, 0($t3)
addi $t3, $t4, 15448
li $t5, 0x80728e
sw $t5, 0($t3)
addi $t3, $t4, 15452
li $t5, 0x938a80
sw $t5, 0($t3)
addi $t3, $t4, 15456
li $t5, 0x392827
sw $t5, 0($t3)
addi $t3, $t4, 15460
li $t5, 0x392426
sw $t5, 0($t3)
addi $t3, $t4, 15464
li $t5, 0x4e3932
sw $t5, 0($t3)
addi $t3, $t4, 15468
li $t5, 0x96856e
sw $t5, 0($t3)
addi $t3, $t4, 15472
li $t5, 0x3e242a
sw $t5, 0($t3)
addi $t3, $t4, 15476
li $t5, 0x3d2729
sw $t5, 0($t3)
addi $t3, $t4, 15480
li $t5, 0x6d5b4f
sw $t5, 0($t3)
addi $t3, $t4, 15484
li $t5, 0x90816d
sw $t5, 0($t3)
addi $t3, $t4, 15488
li $t5, 0x472c33
sw $t5, 0($t3)
addi $t3, $t4, 15492
li $t5, 0x4a3136
sw $t5, 0($t3)
addi $t3, $t4, 15496
li $t5, 0x8f7f70
sw $t5, 0($t3)
addi $t3, $t4, 15500
li $t5, 0x52423f
sw $t5, 0($t3)
addi $t3, $t4, 15504
li $t5, 0x9f93aa
sw $t5, 0($t3)
addi $t3, $t4, 15508
li $t5, 0xf7f9fb
sw $t5, 0($t3)
addi $t3, $t4, 15512
li $t5, 0xefebec
sw $t5, 0($t3)
addi $t3, $t4, 15516
li $t5, 0xfaf6fa
sw $t5, 0($t3)
addi $t3, $t4, 15520
li $t5, 0xf7f8f8
sw $t5, 0($t3)
addi $t3, $t4, 15524
li $t5, 0xf4ecf5
sw $t5, 0($t3)
addi $t3, $t4, 15528
li $t5, 0xfefdfe
sw $t5, 0($t3)
addi $t3, $t4, 15532
li $t5, 0xfcfbfc
sw $t5, 0($t3)
addi $t3, $t4, 15536
li $t5, 0xf1ecf1
sw $t5, 0($t3)
addi $t3, $t4, 15540
li $t5, 0xeee8ee
sw $t5, 0($t3)
addi $t3, $t4, 15544
li $t5, 0xf5f2f6
sw $t5, 0($t3)
addi $t3, $t4, 15548
li $t5, 0xfcfbfd
sw $t5, 0($t3)
addi $t3, $t4, 15552
li $t5, 0xfbf4fb
sw $t5, 0($t3)
addi $t3, $t4, 15556
li $t5, 0xf6f5f0
sw $t5, 0($t3)
addi $t3, $t4, 15560
li $t5, 0xfbfafc
sw $t5, 0($t3)
addi $t3, $t4, 15564
li $t5, 0xfbfbfd
sw $t5, 0($t3)
addi $t3, $t4, 15568
sw $t5, 0($t3)
addi $t3, $t4, 15572
li $t5, 0xfcf8fc
sw $t5, 0($t3)
addi $t3, $t4, 15576
li $t5, 0xfcf5fc
sw $t5, 0($t3)
addi $t3, $t4, 15580
li $t5, 0xf9f5fc
sw $t5, 0($t3)
addi $t3, $t4, 15584
li $t5, 0xebe2ee
sw $t5, 0($t3)
addi $t3, $t4, 15588
li $t5, 0xfcf9f8
sw $t5, 0($t3)
addi $t3, $t4, 15592
li $t5, 0xf5f6f2
sw $t5, 0($t3)
addi $t3, $t4, 15596
li $t5, 0xf5f3f6
sw $t5, 0($t3)
addi $t3, $t4, 15600
li $t5, 0xf5ebf7
sw $t5, 0($t3)
addi $t3, $t4, 15604
li $t5, 0xf1cccf
sw $t5, 0($t3)
addi $t3, $t4, 15608
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 15612
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 15616
li $t5, 0xfec2b7
sw $t5, 0($t3)
addi $t3, $t4, 15620
li $t5, 0xfdc4ba
sw $t5, 0($t3)
addi $t3, $t4, 15624
li $t5, 0xfcc4ba
sw $t5, 0($t3)
addi $t3, $t4, 15628
li $t5, 0xfdc3ba
sw $t5, 0($t3)
addi $t3, $t4, 15632
li $t5, 0xfbc4bb
sw $t5, 0($t3)
addi $t3, $t4, 15636
li $t5, 0xfbc3bb
sw $t5, 0($t3)
addi $t3, $t4, 15640
li $t5, 0xf8c2b7
sw $t5, 0($t3)
addi $t3, $t4, 15644
li $t5, 0xbb99c6
sw $t5, 0($t3)
addi $t3, $t4, 15648
li $t5, 0xebdff6
sw $t5, 0($t3)
addi $t3, $t4, 15652
li $t5, 0xfbfcfd
sw $t5, 0($t3)
addi $t3, $t4, 15656
li $t5, 0xead2e9
sw $t5, 0($t3)
addi $t3, $t4, 15660
li $t5, 0xae8fbc
sw $t5, 0($t3)
addi $t3, $t4, 15664
li $t5, 0xd9c0d2
sw $t5, 0($t3)
addi $t3, $t4, 15668
li $t5, 0xe3cbe6
sw $t5, 0($t3)
addi $t3, $t4, 15672
li $t5, 0xdcc0e6
sw $t5, 0($t3)
addi $t3, $t4, 15676
li $t5, 0xb18eae
sw $t5, 0($t3)
addi $t3, $t4, 15680
li $t5, 0xefb5af
sw $t5, 0($t3)
addi $t3, $t4, 15684
li $t5, 0xba8ca8
sw $t5, 0($t3)
addi $t3, $t4, 15688
li $t5, 0xe9cae5
sw $t5, 0($t3)
addi $t3, $t4, 15692
li $t5, 0xf8e3f3
sw $t5, 0($t3)
addi $t3, $t4, 15696
li $t5, 0xd9bcdc
sw $t5, 0($t3)
addi $t3, $t4, 15700
li $t5, 0xbcacd0
sw $t5, 0($t3)
addi $t3, $t4, 15704
li $t5, 0x9c85b1
sw $t5, 0($t3)
addi $t3, $t4, 15708
li $t5, 0x747d8c
sw $t5, 0($t3)
addi $t3, $t4, 15712
li $t5, 0x4f4b51
sw $t5, 0($t3)
addi $t3, $t4, 15716
li $t5, 0x372225
sw $t5, 0($t3)
addi $t3, $t4, 15720
li $t5, 0x321d23
sw $t5, 0($t3)
addi $t3, $t4, 15724
li $t5, 0x362423
sw $t5, 0($t3)
addi $t3, $t4, 15728
li $t5, 0x301c1e
sw $t5, 0($t3)
addi $t3, $t4, 15732
li $t5, 0x301e22
sw $t5, 0($t3)
addi $t3, $t4, 15736
li $t5, 0x382625
sw $t5, 0($t3)
addi $t3, $t4, 15740
li $t5, 0x64564f
sw $t5, 0($t3)
addi $t3, $t4, 15744
li $t5, 0x382227
sw $t5, 0($t3)
addi $t3, $t4, 15748
li $t5, 0x402b30
sw $t5, 0($t3)
addi $t3, $t4, 15752
li $t5, 0x715e58
sw $t5, 0($t3)
addi $t3, $t4, 15756
li $t5, 0x574042
sw $t5, 0($t3)
addi $t3, $t4, 15760
li $t5, 0x7a627c
sw $t5, 0($t3)
addi $t3, $t4, 15764
li $t5, 0xf7f3f8
sw $t5, 0($t3)
addi $t3, $t4, 15768
li $t5, 0xfdfafc
sw $t5, 0($t3)
addi $t3, $t4, 15772
li $t5, 0xf6ecf5
sw $t5, 0($t3)
addi $t3, $t4, 15776
li $t5, 0xfcfcfd
sw $t5, 0($t3)
addi $t3, $t4, 15780
li $t5, 0xeee7eb
sw $t5, 0($t3)
addi $t3, $t4, 15784
li $t5, 0xfefdfe
sw $t5, 0($t3)
addi $t3, $t4, 15788
li $t5, 0xe9e0e7
sw $t5, 0($t3)
addi $t3, $t4, 15792
li $t5, 0xebe9ea
sw $t5, 0($t3)
addi $t3, $t4, 15796
li $t5, 0xf9f4f9
sw $t5, 0($t3)
addi $t3, $t4, 15800
li $t5, 0xf6f1f6
sw $t5, 0($t3)
addi $t3, $t4, 15804
li $t5, 0xf8f6f7
sw $t5, 0($t3)
addi $t3, $t4, 15808
li $t5, 0xfbf3fc
sw $t5, 0($t3)
addi $t3, $t4, 15812
li $t5, 0xf4f5f2
sw $t5, 0($t3)
addi $t3, $t4, 15816
li $t5, 0xf7f5f7
sw $t5, 0($t3)
addi $t3, $t4, 15820
li $t5, 0xfefbfd
sw $t5, 0($t3)
addi $t3, $t4, 15824
li $t5, 0xfef9fd
sw $t5, 0($t3)
addi $t3, $t4, 15828
li $t5, 0xfdf9fe
sw $t5, 0($t3)
addi $t3, $t4, 15832
li $t5, 0xfcfcfd
sw $t5, 0($t3)
addi $t3, $t4, 15836
li $t5, 0xf8fafb
sw $t5, 0($t3)
addi $t3, $t4, 15840
li $t5, 0xe8e6eb
sw $t5, 0($t3)
addi $t3, $t4, 15844
li $t5, 0xf7f4f6
sw $t5, 0($t3)
addi $t3, $t4, 15848
li $t5, 0xf2f3ef
sw $t5, 0($t3)
addi $t3, $t4, 15852
li $t5, 0xe2dbe0
sw $t5, 0($t3)
addi $t3, $t4, 15856
li $t5, 0xfcfbfb
sw $t5, 0($t3)
addi $t3, $t4, 15860
li $t5, 0xf5eaf4
sw $t5, 0($t3)
addi $t3, $t4, 15864
li $t5, 0xf1d3d2
sw $t5, 0($t3)
addi $t3, $t4, 15868
li $t5, 0xffc1b8
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 15872
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 15876
li $t5, 0xfbd2cb
sw $t5, 0($t3)
addi $t3, $t4, 15880
li $t5, 0xf8d5d0
sw $t5, 0($t3)
addi $t3, $t4, 15884
li $t5, 0xf7d6d0
sw $t5, 0($t3)
addi $t3, $t4, 15888
li $t5, 0xf4d3cd
sw $t5, 0($t3)
addi $t3, $t4, 15892
li $t5, 0xf6d4cd
sw $t5, 0($t3)
addi $t3, $t4, 15896
li $t5, 0xb596a7
sw $t5, 0($t3)
addi $t3, $t4, 15900
li $t5, 0xd8b9e2
sw $t5, 0($t3)
addi $t3, $t4, 15904
li $t5, 0xf8f2fb
sw $t5, 0($t3)
addi $t3, $t4, 15908
li $t5, 0xfdfefe
sw $t5, 0($t3)
addi $t3, $t4, 15912
li $t5, 0xfaf3f9
sw $t5, 0($t3)
addi $t3, $t4, 15916
li $t5, 0xdccde4
sw $t5, 0($t3)
addi $t3, $t4, 15920
li $t5, 0xcaaece
sw $t5, 0($t3)
addi $t3, $t4, 15924
li $t5, 0xf2d3e9
sw $t5, 0($t3)
addi $t3, $t4, 15928
li $t5, 0xdab2d8
sw $t5, 0($t3)
addi $t3, $t4, 15932
li $t5, 0xa885a7
sw $t5, 0($t3)
addi $t3, $t4, 15936
li $t5, 0xd4a3ab
sw $t5, 0($t3)
addi $t3, $t4, 15940
li $t5, 0xdfa8aa
sw $t5, 0($t3)
addi $t3, $t4, 15944
li $t5, 0xc8a2cc
sw $t5, 0($t3)
addi $t3, $t4, 15948
li $t5, 0xf5e4f3
sw $t5, 0($t3)
addi $t3, $t4, 15952
li $t5, 0xe1ccdd
sw $t5, 0($t3)
addi $t3, $t4, 15956
li $t5, 0xafb0bd
sw $t5, 0($t3)
addi $t3, $t4, 15960
li $t5, 0x836d89
sw $t5, 0($t3)
addi $t3, $t4, 15964
li $t5, 0x837390
sw $t5, 0($t3)
addi $t3, $t4, 15968
li $t5, 0x535057
sw $t5, 0($t3)
addi $t3, $t4, 15972
li $t5, 0x2f1f1f
sw $t5, 0($t3)
addi $t3, $t4, 15976
li $t5, 0x261619
sw $t5, 0($t3)
addi $t3, $t4, 15980
li $t5, 0x26151b
sw $t5, 0($t3)
addi $t3, $t4, 15984
li $t5, 0x271717
sw $t5, 0($t3)
addi $t3, $t4, 15988
li $t5, 0x27171c
sw $t5, 0($t3)
addi $t3, $t4, 15992
li $t5, 0x29171b
sw $t5, 0($t3)
addi $t3, $t4, 15996
li $t5, 0x2d1a1b
sw $t5, 0($t3)
addi $t3, $t4, 16000
li $t5, 0x2f1c20
sw $t5, 0($t3)
addi $t3, $t4, 16004
li $t5, 0x322026
sw $t5, 0($t3)
addi $t3, $t4, 16008
li $t5, 0x3a282a
sw $t5, 0($t3)
addi $t3, $t4, 16012
li $t5, 0x473036
sw $t5, 0($t3)
addi $t3, $t4, 16016
li $t5, 0x756075
sw $t5, 0($t3)
addi $t3, $t4, 16020
li $t5, 0xe3dbe6
sw $t5, 0($t3)
addi $t3, $t4, 16024
li $t5, 0xfefefd
sw $t5, 0($t3)
addi $t3, $t4, 16028
li $t5, 0xf8f0f7
sw $t5, 0($t3)
addi $t3, $t4, 16032
li $t5, 0xfdfafe
sw $t5, 0($t3)
addi $t3, $t4, 16036
li $t5, 0xf7f5f7
sw $t5, 0($t3)
addi $t3, $t4, 16040
li $t5, 0xfefefe
sw $t5, 0($t3)
addi $t3, $t4, 16044
li $t5, 0xeeeaee
sw $t5, 0($t3)
addi $t3, $t4, 16048
li $t5, 0xddd3e0
sw $t5, 0($t3)
addi $t3, $t4, 16052
li $t5, 0xfcfafc
sw $t5, 0($t3)
addi $t3, $t4, 16056
li $t5, 0xf2edf2
sw $t5, 0($t3)
addi $t3, $t4, 16060
li $t5, 0xf7f6f5
sw $t5, 0($t3)
addi $t3, $t4, 16064
li $t5, 0xfbf3fc
sw $t5, 0($t3)
addi $t3, $t4, 16068
li $t5, 0xfcf8f9
sw $t5, 0($t3)
addi $t3, $t4, 16072
li $t5, 0xedecec
sw $t5, 0($t3)
addi $t3, $t4, 16076
li $t5, 0xfcfbfd
sw $t5, 0($t3)
addi $t3, $t4, 16080
li $t5, 0xf1eff4
sw $t5, 0($t3)
addi $t3, $t4, 16084
li $t5, 0xfcf9fd
sw $t5, 0($t3)
addi $t3, $t4, 16088
li $t5, 0xfbf8f9
sw $t5, 0($t3)
addi $t3, $t4, 16092
li $t5, 0xf9f6fa
sw $t5, 0($t3)
addi $t3, $t4, 16096
li $t5, 0xf8f3fa
sw $t5, 0($t3)
addi $t3, $t4, 16100
li $t5, 0xf3f2f1
sw $t5, 0($t3)
addi $t3, $t4, 16104
li $t5, 0xf9f8f6
sw $t5, 0($t3)
addi $t3, $t4, 16108
li $t5, 0xf2eef3
sw $t5, 0($t3)
addi $t3, $t4, 16112
li $t5, 0xe4cdd4
sw $t5, 0($t3)
addi $t3, $t4, 16116
li $t5, 0xf5eff0
sw $t5, 0($t3)
addi $t3, $t4, 16120
li $t5, 0xf9f4f8
sw $t5, 0($t3)
addi $t3, $t4, 16124
li $t5, 0xefdadc
sw $t5, 0($t3)
syscall      # sleeps for 30 ms
addi $t3, $t4, 16128
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 16132
li $t5, 0xffc1b8
sw $t5, 0($t3)
addi $t3, $t4, 16136
li $t5, 0xfec2b8
sw $t5, 0($t3)
addi $t3, $t4, 16140
li $t5, 0xfdc3b9
sw $t5, 0($t3)
addi $t3, $t4, 16144
li $t5, 0xfdc2b9
sw $t5, 0($t3)
addi $t3, $t4, 16148
li $t5, 0xf1b8b0
sw $t5, 0($t3)
addi $t3, $t4, 16152
li $t5, 0xc59ec3
sw $t5, 0($t3)
addi $t3, $t4, 16156
li $t5, 0xeddcef
sw $t5, 0($t3)
addi $t3, $t4, 16160
li $t5, 0xf7e8f8
sw $t5, 0($t3)
addi $t3, $t4, 16164
li $t5, 0xf3e9f7
sw $t5, 0($t3)
addi $t3, $t4, 16168
li $t5, 0xfaf2f9
sw $t5, 0($t3)
addi $t3, $t4, 16172
li $t5, 0xf2e6f7
sw $t5, 0($t3)
addi $t3, $t4, 16176
li $t5, 0xc8a4d4
sw $t5, 0($t3)
addi $t3, $t4, 16180
li $t5, 0xe2b5da
sw $t5, 0($t3)
addi $t3, $t4, 16184
li $t5, 0xdcacd5
sw $t5, 0($t3)
addi $t3, $t4, 16188
li $t5, 0xc79fc5
sw $t5, 0($t3)
addi $t3, $t4, 16192
li $t5, 0x856273
sw $t5, 0($t3)
addi $t3, $t4, 16196
li $t5, 0xf3b9b0
sw $t5, 0($t3)
addi $t3, $t4, 16200
li $t5, 0xb488ac
sw $t5, 0($t3)
addi $t3, $t4, 16204
li $t5, 0xebd4ec
sw $t5, 0($t3)
addi $t3, $t4, 16208
li $t5, 0xe2dae2
sw $t5, 0($t3)
addi $t3, $t4, 16212
li $t5, 0x959095
sw $t5, 0($t3)
addi $t3, $t4, 16216
li $t5, 0x8e7d7d
sw $t5, 0($t3)
addi $t3, $t4, 16220
li $t5, 0x997ba3
sw $t5, 0($t3)
addi $t3, $t4, 16224
li $t5, 0x6b5c6a
sw $t5, 0($t3)
addi $t3, $t4, 16228
li $t5, 0x39272c
sw $t5, 0($t3)
addi $t3, $t4, 16232
li $t5, 0x281818
sw $t5, 0($t3)
addi $t3, $t4, 16236
sw $t5, 0($t3)
addi $t3, $t4, 16240
li $t5, 0x29191a
sw $t5, 0($t3)
addi $t3, $t4, 16244
li $t5, 0x29191b
sw $t5, 0($t3)
addi $t3, $t4, 16248
li $t5, 0x2b171b
sw $t5, 0($t3)
addi $t3, $t4, 16252
li $t5, 0x2f1a1d
sw $t5, 0($t3)
addi $t3, $t4, 16256
li $t5, 0x311c21
sw $t5, 0($t3)
addi $t3, $t4, 16260
li $t5, 0x352125
sw $t5, 0($t3)
addi $t3, $t4, 16264
li $t5, 0x3f2b2d
sw $t5, 0($t3)
addi $t3, $t4, 16268
li $t5, 0x553b3e
sw $t5, 0($t3)
addi $t3, $t4, 16272
li $t5, 0x6a5556
sw $t5, 0($t3)
addi $t3, $t4, 16276
li $t5, 0x998a9e
sw $t5, 0($t3)
addi $t3, $t4, 16280
li $t5, 0xe9e4ec
sw $t5, 0($t3)
addi $t3, $t4, 16284
li $t5, 0xfdf6fc
sw $t5, 0($t3)
addi $t3, $t4, 16288
li $t5, 0xfdf5fb
sw $t5, 0($t3)
addi $t3, $t4, 16292
li $t5, 0xfbfcfa
sw $t5, 0($t3)
addi $t3, $t4, 16296
li $t5, 0xf7f6f5
sw $t5, 0($t3)
addi $t3, $t4, 16300
li $t5, 0xf0ebf0
sw $t5, 0($t3)
addi $t3, $t4, 16304
li $t5, 0xf5f3f5
sw $t5, 0($t3)
addi $t3, $t4, 16308
li $t5, 0xf2ecef
sw $t5, 0($t3)
addi $t3, $t4, 16312
li $t5, 0xfaf8fa
sw $t5, 0($t3)
addi $t3, $t4, 16316
li $t5, 0xedeaec
sw $t5, 0($t3)
addi $t3, $t4, 16320
li $t5, 0xf3f1f3
sw $t5, 0($t3)
addi $t3, $t4, 16324
li $t5, 0xfbf2fc
sw $t5, 0($t3)
addi $t3, $t4, 16328
li $t5, 0xf5f3f4
sw $t5, 0($t3)
addi $t3, $t4, 16332
li $t5, 0xf7f6f7
sw $t5, 0($t3)
addi $t3, $t4, 16336
li $t5, 0xf6f9f6
sw $t5, 0($t3)
addi $t3, $t4, 16340
li $t5, 0xfbf9fb
sw $t5, 0($t3)
addi $t3, $t4, 16344
li $t5, 0xfdf8fc
sw $t5, 0($t3)
addi $t3, $t4, 16348
li $t5, 0xf9f9fa
sw $t5, 0($t3)
addi $t3, $t4, 16352
li $t5, 0xf9eefb
sw $t5, 0($t3)
addi $t3, $t4, 16356
li $t5, 0xf9f9fa
sw $t5, 0($t3)
addi $t3, $t4, 16360
li $t5, 0xfcfafa
sw $t5, 0($t3)
addi $t3, $t4, 16364
li $t5, 0xfdfcfb
sw $t5, 0($t3)
addi $t3, $t4, 16368
li $t5, 0xf7eaf9
sw $t5, 0($t3)
addi $t3, $t4, 16372
li $t5, 0xe4dbdc
sw $t5, 0($t3)
addi $t3, $t4, 16376
li $t5, 0xd7c8cb
sw $t5, 0($t3)
addi $t3, $t4, 16380
li $t5, 0xf4eff4
sw $t5, 0($t3)
syscall      # sleeps for 30 ms

Title_Loop:
li $t9, 0xffff0000			# keyboard
	lw $t8, 0($t9)
	beq $t8, 1, Title_Loop_KeyPressed
	Title_Loop_Sleep:
		li $v0, 32		# sleeps before looping
		li $a0, REFRESH_RATE
		syscall
		j Title_Loop
	
	Title_Loop_KeyPressed:		# checks key pressed
		lw $t4, 4($t9)
		beq $t4, 112, pPressed
		j Title_Loop

Begin:
	li $t0, 0
	li $t5, BACKGROUND_COLOR
	
	# Calculates the beginning position of the player and stores it in $t1
	li $t2, CANVAS_WIDTH
	li $t1, CANVAS_HEIGHT
	subi $t1, $t1, 3 
	mult $t1, $t2 		# CANVAS_WIDTH * (CANVAS_HEIGHT - 3) in $t1
	mflo $t1
	sra $t2, $t2, 1 	# CANVAS_WIDTH // 2
	sub $t1, $t1, $t2 	# (CANVAS_WIDTH * (CANVAS_HEIGHT - 3)) - (CANVAS_WIDTH // 2)
	
	jal DrawCanvas
	jal DrawPlayer
	
	# Initalizing Obstacles
	li $v0, 42
	li $a1, CANVAS_WIDTH
	subi $a1, $a1, 4 		# generate random number minus the border
	li $t4, 0
	li $t5, MAX_OBSTACLES
	la $t2, Obstacles 		# address of Obstacles array in $t2
	InitObstacles_Loop:
		bge $t4, $t5, InitObstacles_LoopEnd 	# Loops MAX_OBSTACLES times
		li $t3, -1
		sw $t3, 0($t2)				# Store random number, then increment loop and address
		addi $t2, $t2, 4
		addi $t4, $t4, 1
		j InitObstacles_Loop
	InitObstacles_LoopEnd:
		j MainLoop_Begin
	
DrawCanvas:
	li $t5, BACKGROUND_COLOR
	li $t2, CANVAS_WIDTH
	li $t3, CANVAS_HEIGHT
	mult $t3, $t2 			# CANVAS_WIDTH * CANVAS_HEIGHT 
	mflo $t2
	li $t3, 4
	mult $t2,$t3 			# CANVAS_WIDTH * CANVAS_HEIGHT * 4
	mflo $t3
	
	addi $t2, $zero, BASE_ADDRESS 	# t2 = address
	addi $t3, $t3, BASE_ADDRESS 	# t3 = address + CANVAS_WIDTH * CANVAS_HEIGHT * 4
	
	DrawCanvas_Loop:		# Draws every pixel in the canvas
		beq $t2, $t3, DrawCanvas_End
		sw $t5, 0($t2)
		addi $t2, $t2, 4
		j DrawCanvas_Loop 
	
	DrawCanvas_End:
		jr $ra

DrawPlayer:
	li $t5, PLAYER_BODY
	li $t6, CANVAS_WIDTH
	li $t3, CANVAS_HEIGHT
	mult $t6, $t3
	mflo $t7 				# width * height in $t7
	
	li $t3, 4
	add $t4, $zero, $t1 			# get value of array
	subi $t4, $t4, CANVAS_WIDTH 		# location - width
	subi $t4, $t4, CANVAS_WIDTH 		# location - 2*width
	subi $t4, $t4, 2 			# location - 2*width - 2
	bltz $t4, DrawPlayer_If 		# branch if not a valid location
	j DrawPlayer_Else
	DrawPlayer_If:				# starts at top of player
		addi $t4, $t4, CANVAS_WIDTH
		j DrawPlayer_After
	DrawPlayer_Else:
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS	# start hardcoding pixels to draw
		addi $t4, $t4, 4
		sw $t5, 0($t4) 
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		add $t4, $zero, $t1 
		subi $t4, $t4, CANVAS_WIDTH 
		subi $t4, $t4, 2 		# Get current position to next row
	DrawPlayer_After:
		bltz $t4, DrawPlayer_After2 	# branch if not a valid location
		j DrawPlayer_Else2
	DrawPlayer_Else2:
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS	# start hardcoding pixels to draw
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
		subi $t4, $t4, 12
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
	DrawPlayer_After2:
		add $t4, $zero, $t1
		subi $t4, $t4, 3 
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS	# start hardcoding pixels to draw
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		li $t5, PLAYER_EYE
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
		subi $t4, $t4, 4
		li $t5, PLAYER_BODY
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
	
		add $t4, $zero, $t1
		addi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 2
		bgt $t4,$t7, DrawPlayer_After3	# branch if not a valid location
		j DrawPlayer_Else3
	DrawPlayer_Else3:
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS	# start hardcoding pixels to draw
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		li $t5, PLAYER_EYE
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		li $t5, PLAYER_BODY
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		li $t5, PLAYER_EYE
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		li $t5, PLAYER_BODY
		sw $t5, 0($t4)
	DrawPlayer_After3:
		add $t4, $zero, $t1
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 2
		bgt $t4,$t7, DrawPlayer_After4 	# branch if not a valid location
		j DrawPlayer_Else4
	DrawPlayer_Else4:
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS	# start hardcoding pixels to draw
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
	DrawPlayer_After4:
		jr $ra

DrawLives: 
	li $t2, CANVAS_WIDTH
	li $t3, CANVAS_HEIGHT 
	subi $t3, $t3,  4
	mult $t3, $t2 				# CANVAS_WIDTH * (CANVAS_HEIGHT -2)
	mflo $t2
	li $t3, 4
	mult $t2, $t3 				# CANVAS_WIDTH * (CANVAS_HEIGHT - 2) * 4
	mflo $t4
	addi $t4, $t4, BASE_ADDRESS
	addi $t4,  $t4, 12  			# CANVAS_WIDTH * (CANVAS_HEIGHT - 2) * 4 + 8

	la $t2, Lives 				# address of lives array in $t2
	lw $t2, 0($t2)
	li $t3, 0
	li $t5, LIVES_COLOR

	DrawLives_Loop:
		bge $t3, $t2 DrawLives_End	# loops until no lifes are left
		subi $t4, $t4, CANVAS_WIDTH	# start hardcoding pixels to draw
		subi $t4, $t4, CANVAS_WIDTH	
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 12
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 16
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 12
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 4
		sw $t5, 0($t4)
		
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, 24
		addi $t3, $t3, 1
		j DrawLives_Loop
	DrawLives_End:
		jr $ra

DrawObstacles:
	la $t2, Obstacles
	li $t8, 0
DrawObstacles_Loop:
	la $t3, Num_Obstacles				# get number of obstacles
	lw $t3, 0($t3)
	bge $t8, $t3 DrawObstacles_LoopEnd 		# loops Num_Obstacles number of times
	
	li $t6, CANVAS_WIDTH
	li $t3, CANVAS_HEIGHT
	mult $t6, $t3
	mflo $t7 					# width * height in $t7
	
	li $t3, -1
	lw $t4, 0($t2) 					# get value of array
	beq $t4, $t3, DrawObstacles_DontDraw 		# don't draw if value is -1
	j DrawObstacles_Draw
	DrawObstacles_DontDraw:
		addi $t2, $t2, 4			# increment address and array
		addi $t8, $t8, 1
		j DrawObstacles_Loop
	DrawObstacles_Draw:
	li $t3, 4
	subi $t4, $t4, CANVAS_WIDTH 			# location - width
	subi $t4, $t4, CANVAS_WIDTH 			# location - 2*width
	subi $t4, $t4, 2 				# location - 2*width - 2
	subi $t4, $t4, CANVAS_WIDTH 			# location - 3*width - 2
	bltz $t4, DrawObstacles_If0			# branch if not a valid location
	j DrawObstacles_Else0				# erases previous location
	DrawObstacles_If0:
		j DrawObstacles_After0
	DrawObstacles_Else0:				# erase previous location
		mult $t4, $t3
		mflo $t4 				# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS
		li $t5, BACKGROUND_COLOR
		sw $t5, 0($t4) 
		addi $t4, $t4, 16
		sw $t5, 0($t4) 
	DrawObstacles_After0:
	lw $t4, 0($t2)					# get next row to draw
	subi $t4, $t4, CANVAS_WIDTH
	subi $t4, $t4, CANVAS_WIDTH
	subi $t4, $t4, 2
		
	bltz $t4, DrawObstacles_If 			# branch if not a valid location
	j DrawObstacles_Else
	
	DrawObstacles_If:
		addi $t4, $t4, CANVAS_WIDTH
		j DrawObstacles_After
	DrawObstacles_Else:
		mult $t4, $t3
		mflo $t4 				# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS		# start hardcoding pixels to draw
		li $t5, OBSTACLE_EAR
		sw $t5, 0($t4) 
		addi $t4, $t4, 16
		sw $t5, 0($t4)
		li $t5, BACKGROUND_COLOR
		subi $t4, $t4, 12
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		li $t5, OBSTACLE_EAR
		lw $t4, 0($t2) 				# get value of array
		subi $t4, $t4, CANVAS_WIDTH 		# location - width
		subi $t4, $t4, 2 			# location - width - 2
	DrawObstacles_After:
		bltz $t4, DrawObstacles_After2		# branch if not a valid location
		j DrawObstacles_Else2
	DrawObstacles_Else2:
		mult $t4, $t3
		mflo $t4 				# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS		# start hardcoding pixels to draw
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
		subi $t4, $t4, 12
		li $t5, OBSTACLE_BODY
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
	DrawObstacles_After2:
		lw $t4, 0($t2)				# get next row to draw
		subi $t4, $t4, 3 			# location - 2
		mult $t4, $t3
		mflo $t4 				# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS	
		li $t5, BACKGROUND_COLOR
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4			# start hardcoding pixels to draw
		li $t5, OBSTACLE_EYE
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
		subi $t4, $t4, 4
		li $t5, OBSTACLE_BODY
		sw $t5, 0($t4)
		li $t5, BACKGROUND_COLOR
		addi $t4, $t4, 8
		sw $t5, 0($t4)
		li $t5, OBSTACLE_BODY
		
		lw $t4, 0($t2)
		addi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 2
		bgt $t4,$t7, DrawObstacles_After3 	# branch if not a valid location
		j DrawObstacles_Else3
	DrawObstacles_Else3:
		mult $t4, $t3
		mflo $t4 				# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS 		# start hardcoding pixels to draw
		sw $t5, 0($t4)	
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
	DrawObstacles_After3:
		lw $t4, 0($t2)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		subi $t4, $t4, 2
		bgt $t4,$t7, DrawObstacles_After4	# branch if not a valid location
		j DrawObstacles_Else4
	DrawObstacles_Else4:
		mult $t4, $t3
		mflo $t4 				# multiplies address by 4
		addi $t4, $t4, 4 			# start hardcoding pixels to draw
		addi $t4, $t4, BASE_ADDRESS
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
	DrawObstacles_After4:				# increment to next obstacle
		addi $t8, $t8, 1
		addi $t2, $t2, 4
		j DrawObstacles_Loop
	DrawObstacles_LoopEnd:
		jr $ra

DrawLaserIcon:
	li $t2, CANVAS_WIDTH
	li $t3, CANVAS_HEIGHT
	subi $t3, $t3, 1
	mult $t2, $t3
	mflo $t2 			# width * (height - 1) in $t2
	li $t3, 4
	mult $t2, $t3
	mflo $t2 			# 4 * width * (height - 1) in $t2
	subi $t2, $t2, 8
	addi $t2, $t2, BASE_ADDRESS
	li $t5, PLAYER_EYE
	sw $t5, 0($t2)			# start hardcoding pixels to draw
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	sw $t5, 0($t2)
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	sw $t5, 0($t2)
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	sw $t5, 0($t2)
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	sw $t5, 0($t2)
	jr $ra

MainLoop_Begin:
	jal DrawObstacles
	jal DrawLives
	
	# Checks if laser should be drawn, and increments cooldown if it isn't
	la $t3, LaserReady
	lw $t3, 0($t3)
	beqz $t3, DontDrawLaser
	jal DrawLaserIcon
	j DontDrawLaser_After
	DontDrawLaser:
		la $t3, LaserCoolDownTimer
		lw $t4, 0($t3)			# get laser timer
		addi $t4, $t4, 1
		sw $t4, 0($t3) 			# increment cooldown
		li $t2, LASER_CD
		beq $t4, $t2, SetLaser 		# check if cooldown is up
		j DontDrawLaser_After
		SetLaser:
			li $t2, 0
			sw $t2, 0($t3)		# reset cooldown timer
			la $t3, LaserReady
			li $t2, 1
			sw $t2, 0($t3) 		# sets laser as ready
	DontDrawLaser_After:
	
	
	li $t3, CANVAS_WIDTH			# width * (height - 1) in t5
	li $t2, CANVAS_HEIGHT
	subi $t2, $t2, 1 
	mult $t3, $t2
	mflo $t5 
	addi $t5, $t5, CANVAS_WIDTH
	addi $t5, $t5, CANVAS_WIDTH
	addi $t5, $t5, CANVAS_WIDTH
	
	li $t3, CANVAS_WIDTH 	# increment obstacles by
	la $t2, Obstacles 	# address of array
	li $t7, 0
	la $t8, Num_Obstacles	# get number of obstacles to loop through
	lw $t8, 0($t8)
	li $t9, -1
	MainLoop_IncrementObstacleLoop:
		bge $t7, $t8 MainLoop_IncrementObstacleLoopEnd
		lw $t4, 0($t2) 				# obstacle value
		beq $t4, -1, Obstacles_Wait		# check if obstacle is in screen
		bge $t4, $t5 Obstacles_SetNegative 	# branch if can't increment obstacle
		j Obstacles_Else
		Obstacles_SetNegative:			# removes obstacle
			sw $t9, 0($t2)
			j Obstacles_Wait
		
		Obstacles_Wait:
			li $v0, 42
			li $a0, 0
			li $a1, RESPAWN_TIME 		# wait for respawn time
			syscall
			add $t6, $zero, $a0
			bge $t6, 19, Obstacles_If	# 1/RESPAWN_TIME change to spawn every frame
			j Obstacles_next
		Obstacles_If:
			li $v0, 42
			li $a0, 0
			li $a1, CANVAS_WIDTH
			subi $a1, $a1, 4		# get valid random number
			syscall
			add $t6, $zero, $a0 		# store a random number in t3
			addi, $t6, $t6, 2
			sw $t6, 0($t2)
			j Obstacles_next
		Obstacles_Else:
			add $t4, $t4, $t3 	# increment
			sw $t4, 0($t2) 		# store it back
		Obstacles_next:
			addi $t2, $t2, 4 	# increment address and array
			addi $t7, $t7, 1
			j MainLoop_IncrementObstacleLoop
	
	MainLoop_IncrementObstacleLoopEnd:
	jal CheckCollision 		# check for collisions
	
	li $t9, 0xffff0000		# check keyboard
	lw $t8, 0($t9)
	beq $t8, 1, KeyPressed

	MainLoop_Sleep:
		li $v0, 32		# sleeps before looping
		li $a0, REFRESH_RATE
		syscall
	
	addi $t0, $t0, 1
	li $t9, ADD_ENEMY 		
	div $t0, $t9
	mfhi $t9 
	
	beq $t9, $zero Increment_NumEnemies	# adds enemy every ADD_ENEMY/40 seconds
	j MainLoop_Begin
	
	Increment_NumEnemies:
		la $t8 Num_Obstacles
		lw $t7, 0($t8)
		
		li $t9, MAX_OBSTACLES
		bge $t7, $t9 MainLoop_Begin 	# don't increment if there's MAX_OBSTACLES enemies
		
		addi $t7, $t7, 1
		sw $t7, 0($t8)
	j MainLoop_Begin

KeyPressed:
	lw $t4, 4($t9)				# checks which key is pressed
	beq $t4, 97, aPressed
	beq $t4, 119, wPressed
	beq $t4, 115, sPressed
	beq $t4, 100, dPressed
	beq $t4, 112, pPressed
	beq $t4, 32, spacePressed
	j MainLoop_Sleep

	aPressed:
		li $t6, CANVAS_WIDTH
		div $t1, $t6
		mfhi $t2 		# t2 = position % CANVAS_WIDTH
		subi $t2, $t2, 2
		beqz $t2, aPressed_If 	# branch if current position is at edge
		addi $t2, $t2, 2
		subi $t1, $t1, 1
		
		# colors player's right
		li $t5, BACKGROUND_COLOR
		li $t3, 4
		add $t4, $zero, $t1 			# get value of array
		subi $t4, $t4, CANVAS_WIDTH 		# location - width
		subi $t4, $t4, CANVAS_WIDTH 		# location - width - width
		addi $t4, $t4, 2 			# location - width - width - 2
		mult $t4, $t3	
		mflo $t4 
		addi $t4, $t4, BASE_ADDRESS
		
		sw $t5, 0($t4)				# start hardcoding pixels to erase
		addi $t4, $t4, 4
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		sw $t5, 0($t4)
		jal DrawPlayer
		aPressed_If: 		# at edge
			addi $t2, $t2, 2
			j MainLoop_Sleep
			
	wPressed:
		li $t6, CANVAS_WIDTH
		addi $t6, $t6, CANVAS_WIDTH
		addi $t6, $t6, CANVAS_WIDTH
		blt $t1, $t6, wPressed_If 	# branch if position at the top
		subi $t6, $t6, CANVAS_WIDTH
		subi $t6, $t6, CANVAS_WIDTH
		sub $t1, $t1, $t6
		
		# colors player's bottom
		li $t5, BACKGROUND_COLOR
		li $t3, 4
		add $t4, $zero, $t1 			# get value of array
		addi $t4, $t4, CANVAS_WIDTH 		# location - width
		addi $t4, $t4, CANVAS_WIDTH 		# location - width - width
		addi $t4, $t4, CANVAS_WIDTH 		# location - width - width
		subi $t4, $t4, 2 			# location - width - width - 2
		mult $t4, $t3
		mflo $t4 
		addi $t4, $t4, BASE_ADDRESS
		
		sw $t5, 0($t4) 				# start hardcoding pixels to erase
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		jal DrawPlayer
		
		wPressed_If:
			subi $t6, $t6, CANVAS_WIDTH
			subi $t6, $t6, CANVAS_WIDTH
			j MainLoop_Sleep
	sPressed:
		li $t6, CANVAS_WIDTH
		li $t2, CANVAS_HEIGHT
		subi $t2, $t2, 3
		mult $t6, $t2
		mflo $t2
		blt $t1, $t2, sPressed_If 	# position NOT at the bottom
		j MainLoop_Sleep
		
		sPressed_If:
			# start coloring player's top
			add $t1, $t1, $t6
			li $t5, BACKGROUND_COLOR
			li $t3, 4
			add $t4, $zero, $t1 			# get value of array
			subi $t4, $t4, CANVAS_WIDTH 		# location - width
			subi $t4, $t4, CANVAS_WIDTH 		# location - width - width
			subi $t4, $t4, CANVAS_WIDTH 		# location - width - width
			subi $t4, $t4, 1 			# location - width - width - 2
			mult $t4, $t3
			mflo $t4 
			addi $t4, $t4, BASE_ADDRESS
			sw $t5, 0($t4)				# start hardcoding pixels to erase
			addi $t4, $t4, 4
			sw $t5, 0($t4)
			addi $t4, $t4, 4
			sw $t5, 0($t4)
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, 4
			sw $t5, 0($t4)
			subi $t4, $t4, 16
			sw $t5, 0($t4)
			jal DrawPlayer
			j MainLoop_Sleep
		
	dPressed:
		li $t6, CANVAS_WIDTH
		div $t1, $t6
		mfhi $t2 			# t2 = position % CANVAS_WIDTH
		addi $t2, $t2, 2
		subi $t6, $t6, 1
		beq $t2, $t6 dPressed_If 	# branch if player is at right edge
		subi $t2, $t2, 2
		addi $t1, $t1, 1
		
		# colors player's right
		li $t5, BACKGROUND_COLOR
		li $t3, 4
		add $t4, $zero, $t1 			# get value of array
		subi $t4, $t4, CANVAS_WIDTH 		# location - width
		subi $t4, $t4, CANVAS_WIDTH 		# location - width - width
		subi $t4, $t4, 2 			# location - width - width - 2
		mult $t4, $t3
		mflo $t4 
		addi $t4, $t4, BASE_ADDRESS
		
		sw $t5, 0($t4) 				# start hardcoding pixels to erase
		subi $t4, $t4, 4
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		sw $t5, 0($t4)
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		addi $t4, $t4, CANVAS_WIDTH
		sw $t5, 0($t4)
		jal DrawPlayer
		
		dPressed_If:
			subi $t2, $t2, 2
			j MainLoop_Sleep
	pPressed:
		la $t3, LaserCoolDownTimer
		li $t2, 0 		# reset laser status
		sw $t2, 0($t3)
		la $t3, LaserReady
		li $t2, 1
		sw $t2, 0($t3)
			
		la $t8 Num_Obstacles 	# reset number of enemies
		li $t9, 4
		sw $t9, 0($t8)
		
		li $t0, 0		# reset game timer
		
		la $t7, Lives		
		li $t6, 3
		sw $t6, 0($t7)
		jal DrawCanvas		# reset number of lives
		
		li $v0, 32		# sleeps for 1 sec
		li $a0, 1000
		syscall
		j Begin			# restarts game
		
	spacePressed:
		la $t2, LaserReady
		lw $t2, 0($t2)
		bnez $t2 LaserAvailable
		j MainLoop_Sleep
		LaserAvailable:	
			la $t2, LaserReady
			sw $zero, 0($t2)
		
		add $t2, $t1, $t1
		add $t2, $t2, $t1
		add $t2, $t2, $t1
		addi $t2, $t2, BASE_ADDRESS 	# get current position of player
		subi $t2, $t2, 4
		subi $t2, $t2, CANVAS_WIDTH	# adjust position to draw
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		subi $t2, $t2, CANVAS_WIDTH
		
		li $t3, PLAYER_EYE
		li $v0, 32		# prepare to sleep before looping
		li $a0, 5
		la $t6, Obstacles
		
		drawLaser:
			# loops and starts drawing laser
			blt $t2, BASE_ADDRESS, drawLaser_End
			sw $t3, 0($t2)
			addi $t2, $t2, 8
			sw $t3, 0($t2)
			subi $t2, $t2, 8
			subi $t2, $t2, CANVAS_WIDTH
			subi $t2, $t2, CANVAS_WIDTH
			subi $t2, $t2, CANVAS_WIDTH
			subi $t2, $t2, CANVAS_WIDTH
			syscall 		# pauses for animation
			j drawLaser
			
			drawLaser_End:
				li $a0, 250
				syscall		# stops for 0.25 seconds
			
			la $t2, Num_Obstacles
			lw $t4, 0($t2) 		# get number of obstacles to loop through
			li $t5, 0
			kill_Obstacles:
				bge $t5, $t4, kill_Obstacles_End
				
				lw $t2, 0($t6) 		# get array value
				li $t7, CANVAS_WIDTH
				div $t1, $t7 
				mfhi $t8 		# get x value of player
				div $t2, $t7 
				mfhi $t9 		# get x value of obstacle
				
				
				bge $t9, $t8 kill_ObstaclesAbsIf # if obstacle x is greater than player x
				j kill_ObstaclesAbsElse
				kill_ObstaclesAbsIf:	
					sub $t9, $t9, $t8	# x distance in $t9
					j kill_ObstaclesAbsAfter
				kill_ObstaclesAbsElse:
					sub $t9, $t8, $t9 	# x distance in $t9
				kill_ObstaclesAbsAfter:
				
				
				li $t7, 4 			# branch if collision detected
				ble $t9, $t7, kill_Obstacles_Collision
				j kill_Obstacles_CollisionAfter
				kill_Obstacles_Collision: 	# remove enemy
					li $t7, -1
					sw $t7, 0($t6)
				kill_Obstacles_CollisionAfter:
					addi $t5, $t5, 1 	# increment address 
					addi $t6, $t6, 4
					j kill_Obstacles
			kill_Obstacles_End:
				jal DrawCanvas			# redraws canvas
				jal DrawObstacles
				jal DrawPlayer
				j MainLoop_Sleep
CheckCollision:
	la $t2, Obstacles
	li $t8, 0
	la $t9, Num_Obstacles 		# gets number of obstacles to loop through
	lw $t9, 0($t9)
	CheckCollision_Loop:
		bge $t8, $t9, CheckCollision_LoopEnd
		
		lw $t5, 0($t2) 		# get array value
		li $t3, CANVAS_WIDTH
		div $t1, $t3 
		mfhi $t4 		# get x value of player
		mflo $t6 		# get y value of player
		div $t5, $t3 
		mfhi $t3 		# get x value of obstacle
		bge $t3, $t4 CheckCollision_xAbsIf # if obstacle x is greater than player x
		j CheckCollision_xAbsElse
		CheckCollision_xAbsIf:	
			sub $t3, $t3, $t4
			j CheckCollision_xAbsAfter
		CheckCollision_xAbsElse:
			sub $t3, $t4, $t3 # x distance in $t3
		CheckCollision_xAbsAfter:
		
		mflo $t4 				# get y value of obstacle
		bge $t4, $t6 CheckCollision_yAbsIf 	# if obstacle y is greater than player y
		j CheckCollision_yAbsElse
		CheckCollision_yAbsIf:	
			sub $t4, $t4, $t6
			j CheckCollision_yAbsAfter
		CheckCollision_yAbsElse:
			sub $t4, $t6, $t4 		# y distance in $t4
		CheckCollision_yAbsAfter:
		
		add $t3, $t3, $t4 			# store distance in $t3
		li $t4, 5 				# branch if collision detected
		ble $t3, $t4, CheckCollision_DecreaseLives
	
	CheckCollision_Iterate:
		addi $t8, $t8, 1 			# increments address
		addi $t2, $t2, 4
		j CheckCollision_Loop
		
	CheckCollision_DecreaseLives:
		li $v0, 32		# pauses before decreasing lives
		li $a0, 1000
		syscall
		
		li $t3, -1
		sw $t4, 0($t2)
		
		la $t7, Lives
		lw $t6, 0($t7)
		subi $t6, $t6, 1
		sw $t6, 0($t7)
		beqz $t6, End 		# ends game if no lives
		
		addi $sp, $sp, -4 	# nested call for draw canvas and players
		sw $ra, 0($sp)
		jal DrawCanvas
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal DrawPlayer
		lw $ra, 0($sp)
		addi $sp, $sp, 4
	
	CheckCollision_LoopEnd:
		jr $ra

End:
	jal DrawCanvas
	jal DrawObstacles
	jal DrawLaserIcon

	li $v0, 32		# setup sleeping when drawing game over screen
	li $a0, 30
	li $t5, 0x8994ff
	addi $t4, $zero, BASE_ADDRESS
	add $t6, $zero, $t4
	add $t6, $zero, $t4
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	addi $t3, $t4, 2856
	sw $t5, 0($t3)
	addi $t3, $t4, 2860
	sw $t5, 0($t3)
	addi $t3, $t4, 2864
	sw $t5, 0($t3)
	addi $t3, $t4, 2868
	sw $t5, 0($t3)
	addi $t3, $t4, 2872
	sw $t5, 0($t3)
	addi $t3, $t4, 2876
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 3104
	sw $t5, 0($t3)
	addi $t3, $t4, 3108
	sw $t5, 0($t3)
	addi $t3, $t4, 3112
	sw $t5, 0($t3)
	addi $t3, $t4, 3116
	sw $t5, 0($t3)
	addi $t3, $t4, 3120
	sw $t5, 0($t3)
	addi $t3, $t4, 3124
	sw $t5, 0($t3)
	addi $t3, $t4, 3128
	sw $t5, 0($t3)
	addi $t3, $t4, 3132
	sw $t5, 0($t3)
	addi $t3, $t4, 3136
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 3356
	sw $t5, 0($t3)
	addi $t3, $t4, 3360
	sw $t5, 0($t3)
	addi $t3, $t4, 3364
	sw $t5, 0($t3)
	addi $t3, $t4, 3368
	sw $t5, 0($t3)
	addi $t3, $t4, 3388
	sw $t5, 0($t3)
	addi $t3, $t4, 3392
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 3612
	sw $t5, 0($t3)
	addi $t3, $t4, 3616
	sw $t5, 0($t3)
	addi $t3, $t4, 3620
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 3864
	sw $t5, 0($t3)
	addi $t3, $t4, 3868
	sw $t5, 0($t3)
	addi $t3, $t4, 3872
	sw $t5, 0($t3)
	addi $t3, $t4, 3932
	sw $t5, 0($t3)
	addi $t3, $t4, 3936
	sw $t5, 0($t3)
	addi $t3, $t4, 3940
	sw $t5, 0($t3)
	addi $t3, $t4, 3948
	sw $t5, 0($t3)
	addi $t3, $t4, 3952
	sw $t5, 0($t3)
	addi $t3, $t4, 3968
	sw $t5, 0($t3)
	addi $t3, $t4, 3972
	sw $t5, 0($t3)
	addi $t3, $t4, 3976
	sw $t5, 0($t3)
	addi $t3, $t4, 3984
	sw $t5, 0($t3)
	addi $t3, $t4, 3988
	sw $t5, 0($t3)
	addi $t3, $t4, 3992
	sw $t5, 0($t3)
	addi $t3, $t4, 4008
	sw $t5, 0($t3)
	addi $t3, $t4, 4012
	sw $t5, 0($t3)
	addi $t3, $t4, 4016
	sw $t5, 0($t3)
	addi $t3, $t4, 4048
	sw $t5, 0($t3)
	addi $t3, $t4, 4052
	sw $t5, 0($t3)
	addi $t3, $t4, 4056
	sw $t5, 0($t3)
	addi $t3, $t4, 4060
	sw $t5, 0($t3)
	addi $t3, $t4, 4064
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 4120
	sw $t5, 0($t3)
	addi $t3, $t4, 4124
	sw $t5, 0($t3)
	addi $t3, $t4, 4128
	sw $t5, 0($t3)
	addi $t3, $t4, 4180
	sw $t5, 0($t3)
	addi $t3, $t4, 4184
	sw $t5, 0($t3)
	addi $t3, $t4, 4188
	sw $t5, 0($t3)
	addi $t3, $t4, 4192
	sw $t5, 0($t3)
	addi $t3, $t4, 4196
	sw $t5, 0($t3)
	addi $t3, $t4, 4200
	sw $t5, 0($t3)
	addi $t3, $t4, 4204
	sw $t5, 0($t3)
	addi $t3, $t4, 4208
	sw $t5, 0($t3)
	addi $t3, $t4, 4212
	sw $t5, 0($t3)
	addi $t3, $t4, 4224
	sw $t5, 0($t3)
	addi $t3, $t4, 4228
	sw $t5, 0($t3)
	addi $t3, $t4, 4232
	sw $t5, 0($t3)
	addi $t3, $t4, 4236
	sw $t5, 0($t3)
	addi $t3, $t4, 4240
	sw $t5, 0($t3)
	addi $t3, $t4, 4244
	sw $t5, 0($t3)
	addi $t3, $t4, 4248
	sw $t5, 0($t3)
	addi $t3, $t4, 4252
	sw $t5, 0($t3)
	addi $t3, $t4, 4260
	sw $t5, 0($t3)
	addi $t3, $t4, 4264
	sw $t5, 0($t3)
	addi $t3, $t4, 4268
	sw $t5, 0($t3)
	addi $t3, $t4, 4272
	sw $t5, 0($t3)
	addi $t3, $t4, 4276
	sw $t5, 0($t3)
	addi $t3, $t4, 4296
	sw $t5, 0($t3)
	addi $t3, $t4, 4300
	sw $t5, 0($t3)
	addi $t3, $t4, 4304
	sw $t5, 0($t3)
	addi $t3, $t4, 4308
	sw $t5, 0($t3)
	addi $t3, $t4, 4312
	sw $t5, 0($t3)
	addi $t3, $t4, 4316
	sw $t5, 0($t3)
	addi $t3, $t4, 4320
	sw $t5, 0($t3)
	addi $t3, $t4, 4324
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 4376
	sw $t5, 0($t3)
	addi $t3, $t4, 4380
	sw $t5, 0($t3)
	addi $t3, $t4, 4384
	sw $t5, 0($t3)
	addi $t3, $t4, 4404
	sw $t5, 0($t3)
	addi $t3, $t4, 4408
	sw $t5, 0($t3)
	addi $t3, $t4, 4412
	sw $t5, 0($t3)
	addi $t3, $t4, 4416
	sw $t5, 0($t3)
	addi $t3, $t4, 4420
	sw $t5, 0($t3)
	addi $t3, $t4, 4436
	sw $t5, 0($t3)
	addi $t3, $t4, 4440
	sw $t5, 0($t3)
	addi $t3, $t4, 4444
	sw $t5, 0($t3)
	addi $t3, $t4, 4452
	sw $t5, 0($t3)
	addi $t3, $t4, 4456
	sw $t5, 0($t3)
	addi $t3, $t4, 4460
	sw $t5, 0($t3)
	addi $t3, $t4, 4464
	sw $t5, 0($t3)
	addi $t3, $t4, 4468
	sw $t5, 0($t3)
	addi $t3, $t4, 4480
	sw $t5, 0($t3)
	addi $t3, $t4, 4484
	sw $t5, 0($t3)
	addi $t3, $t4, 4488
	sw $t5, 0($t3)
	addi $t3, $t4, 4492
	sw $t5, 0($t3)
	addi $t3, $t4, 4496
	sw $t5, 0($t3)
	addi $t3, $t4, 4500
	sw $t5, 0($t3)
	addi $t3, $t4, 4504
	sw $t5, 0($t3)
	addi $t3, $t4, 4508
	sw $t5, 0($t3)
	addi $t3, $t4, 4512
	sw $t5, 0($t3)
	addi $t3, $t4, 4516
	sw $t5, 0($t3)
	addi $t3, $t4, 4520
	sw $t5, 0($t3)
	addi $t3, $t4, 4524
	sw $t5, 0($t3)
	addi $t3, $t4, 4528
	sw $t5, 0($t3)
	addi $t3, $t4, 4532
	sw $t5, 0($t3)
	addi $t3, $t4, 4552
	sw $t5, 0($t3)
	addi $t3, $t4, 4556
	sw $t5, 0($t3)
	addi $t3, $t4, 4576
	sw $t5, 0($t3)
	addi $t3, $t4, 4580
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 4632
	sw $t5, 0($t3)
	addi $t3, $t4, 4636
	sw $t5, 0($t3)
	addi $t3, $t4, 4640
	sw $t5, 0($t3)
	addi $t3, $t4, 4660
	sw $t5, 0($t3)
	addi $t3, $t4, 4664
	sw $t5, 0($t3)
	addi $t3, $t4, 4668
	sw $t5, 0($t3)
	addi $t3, $t4, 4672
	sw $t5, 0($t3)
	addi $t3, $t4, 4676
	sw $t5, 0($t3)
	addi $t3, $t4, 4688
	sw $t5, 0($t3)
	addi $t3, $t4, 4692
	sw $t5, 0($t3)
	addi $t3, $t4, 4696
	sw $t5, 0($t3)
	addi $t3, $t4, 4716
	sw $t5, 0($t3)
	addi $t3, $t4, 4720
	sw $t5, 0($t3)
	addi $t3, $t4, 4724
	sw $t5, 0($t3)
	addi $t3, $t4, 4736
	sw $t5, 0($t3)
	addi $t3, $t4, 4740
	sw $t5, 0($t3)
	addi $t3, $t4, 4744
	sw $t5, 0($t3)
	addi $t3, $t4, 4760
	sw $t5, 0($t3)
	addi $t3, $t4, 4764
	sw $t5, 0($t3)
	addi $t3, $t4, 4768
	sw $t5, 0($t3)
	addi $t3, $t4, 4784
	sw $t5, 0($t3)
	addi $t3, $t4, 4788
	sw $t5, 0($t3)
	addi $t3, $t4, 4792
	sw $t5, 0($t3)
	addi $t3, $t4, 4804
	sw $t5, 0($t3)
	addi $t3, $t4, 4808
	sw $t5, 0($t3)
	addi $t3, $t4, 4812
	sw $t5, 0($t3)
	addi $t3, $t4, 4832
	sw $t5, 0($t3)
	addi $t3, $t4, 4836
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 4888
	sw $t5, 0($t3)
	addi $t3, $t4, 4892
	sw $t5, 0($t3)
	addi $t3, $t4, 4896
	sw $t5, 0($t3)
	addi $t3, $t4, 4924
	sw $t5, 0($t3)
	addi $t3, $t4, 4928
	sw $t5, 0($t3)
	addi $t3, $t4, 4932
	sw $t5, 0($t3)
	addi $t3, $t4, 4944
	sw $t5, 0($t3)
	addi $t3, $t4, 4948
	sw $t5, 0($t3)
	addi $t3, $t4, 4952
	sw $t5, 0($t3)
	addi $t3, $t4, 4972
	sw $t5, 0($t3)
	addi $t3, $t4, 4976
	sw $t5, 0($t3)
	addi $t3, $t4, 4980
	sw $t5, 0($t3)
	addi $t3, $t4, 4992
	sw $t5, 0($t3)
	addi $t3, $t4, 4996
	sw $t5, 0($t3)
	addi $t3, $t4, 5000
	sw $t5, 0($t3)
	addi $t3, $t4, 5016
	sw $t5, 0($t3)
	addi $t3, $t4, 5020
	sw $t5, 0($t3)
	addi $t3, $t4, 5024
	sw $t5, 0($t3)
	addi $t3, $t4, 5040
	sw $t5, 0($t3)
	addi $t3, $t4, 5044
	sw $t5, 0($t3)
	addi $t3, $t4, 5048
	sw $t5, 0($t3)
	addi $t3, $t4, 5060
	sw $t5, 0($t3)
	addi $t3, $t4, 5064
	sw $t5, 0($t3)
	addi $t3, $t4, 5068
	sw $t5, 0($t3)
	addi $t3, $t4, 5072
	sw $t5, 0($t3)
	addi $t3, $t4, 5076
	sw $t5, 0($t3)
	addi $t3, $t4, 5080
	sw $t5, 0($t3)
	addi $t3, $t4, 5084
	sw $t5, 0($t3)
	addi $t3, $t4, 5088
	sw $t5, 0($t3)
	addi $t3, $t4, 5092
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 5148
	sw $t5, 0($t3)
	addi $t3, $t4, 5152
	sw $t5, 0($t3)
	addi $t3, $t4, 5180
	sw $t5, 0($t3)
	addi $t3, $t4, 5184
	sw $t5, 0($t3)
	addi $t3, $t4, 5188
	sw $t5, 0($t3)
	addi $t3, $t4, 5200
	sw $t5, 0($t3)
	addi $t3, $t4, 5204
	sw $t5, 0($t3)
	addi $t3, $t4, 5208
	sw $t5, 0($t3)
	addi $t3, $t4, 5228
	sw $t5, 0($t3)
	addi $t3, $t4, 5232
	sw $t5, 0($t3)
	addi $t3, $t4, 5236
	sw $t5, 0($t3)
	addi $t3, $t4, 5248
	sw $t5, 0($t3)
	addi $t3, $t4, 5252
	sw $t5, 0($t3)
	addi $t3, $t4, 5256
	sw $t5, 0($t3)
	addi $t3, $t4, 5272
	sw $t5, 0($t3)
	addi $t3, $t4, 5276
	sw $t5, 0($t3)
	addi $t3, $t4, 5280
	sw $t5, 0($t3)
	addi $t3, $t4, 5296
	sw $t5, 0($t3)
	addi $t3, $t4, 5300
	sw $t5, 0($t3)
	addi $t3, $t4, 5304
	sw $t5, 0($t3)
	addi $t3, $t4, 5316
	sw $t5, 0($t3)
	addi $t3, $t4, 5320
	sw $t5, 0($t3)
	addi $t3, $t4, 5324
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 5404
	sw $t5, 0($t3)
	addi $t3, $t4, 5408
	sw $t5, 0($t3)
	addi $t3, $t4, 5412
	sw $t5, 0($t3)
	addi $t3, $t4, 5416
	sw $t5, 0($t3)
	addi $t3, $t4, 5436
	sw $t5, 0($t3)
	addi $t3, $t4, 5440
	sw $t5, 0($t3)
	addi $t3, $t4, 5444
	sw $t5, 0($t3)
	addi $t3, $t4, 5456
	sw $t5, 0($t3)
	addi $t3, $t4, 5460
	sw $t5, 0($t3)
	addi $t3, $t4, 5464
	sw $t5, 0($t3)
	addi $t3, $t4, 5480
	sw $t5, 0($t3)
	addi $t3, $t4, 5484
	sw $t5, 0($t3)
	addi $t3, $t4, 5488
	sw $t5, 0($t3)
	addi $t3, $t4, 5492
	sw $t5, 0($t3)
	addi $t3, $t4, 5504
	sw $t5, 0($t3)
	addi $t3, $t4, 5508
	sw $t5, 0($t3)
	addi $t3, $t4, 5512
	sw $t5, 0($t3)
	addi $t3, $t4, 5528
	sw $t5, 0($t3)
	addi $t3, $t4, 5532
	sw $t5, 0($t3)
	addi $t3, $t4, 5536
	sw $t5, 0($t3)
	addi $t3, $t4, 5552
	sw $t5, 0($t3)
	addi $t3, $t4, 5556
	sw $t5, 0($t3)
	addi $t3, $t4, 5560
	sw $t5, 0($t3)
	addi $t3, $t4, 5572
	sw $t5, 0($t3)
	addi $t3, $t4, 5576
	sw $t5, 0($t3)
	addi $t3, $t4, 5580
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 5664
	sw $t5, 0($t3)
	addi $t3, $t4, 5668
	sw $t5, 0($t3)
	addi $t3, $t4, 5672
	sw $t5, 0($t3)
	addi $t3, $t4, 5676
	sw $t5, 0($t3)
	addi $t3, $t4, 5680
	sw $t5, 0($t3)
	addi $t3, $t4, 5684
	sw $t5, 0($t3)
	addi $t3, $t4, 5688
	sw $t5, 0($t3)
	addi $t3, $t4, 5692
	sw $t5, 0($t3)
	addi $t3, $t4, 5696
	sw $t5, 0($t3)
	addi $t3, $t4, 5700
	sw $t5, 0($t3)
	addi $t3, $t4, 5716
	sw $t5, 0($t3)
	addi $t3, $t4, 5720
	sw $t5, 0($t3)
	addi $t3, $t4, 5724
	sw $t5, 0($t3)
	addi $t3, $t4, 5728
	sw $t5, 0($t3)
	addi $t3, $t4, 5732
	sw $t5, 0($t3)
	addi $t3, $t4, 5736
	sw $t5, 0($t3)
	addi $t3, $t4, 5740
	sw $t5, 0($t3)
	addi $t3, $t4, 5744
	sw $t5, 0($t3)
	addi $t3, $t4, 5748
	sw $t5, 0($t3)
	addi $t3, $t4, 5760
	sw $t5, 0($t3)
	addi $t3, $t4, 5764
	sw $t5, 0($t3)
	addi $t3, $t4, 5768
	sw $t5, 0($t3)
	addi $t3, $t4, 5784
	sw $t5, 0($t3)
	addi $t3, $t4, 5788
	sw $t5, 0($t3)
	addi $t3, $t4, 5792
	sw $t5, 0($t3)
	addi $t3, $t4, 5808
	sw $t5, 0($t3)
	addi $t3, $t4, 5812
	sw $t5, 0($t3)
	addi $t3, $t4, 5816
	sw $t5, 0($t3)
	addi $t3, $t4, 5832
	sw $t5, 0($t3)
	addi $t3, $t4, 5836
	sw $t5, 0($t3)
	addi $t3, $t4, 5840
	sw $t5, 0($t3)
	addi $t3, $t4, 5856
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 5924
	sw $t5, 0($t3)
	addi $t3, $t4, 5928
	sw $t5, 0($t3)
	addi $t3, $t4, 5932
	sw $t5, 0($t3)
	addi $t3, $t4, 5936
	sw $t5, 0($t3)
	addi $t3, $t4, 5940
	sw $t5, 0($t3)
	addi $t3, $t4, 5944
	sw $t5, 0($t3)
	addi $t3, $t4, 5948
	sw $t5, 0($t3)
	addi $t3, $t4, 5952
	sw $t5, 0($t3)
	addi $t3, $t4, 5976
	sw $t5, 0($t3)
	addi $t3, $t4, 5980
	sw $t5, 0($t3)
	addi $t3, $t4, 5984
	sw $t5, 0($t3)
	addi $t3, $t4, 5988
	sw $t5, 0($t3)
	addi $t3, $t4, 5996
	sw $t5, 0($t3)
	addi $t3, $t4, 6000
	sw $t5, 0($t3)
	addi $t3, $t4, 6004
	sw $t5, 0($t3)
	addi $t3, $t4, 6016
	sw $t5, 0($t3)
	addi $t3, $t4, 6020
	sw $t5, 0($t3)
	addi $t3, $t4, 6024
	sw $t5, 0($t3)
	addi $t3, $t4, 6040
	sw $t5, 0($t3)
	addi $t3, $t4, 6044
	sw $t5, 0($t3)
	addi $t3, $t4, 6048
	sw $t5, 0($t3)
	addi $t3, $t4, 6064
	sw $t5, 0($t3)
	addi $t3, $t4, 6068
	sw $t5, 0($t3)
	addi $t3, $t4, 6072
	sw $t5, 0($t3)
	addi $t3, $t4, 6092
	sw $t5, 0($t3)
	addi $t3, $t4, 6096
	sw $t5, 0($t3)
	addi $t3, $t4, 6100
	sw $t5, 0($t3)
	addi $t3, $t4, 6104
	sw $t5, 0($t3)
	addi $t3, $t4, 6108
	sw $t5, 0($t3)
	addi $t3, $t4, 6112
	sw $t5, 0($t3)
	addi $t3, $t4, 6116
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 6192
	sw $t5, 0($t3)
	addi $t3, $t4, 6196
	sw $t5, 0($t3)
	addi $t3, $t4, 6200
	sw $t5, 0($t3)
	addi $t3, $t4, 6356
	sw $t5, 0($t3)
	addi $t3, $t4, 6360
	sw $t5, 0($t3)
	addi $t3, $t4, 6364
	sw $t5, 0($t3)
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	syscall
	addi $t3, $t4, 9268
	sw $t5, 0($t3)
	addi $t3, $t4, 9272
	sw $t5, 0($t3)
	addi $t3, $t4, 9276
	sw $t5, 0($t3)
	addi $t3, $t4, 9280
	sw $t5, 0($t3)
	addi $t3, $t4, 9284
	sw $t5, 0($t3)
	addi $t3, $t4, 9288
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 9516
	sw $t5, 0($t3)
	addi $t3, $t4, 9520
	sw $t5, 0($t3)
	addi $t3, $t4, 9524
	sw $t5, 0($t3)
	addi $t3, $t4, 9528
	sw $t5, 0($t3)
	addi $t3, $t4, 9532
	sw $t5, 0($t3)
	addi $t3, $t4, 9536
	sw $t5, 0($t3)
	addi $t3, $t4, 9540
	sw $t5, 0($t3)
	addi $t3, $t4, 9544
	sw $t5, 0($t3)
	addi $t3, $t4, 9548
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 9772
	sw $t5, 0($t3)
	addi $t3, $t4, 9776
	sw $t5, 0($t3)
	addi $t3, $t4, 9780
	sw $t5, 0($t3)
	addi $t3, $t4, 9796
	sw $t5, 0($t3)
	addi $t3, $t4, 9800
	sw $t5, 0($t3)
	addi $t3, $t4, 9804
	sw $t5, 0($t3)
	addi $t3, $t4, 9808
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 10024
	sw $t5, 0($t3)
	addi $t3, $t4, 10028
	sw $t5, 0($t3)
	addi $t3, $t4, 10032
	sw $t5, 0($t3)
	addi $t3, $t4, 10060
	sw $t5, 0($t3)
	addi $t3, $t4, 10064
	sw $t5, 0($t3)
	addi $t3, $t4, 10068
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 10276
	sw $t5, 0($t3)
	addi $t3, $t4, 10280
	sw $t5, 0($t3)
	addi $t3, $t4, 10284
	sw $t5, 0($t3)
	addi $t3, $t4, 10320
	sw $t5, 0($t3)
	addi $t3, $t4, 10324
	sw $t5, 0($t3)
	addi $t3, $t4, 10340
	sw $t5, 0($t3)
	addi $t3, $t4, 10344
	sw $t5, 0($t3)
	addi $t3, $t4, 10376
	sw $t5, 0($t3)
	addi $t3, $t4, 10400
	sw $t5, 0($t3)
	addi $t3, $t4, 10404
	sw $t5, 0($t3)
	addi $t3, $t4, 10408
	sw $t5, 0($t3)
	addi $t3, $t4, 10412
	sw $t5, 0($t3)
	addi $t3, $t4, 10416
	sw $t5, 0($t3)
	addi $t3, $t4, 10432
	sw $t5, 0($t3)
	addi $t3, $t4, 10436
	sw $t5, 0($t3)
	addi $t3, $t4, 10440
	sw $t5, 0($t3)
	addi $t3, $t4, 10448
	sw $t5, 0($t3)
	addi $t3, $t4, 10452
	sw $t5, 0($t3)
	addi $t3, $t4, 10456
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 10532
	sw $t5, 0($t3)
	addi $t3, $t4, 10536
	sw $t5, 0($t3)
	addi $t3, $t4, 10540
	sw $t5, 0($t3)
	addi $t3, $t4, 10576
	sw $t5, 0($t3)
	addi $t3, $t4, 10580
	sw $t5, 0($t3)
	addi $t3, $t4, 10596
	sw $t5, 0($t3)
	addi $t3, $t4, 10600
	sw $t5, 0($t3)
	addi $t3, $t4, 10604
	sw $t5, 0($t3)
	addi $t3, $t4, 10628
	sw $t5, 0($t3)
	addi $t3, $t4, 10632
	sw $t5, 0($t3)
	addi $t3, $t4, 10636
	sw $t5, 0($t3)
	addi $t3, $t4, 10648
	sw $t5, 0($t3)
	addi $t3, $t4, 10652
	sw $t5, 0($t3)
	addi $t3, $t4, 10656
	sw $t5, 0($t3)
	addi $t3, $t4, 10660
	sw $t5, 0($t3)
	addi $t3, $t4, 10664
	sw $t5, 0($t3)
	addi $t3, $t4, 10668
	sw $t5, 0($t3)
	addi $t3, $t4, 10672
	sw $t5, 0($t3)
	addi $t3, $t4, 10676
	sw $t5, 0($t3)
	addi $t3, $t4, 10688
	sw $t5, 0($t3)
	addi $t3, $t4, 10692
	sw $t5, 0($t3)
	addi $t3, $t4, 10696
	sw $t5, 0($t3)
	addi $t3, $t4, 10700
	sw $t5, 0($t3)
	addi $t3, $t4, 10704
	sw $t5, 0($t3)
	addi $t3, $t4, 10708
	sw $t5, 0($t3)
	addi $t3, $t4, 10712
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 10788
	sw $t5, 0($t3)
	addi $t3, $t4, 10792
	sw $t5, 0($t3)
	addi $t3, $t4, 10796
	sw $t5, 0($t3)
	addi $t3, $t4, 10832
	sw $t5, 0($t3)
	addi $t3, $t4, 10836
	sw $t5, 0($t3)
	addi $t3, $t4, 10856
	sw $t5, 0($t3)
	addi $t3, $t4, 10860
	sw $t5, 0($t3)
	addi $t3, $t4, 10884
	sw $t5, 0($t3)
	addi $t3, $t4, 10888
	sw $t5, 0($t3)
	addi $t3, $t4, 10904
	sw $t5, 0($t3)
	addi $t3, $t4, 10908
	sw $t5, 0($t3)
	addi $t3, $t4, 10928
	sw $t5, 0($t3)
	addi $t3, $t4, 10932
	sw $t5, 0($t3)
	addi $t3, $t4, 10944
	sw $t5, 0($t3)
	addi $t3, $t4, 10948
	sw $t5, 0($t3)
	addi $t3, $t4, 10952
	sw $t5, 0($t3)
	addi $t3, $t4, 10956
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 11044
	sw $t5, 0($t3)
	addi $t3, $t4, 11048
	sw $t5, 0($t3)
	addi $t3, $t4, 11052
	sw $t5, 0($t3)
	addi $t3, $t4, 11088
	sw $t5, 0($t3)
	addi $t3, $t4, 11092
	sw $t5, 0($t3)
	addi $t3, $t4, 11112
	sw $t5, 0($t3)
	addi $t3, $t4, 11116
	sw $t5, 0($t3)
	addi $t3, $t4, 11120
	sw $t5, 0($t3)
	addi $t3, $t4, 11136
	sw $t5, 0($t3)
	addi $t3, $t4, 11140
	sw $t5, 0($t3)
	addi $t3, $t4, 11144
	sw $t5, 0($t3)
	addi $t3, $t4, 11156
	sw $t5, 0($t3)
	addi $t3, $t4, 11160
	sw $t5, 0($t3)
	addi $t3, $t4, 11164
	sw $t5, 0($t3)
	addi $t3, $t4, 11184
	sw $t5, 0($t3)
	addi $t3, $t4, 11188
	sw $t5, 0($t3)
	addi $t3, $t4, 11200
	sw $t5, 0($t3)
	addi $t3, $t4, 11204
	sw $t5, 0($t3)
	addi $t3, $t4, 11208
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 11300
	sw $t5, 0($t3)
	addi $t3, $t4, 11304
	sw $t5, 0($t3)
	addi $t3, $t4, 11308
	sw $t5, 0($t3)
	addi $t3, $t4, 11344
	sw $t5, 0($t3)
	addi $t3, $t4, 11348
	sw $t5, 0($t3)
	addi $t3, $t4, 11372
	sw $t5, 0($t3)
	addi $t3, $t4, 11376
	sw $t5, 0($t3)
	addi $t3, $t4, 11392
	sw $t5, 0($t3)
	addi $t3, $t4, 11396
	sw $t5, 0($t3)
	addi $t3, $t4, 11412
	sw $t5, 0($t3)
	addi $t3, $t4, 11416
	sw $t5, 0($t3)
	addi $t3, $t4, 11420
	sw $t5, 0($t3)
	addi $t3, $t4, 11424
	sw $t5, 0($t3)
	addi $t3, $t4, 11428
	sw $t5, 0($t3)
	addi $t3, $t4, 11432
	sw $t5, 0($t3)
	addi $t3, $t4, 11436
	sw $t5, 0($t3)
	addi $t3, $t4, 11440
	sw $t5, 0($t3)
	addi $t3, $t4, 11444
	sw $t5, 0($t3)
	addi $t3, $t4, 11456
	sw $t5, 0($t3)
	addi $t3, $t4, 11460
	sw $t5, 0($t3)
	addi $t3, $t4, 11464
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 11560
	sw $t5, 0($t3)
	addi $t3, $t4, 11564
	sw $t5, 0($t3)
	addi $t3, $t4, 11596
	sw $t5, 0($t3)
	addi $t3, $t4, 11600
	sw $t5, 0($t3)
	addi $t3, $t4, 11604
	sw $t5, 0($t3)
	addi $t3, $t4, 11628
	sw $t5, 0($t3)
	addi $t3, $t4, 11632
	sw $t5, 0($t3)
	addi $t3, $t4, 11636
	sw $t5, 0($t3)
	addi $t3, $t4, 11644
	sw $t5, 0($t3)
	addi $t3, $t4, 11648
	sw $t5, 0($t3)
	addi $t3, $t4, 11668
	sw $t5, 0($t3)
	addi $t3, $t4, 11672
	sw $t5, 0($t3)
	addi $t3, $t4, 11676
	sw $t5, 0($t3)
	addi $t3, $t4, 11680
	sw $t5, 0($t3)
	addi $t3, $t4, 11684
	sw $t5, 0($t3)
	addi $t3, $t4, 11688
	sw $t5, 0($t3)
	addi $t3, $t4, 11692
	sw $t5, 0($t3)
	addi $t3, $t4, 11696
	sw $t5, 0($t3)
	addi $t3, $t4, 11712
	sw $t5, 0($t3)
	addi $t3, $t4, 11716
	sw $t5, 0($t3)
	addi $t3, $t4, 11720
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 11816
	sw $t5, 0($t3)
	addi $t3, $t4, 11820
	sw $t5, 0($t3)
	addi $t3, $t4, 11824
	sw $t5, 0($t3)
	addi $t3, $t4, 11848
	sw $t5, 0($t3)
	addi $t3, $t4, 11852
	sw $t5, 0($t3)
	addi $t3, $t4, 11856
	sw $t5, 0($t3)
	addi $t3, $t4, 11888
	sw $t5, 0($t3)
	addi $t3, $t4, 11892
	sw $t5, 0($t3)
	addi $t3, $t4, 11896
	sw $t5, 0($t3)
	addi $t3, $t4, 11900
	sw $t5, 0($t3)
	addi $t3, $t4, 11904
	sw $t5, 0($t3)
	addi $t3, $t4, 11924
	sw $t5, 0($t3)
	addi $t3, $t4, 11928
	sw $t5, 0($t3)
	addi $t3, $t4, 11932
	sw $t5, 0($t3)
	addi $t3, $t4, 11968
	sw $t5, 0($t3)
	addi $t3, $t4, 11972
	sw $t5, 0($t3)
	addi $t3, $t4, 11976
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 12076
	sw $t5, 0($t3)
	addi $t3, $t4, 12080
	sw $t5, 0($t3)
	addi $t3, $t4, 12084
	sw $t5, 0($t3)
	addi $t3, $t4, 12088
	sw $t5, 0($t3)
	addi $t3, $t4, 12092
	sw $t5, 0($t3)
	addi $t3, $t4, 12096
	sw $t5, 0($t3)
	addi $t3, $t4, 12100
	sw $t5, 0($t3)
	addi $t3, $t4, 12104
	sw $t5, 0($t3)
	addi $t3, $t4, 12108
	sw $t5, 0($t3)
	addi $t3, $t4, 12112
	sw $t5, 0($t3)
	addi $t3, $t4, 12148
	sw $t5, 0($t3)
	addi $t3, $t4, 12152
	sw $t5, 0($t3)
	addi $t3, $t4, 12156
	sw $t5, 0($t3)
	addi $t3, $t4, 12184
	sw $t5, 0($t3)
	addi $t3, $t4, 12188
	sw $t5, 0($t3)
	addi $t3, $t4, 12192
	sw $t5, 0($t3)
	addi $t3, $t4, 12208
	sw $t5, 0($t3)
	addi $t3, $t4, 12224
	sw $t5, 0($t3)
	addi $t3, $t4, 12228
	sw $t5, 0($t3)
	addi $t3, $t4, 12232
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 12336
	sw $t5, 0($t3)
	addi $t3, $t4, 12340
	sw $t5, 0($t3)
	addi $t3, $t4, 12344
	sw $t5, 0($t3)
	addi $t3, $t4, 12348
	sw $t5, 0($t3)
	addi $t3, $t4, 12352
	sw $t5, 0($t3)
	addi $t3, $t4, 12356
	sw $t5, 0($t3)
	addi $t3, $t4, 12360
	sw $t5, 0($t3)
	addi $t3, $t4, 12404
	sw $t5, 0($t3)
	addi $t3, $t4, 12408
	sw $t5, 0($t3)
	addi $t3, $t4, 12412
	sw $t5, 0($t3)
	addi $t3, $t4, 12444
	sw $t5, 0($t3)
	addi $t3, $t4, 12448
	sw $t5, 0($t3)
	addi $t3, $t4, 12452
	sw $t5, 0($t3)
	addi $t3, $t4, 12456
	sw $t5, 0($t3)
	addi $t3, $t4, 12460
	sw $t5, 0($t3)
	addi $t3, $t4, 12464
	sw $t5, 0($t3)
	addi $t3, $t4, 12468
	sw $t5, 0($t3)
	addi $t3, $t4, 12480
	sw $t5, 0($t3)
	addi $t3, $t4, 12484
	sw $t5, 0($t3)
	addi $t3, $t4, 12488
	sw $t5, 0($t3)
	syscall
	addi $t3, $t4, 12600
	sw $t5, 0($t3)
	addi $t3, $t4, 12604
	sw $t5, 0($t3)
	addi $t3, $t4, 12608
	sw $t5, 0($t3)
	addi $t3, $t4, 12664
	sw $t5, 0($t3)
	addi $t3, $t4, 12708
	sw $t5, 0($t3)
	addi $t3, $t4, 12712
	sw $t5, 0($t3)
	addi $t3, $t4, 12716
	sw $t5, 0($t3)


End_Loop:
	li $t9, 0xffff0000		# keyboard
	lw $t8, 0($t9)
	beq $t8, 1, End_Loop_KeyPressed
	End_Loop_Sleep:
		li $v0, 32		# sleeps before looping
		li $a0, REFRESH_RATE
		syscall
		j End_Loop
	
	End_Loop_KeyPressed: 		# check if p is pressed
		lw $t4, 4($t9)
		beq $t4, 112, pPressed
		j End_Loop
