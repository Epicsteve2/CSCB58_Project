#####################################################################
#
# CSCB58 Winter 2021 Assembly Final Project
# University of Toronto, Scarborough
#
# Student: Stephen, 1006313231, guostep2
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8 (update this as needed)
# - Unit height in pixels: 8 (update this as needed)
# - Display width in pixels: 512 (update this as needed)
# - Display height in pixels: 512 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 4 
#
# Which approved features have been implemented for milestone 4?
# (See the assignment handout for the list of additional features)
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
# $t1, location of player

# Game info
.eqv BASE_ADDRESS 	0x10008000
.eqv CANVAS_WIDTH 	64
.eqv CANVAS_HEIGHT 	64
.eqv REFRESH_RATE 	40 # in miliseconds
.eqv RESPAWN_TIME	20
.eqv LASER_CD 		300
.eqv MAX_OBSTACLES	16
.eqv ADD_ENEMY		175 # add enemy every 7 seconds

# Colors
.eqv PLAYER_BODY	0xffffff
.eqv PLAYER_EYE		0x7e00ff
.eqv BACKGROUND_COLOR	0xfcb945
.eqv OBSTACLE_EAR	0x000000
.eqv OBSTACLE_BODY	0xff6df3
.eqv OBSTACLE_EYE	0xff0000
.eqv LIVES_COLOR	0xff0000

.data
Obstacles: 		.space 	64 # Max 12 obstacles
Lives: 			.word 	3  # Number of lives
Num_Obstacles: 		.word	4  # Starting number of obstacles
LaserReady: 		.word	1  # Check if laser is ready
LaserCoolDownTimer: 	.word	0  # Timer for laser cooldown

.text
# draw title here!

jal DrawCanvas

Title_Loop:
li $t9, 0xffff0000	# keyboard
	lw $t8, 0($t9)
	beq $t8, 1, Title_Loop_KeyPressed
	Title_Loop_Sleep:
		li $v0, 32		# sleeps before looping
		li $a0, REFRESH_RATE
		syscall
		j Title_Loop
	
	Title_Loop_KeyPressed:
		lw $t4, 4($t9)
		beq $t4, 112, pPressed
		j Title_Loop

Begin:
	li $t0, 0
	li $t5, BACKGROUND_COLOR	# $t3 stores the blue colour code
	
	# Calculates the beginning position of the player and stores it in $t1
	li $t2, CANVAS_WIDTH
	li $t1, CANVAS_HEIGHT
	subi $t1, $t1, 3 
	mult $t1, $t2 		# CANVAS_WIDTH * (CANVAS_HEIGHT - 1) in $t1
	mflo $t1
	sra $t2, $t2, 1 	# CANVAS_WIDTH // 2
	sub $t1, $t1, $t2 	# (CANVAS_WIDTH * (CANVAS_HEIGHT - 1)) - (CANVAS_WIDTH // 2)
	
	jal DrawCanvas
	jal DrawPlayer
	
	# Obstacles
	li $v0, 42
	li $a1, CANVAS_WIDTH
	subi $a1, $a1, 4
	li $t4, 0
	#la $t5, Num_Obstacles
	#lw $t5, 0($t5)
	li $t5, MAX_OBSTACLES
	#li $t5, NUM_OBSTACLES 		# number of obstacles
	la $t2, Obstacles 	# address of Obstacles array in $t2
	InitObstacles_Loop:
		bge $t4, $t5, InitObstacles_LoopEnd 	# Loops 5 times
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
	mult $t3, $t2 		# CANVAS_WIDTH * CANVAS_HEIGHT 
	mflo $t2
	li $t3, 4
	mult $t2,$t3 		# CANVAS_WIDTH * CANVAS_HEIGHT * 4
	mflo $t3
	
	addi $t2, $zero, BASE_ADDRESS 	# t2 = address
	addi $t3, $t3, BASE_ADDRESS 	# t3 = address + CANVAS_WIDTH * CANVAS_HEIGHT * 4
	
	DrawCanvas_Loop:	# Draws every pixel in the canvas
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
	subi $t4, $t4, CANVAS_WIDTH 		# location - width - width
	subi $t4, $t4, 2 			# location - width - width - 2
	bltz $t4, DrawPlayer_If 		# branch if not a valid location
	j DrawPlayer_Else
	DrawPlayer_If:				# starts at top of player
		addi $t4, $t4, CANVAS_WIDTH
		j DrawPlayer_After
	DrawPlayer_Else:
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS		# start hardcoding pixels to draw
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
		addi $t4, $t4, BASE_ADDRESS		# start hardcoding pixels to draw
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
		addi $t4, $t4, BASE_ADDRESS		# start hardcoding pixels to draw
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
		addi $t4, $t4, BASE_ADDRESS		# start hardcoding pixels to draw
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
		addi $t4, $t4, BASE_ADDRESS		# start hardcoding pixels to draw
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
	mult $t3, $t2 			# CANVAS_WIDTH * CANVAS_HEIGHT -2
	mflo $t2
	li $t3, 4
	mult $t2,$t3 			# CANVAS_WIDTH * CANVAS_HEIGHT - 2 * 4
	mflo $t4
	addi $t4, $t4, BASE_ADDRESS
	addi $t4,  $t4, 12  		# CANVAS_WIDTH * CANVAS_HEIGHT - 2 * 4 + 8

	la $t2, Lives 			# address of lives array in $t2
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
	la $t3, Num_Obstacles
	lw $t3, 0($t3)
	#li $t3 NUM_OBSTACLES 		# number of obstacles
	bge $t8, $t3 DrawObstacles_LoopEnd
	
	li $t6, CANVAS_WIDTH
	li $t3, CANVAS_HEIGHT
	mult $t6, $t3
	mflo $t7 			# width * height in $t7
	
	li $t3, -1
	lw $t4, 0($t2) 			# get value of array
	beq $t4, $t3, DrawObstacles_DontDraw # don't draw if value is -1
	j DrawObstacles_Draw
	DrawObstacles_DontDraw:
		addi $t2, $t2, 4
		addi $t8, $t8, 1
		j DrawObstacles_Loop
	DrawObstacles_Draw:
	li $t3, 4
	subi $t4, $t4, CANVAS_WIDTH 	# location - width
	subi $t4, $t4, CANVAS_WIDTH 	# location - width - width
	subi $t4, $t4, 2 		# location - width - width - 2
	
	subi $t4, $t4, CANVAS_WIDTH 	# location - width - width - width -2
	# location - width - width - 2
	bltz $t4, DrawObstacles_If0
	j DrawObstacles_Else0
	DrawObstacles_If0:
		j DrawObstacles_After0
	DrawObstacles_Else0:
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS
		li $t5, BACKGROUND_COLOR
		sw $t5, 0($t4) 
		addi $t4, $t4, 16
		sw $t5, 0($t4) 
	DrawObstacles_After0:
	lw $t4, 0($t2)
	subi $t4, $t4, CANVAS_WIDTH
	subi $t4, $t4, CANVAS_WIDTH
	subi $t4, $t4, 2
	
	bltz $t4, DrawObstacles_If 	# branch if not a valid location
	j DrawObstacles_Else
	
	DrawObstacles_If:
		addi $t4, $t4, CANVAS_WIDTH
		j DrawObstacles_After
	DrawObstacles_Else:
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
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
		lw $t4, 0($t2) 			# get value of array
		subi $t4, $t4, CANVAS_WIDTH 	# location - width
		subi $t4, $t4, 2 		# location - width - 2
	DrawObstacles_After:
		bltz $t4, DrawObstacles_After2
		j DrawObstacles_Else2
	DrawObstacles_Else2:
		mult $t4, $t3
		mflo $t4 			# multiplies address by 4
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
		lw $t4, 0($t2)
		subi $t4, $t4, 3 	# location - 2
		mult $t4, $t3
		mflo $t4 		# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS	
		li $t5, BACKGROUND_COLOR
		addi $t4, $t4, 4
		sw $t5, 0($t4)
		addi $t4, $t4, 4	# start hardcoding pixels to draw
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
		bgt $t4,$t7, DrawObstacles_After3
		j DrawObstacles_Else3
	DrawObstacles_Else3:
		mult $t4, $t3
		mflo $t4 		# multiplies address by 4
		addi $t4, $t4, BASE_ADDRESS 	# start hardcoding pixels to draw
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
		bgt $t4,$t7, DrawObstacles_After4
		j DrawObstacles_Else4
	DrawObstacles_Else4:
		mult $t4, $t3
		mflo $t4 		# multiplies address by 4
		addi $t4, $t4, 4 	# start hardcoding pixels to draw
		addi $t4, $t4, BASE_ADDRESS
		sw $t5, 0($t4)
		addi $t4, $t4, 8
		sw $t5, 0($t4)
	DrawObstacles_After4:
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
	mflo $t2 # width * (height - 1) in $t2
	li $t3, 4
	mult $t2, $t3
	mflo $t2 # 4 * width * (height - 1) in $t2
	subi $t2, $t2, 8
	addi $t2, $t2, BASE_ADDRESS
	li $t5, PLAYER_EYE
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
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	subi $t2, $t2, CANVAS_HEIGHT
	sw $t5, 0($t2)
	jr $ra

MainLoop_Begin:
	#jal DrawCanvas
	jal DrawObstacles
	#jal DrawPlayer
	jal DrawLives
	la $t3, LaserReady
	lw $t3, 0($t3)
	beqz $t3, DontDrawLaser
	jal DrawLaserIcon
	j DontDrawLaser_After
	DontDrawLaser:
		la $t3, LaserCoolDownTimer
		lw $t4, 0($t3)
		addi $t4, $t4, 1
		sw $t4, 0($t3) # increment cooldown
		li $t2, LASER_CD
		beq $t4, $t2, SetLaser # check if cooldown is up
		j DontDrawLaser_After
		SetLaser:
			li $t2, 0
			sw $t2, 0($t3)
			la $t3, LaserReady
			li $t2, 1
			sw $t2, 0($t3) # sets laser as ready
	DontDrawLaser_After:
	
	# width * (height - 1) in t5
	li $t3, CANVAS_WIDTH
	li $t2, CANVAS_HEIGHT
	subi $t2, $t2, 1 
	mult $t3, $t2
	mflo $t5 
	# temp maybe?
	addi $t5, $t5, CANVAS_WIDTH
	addi $t5, $t5, CANVAS_WIDTH
	addi $t5, $t5, CANVAS_WIDTH
	
	li $t3, CANVAS_WIDTH 	# increment obstacles by
	la $t2, Obstacles 	# address of array
	li $t7, 0
	la $t8, Num_Obstacles
	lw $t8, 0($t8)
	#li $t8, NUM_OBSTACLES 	# number of obstacles to loop through
	li $t9, -1
	MainLoop_IncrementObstacleLoop:
		bge $t7, $t8 MainLoop_IncrementObstacleLoopEnd
		lw $t4, 0($t2) 			# obstacle value
		beq $t4, -1, Obstacles_Wait	# check if obstacle is in screen
		bge $t4, $t5 Obstacles_SetNegative 	# if can't inrement obstacle
		j Obstacles_Else
		Obstacles_SetNegative:
			sw $t9, 0($t2)
			j Obstacles_Wait
		
		Obstacles_Wait:
			li $v0, 42
			li $a0, 0
			li $a1, RESPAWN_TIME # respawn time???
			syscall
			add $t6, $zero, $a0
			bge $t6, 19, Obstacles_If
			j Obstacles_next
		Obstacles_If:
			li $v0, 42
			li $a0, 0
			li $a1, CANVAS_WIDTH
			subi $a1, $a1, 4
			syscall
			add $t6, $zero, $a0 	# store a random number in t3
			addi, $t6, $t6, 2
			sw $t6, 0($t2)
			#addi $t2, $t2, 4 	# increment address
			j Obstacles_next
		Obstacles_Else:
			add $t4, $t4, $t3 	# increment
			sw $t4, 0($t2) 		# store it back
			#addi $t2, $t2, 4 	# increment address
		Obstacles_next:
		addi $t2, $t2, 4 	# increment address
		addi $t7, $t7, 1
	j MainLoop_IncrementObstacleLoop
	
	MainLoop_IncrementObstacleLoopEnd:
	jal CheckCollision
	
	li $t9, 0xffff0000	# keyboard
	lw $t8, 0($t9)
	beq $t8, 1, KeyPressed

	MainLoop_Sleep:
		li $v0, 32		# sleeps before looping
		li $a0, REFRESH_RATE
		syscall
	
	addi $t0, $t0, 1
	li $t9, ADD_ENEMY # adds enemy every 7 seconds
	div $t0, $t9
	mfhi $t9 # game time % 250
	
	beq $t9, $zero Increment_NumEnemies
	j MainLoop_Begin
	
	Increment_NumEnemies:
		
		la $t8 Num_Obstacles
		lw $t7, 0($t8)
		
		li $t9, MAX_OBSTACLES
		bge $t7, $t9 MainLoop_Begin # don't increment if there's MAX_OBSTACLES enemies
		
		addi $t7, $t7, 1
		sw $t7, 0($t8)
	
	j MainLoop_Begin

KeyPressed:
	lw $t4, 4($t9)
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
		beqz $t2, aPressed_If 	# if current position is at edge
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
			sw $t5, 0($t4)
			
			addi $t4, $t4, 4
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			#li $t5, LIVES_COLOR
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
		blt $t1, $t6, wPressed_If 	# position at the top
		subi $t6, $t6, CANVAS_WIDTH
		subi $t6, $t6, CANVAS_WIDTH
		sub $t1, $t1, $t6
		
		
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
			sw $t5, 0($t4)
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
			sw $t5, 0($t4)
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
		beq $t2, $t6 dPressed_If 	# at right edge
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
			sw $t5, 0($t4)
			
			subi $t4, $t4, 4
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			addi $t4, $t4, CANVAS_WIDTH
			#li $t5, LIVES_COLOR
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
		li $t2, 0 # reset laser status
		sw $t2, 0($t3)
		la $t3, LaserReady
		li $t2, 1
		sw $t2, 0($t3)
			
		la $t8 Num_Obstacles # reset number of enemies
		li $t9, 4
		sw $t9, 0($t8)
		li $t0, 0# reset game timer
		
		la $t7, Lives
		li $t6, 3
		sw $t6, 0($t7)
		jal DrawCanvas
		#jal DrawObstacles #debug
		#jal DrawPlayer #debug
		#jal DrawLives #debug
		li $v0, 32		# sleeps
		li $a0, 1000
		syscall
		j Begin #debug
		
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
		addi $t2, $t2, BASE_ADDRESS # get current position of player
		subi $t2, $t2, 4
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
		subi $t2, $t2, CANVAS_WIDTH
		
		li $t3, PLAYER_EYE
		li $v0, 32		# sleeps before looping
		li $a0, 5
		la $t6, Obstacles
		
		drawLaser:
			blt $t2, BASE_ADDRESS, drawLaser_End
			sw $t3, 0($t2)
			addi $t2, $t2, 8
			sw $t3, 0($t2)
			subi $t2, $t2, 8
			subi $t2, $t2, CANVAS_WIDTH
			subi $t2, $t2, CANVAS_WIDTH
			subi $t2, $t2, CANVAS_WIDTH
			subi $t2, $t2, CANVAS_WIDTH

			syscall
			
			j drawLaser
			drawLaser_End:
			li $a0, 250
			syscall
			
			la $t2, Num_Obstacles
			lw $t4, 0($t2) # get number of obstacl;es
			li $t5, 0
			
				
			kill_Obstacles:
				bge $t5, $t4, kill_Obstacles_End
				
				lw $t2, 0($t6) # get array value
				li $t7, CANVAS_WIDTH
				div $t1, $t7 
				mfhi $t8 # get x value of player
				div $t2, $t7 
				mfhi $t9 # get x value of obstacle
				
				
				bge $t9, $t8 kill_ObstaclesAbsIf # if obstacle x is greater than player x
				j kill_ObstaclesAbsElse
				kill_ObstaclesAbsIf:	
					sub $t9, $t9, $t8
					j kill_ObstaclesAbsAfter
				kill_ObstaclesAbsElse:
					sub $t9, $t8, $t9 # x distance in $t9
				kill_ObstaclesAbsAfter:
				
				
				li $t7, 3 # branch if collision detected
				ble $t9, $t7, kill_Obstacles_Collision
				j kill_Obstacles_CollisionAfter
				kill_Obstacles_Collision:
					li $t7, -1
					sw $t7, 0($t6)
				kill_Obstacles_CollisionAfter:
				addi $t5, $t5, 1
				addi $t6, $t6, 4
				j kill_Obstacles
			kill_Obstacles_End:
			
			jal DrawCanvas
			jal DrawObstacles
			jal DrawPlayer
			
		
		
		j MainLoop_Sleep
CheckCollision:
	la $t2, Obstacles
	li $t8, 0
	#li $t9, NUM_OBSTACLES
	la $t9, Num_Obstacles
	lw $t9, 0($t9)
	CheckCollision_Loop:
		bge $t8, $t9, CheckCollision_LoopEnd
		
		lw $t5, 0($t2) # get array value
		li $t3, CANVAS_WIDTH
		div $t1, $t3 
		mfhi $t4 # get x value of player
		mflo $t6 # get y value of player
		div $t5, $t3 
		mfhi $t3 # get x value of obstacle
		bge $t3, $t4 CheckCollision_xAbsIf # if obstacle x is greater than player x
		j CheckCollision_xAbsElse
		CheckCollision_xAbsIf:	
			sub $t3, $t3, $t4
			j CheckCollision_xAbsAfter
		CheckCollision_xAbsElse:
			sub $t3, $t4, $t3 # x distance in $t3
		CheckCollision_xAbsAfter:
		
		mflo $t4 # get y value of obstacle
		bge $t4, $t6 CheckCollision_yAbsIf # if obstacle y is greater than player y
		j CheckCollision_yAbsElse
		CheckCollision_yAbsIf:	
			sub $t4, $t4, $t6
			j CheckCollision_yAbsAfter
		CheckCollision_yAbsElse:
			sub $t4, $t6, $t4 # y distance in $t4
		CheckCollision_yAbsAfter:
		
		add $t3, $t3, $t4 # store distance in $t3
		li $t4, 5 # branch if collision detecte
		ble $t3, $t4, CheckCollision_DecreaseLives
	
	CheckCollision_Iterate:
		addi $t8, $t8, 1
		addi $t2, $t2, 4
		j CheckCollision_Loop
		
	CheckCollision_DecreaseLives:
		li $v0, 32		# sleeps
		li $a0, 1000
		syscall
		
		li $t3, -1
		sw $t4, 0($t2)
		
		la $t7, Lives
		lw $t6, 0($t7)
		subi $t6, $t6, 1
		sw $t6, 0($t7)
		beqz $t6, End # ends game if no lives
		
		addi $sp, $sp, -4 # nested call for draw canvas
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
li $v0, 32		# sleeps
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

End_Loop:
	li $t9, 0xffff0000	# keyboard
	lw $t8, 0($t9)
	beq $t8, 1, End_Loop_KeyPressed
	End_Loop_Sleep:
		li $v0, 32		# sleeps before looping
		li $a0, REFRESH_RATE
		syscall
		j End_Loop
	
	End_Loop_KeyPressed:
		lw $t4, 4($t9)
		beq $t4, 112, pPressed
		j End_Loop

	li $v0, 10		# terminate the program gracefully
	syscall
