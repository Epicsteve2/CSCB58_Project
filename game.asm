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
# - Display width in pixels: 256 (update this as needed)
# - Display height in pixels: 256 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4 (choose the one the applies)
#
# Which approved features have been implemented for milestone 4?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# - yes / no / yes, and please share this project github link as well!
#
# Any additional information that the TA needs to know:
# - (write here, if any)
#
#####################################################################
# Bitmap display starter code
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#####################################################################
# $t0 = base address of canvas
# $t9, $t8, keyboard stuff
# $t4, check keyboard input
# $t1, location of player

.eqv BASE_ADDRESS 	0x10008000
.eqv CANVAS_WIDTH 	32
.eqv CANVAS_HEIGHT 	32
.eqv REFRESH_RATE 	100 # in miliseconds
.eqv PLAYER_COLOR	0x797979
.eqv BACKGROUND_COLOR	0xfcb945

.text
	li $t0, BASE_ADDRESS		# $t0 stores the base address for display
	li $t5, BACKGROUND_COLOR	# $t3 stores the blue colour code
	
	# Calculates the beginning position of the player and stores it in $t1
	li $t2, CANVAS_WIDTH
	li $t1, CANVAS_HEIGHT
	subi $t1, $t1, 1 
	mult $t1, $t2 		# CANVAS_WIDTH * (CANVAS_HEIGHT - 1) in $t1
	mflo $t1
	sra $t2, $t2, 1 	# CANVAS_WIDTH // 2
	sub $t1, $t1, $t2 	# (CANVAS_WIDTH * (CANVAS_HEIGHT - 1)) - (CANVAS_WIDTH // 2)
	j MainLoop_Begin
	
DrawCanvas:
	li $t5, BACKGROUND_COLOR
	li $t2, CANVAS_WIDTH
	li $t3, CANVAS_HEIGHT
	mult $t3, $t2 # CANVAS_WIDTH * CANVAS_HEIGHT 
	mflo $t2
	li $t3, 4
	mult $t2,$t3 # CANVAS_WIDTH * CANVAS_HEIGHT * 4
	mflo $t3
	
	add $t2, $zero, $t0 # t2 = address
	add $t3, $t3, $t0 # t3 = address + CANVAS_WIDTH * CANVAS_HEIGHT * 4
	
	DrawCanvas_Loop:
		beq $t2, $t3, DrawCanvas_End
		sw $t5, 0($t2)
		addi $t2, $t2, 4
		j DrawCanvas_Loop 
	
	DrawCanvas_End:
		jr $ra

DrawPlayer:
	li $t5, PLAYER_COLOR
	li $t2, 4
	mult $t1, $t2
	mflo $t2
	add $t6, $t2, $t0 
	sw $t5, 0($t6)
	jr $ra

MainLoop_Begin:
	jal DrawCanvas
	jal DrawPlayer

	li $t9, 0xffff0000	# keyboard
	lw $t8, 0($t9)
	beq $t8, 1, KeyPressed

	MainLoop_Sleep:
		li $v0, 32		# sleeps before looping
		li $a0, REFRESH_RATE
		syscall
	
		j MainLoop_Begin

KeyPressed:
	lw $t4, 4($t9)
	beq $t4, 97, aPressed
	beq $t4, 119, wPressed
	beq $t4, 115, sPressed
	beq $t4, 100, dPressed
	j MainLoop_Sleep

	aPressed:
		#li $t5, 0x0000ff
		li $t6, CANVAS_WIDTH
		div $t1, $t6
		mfhi $t2 # t2 = position % CANVAS_WIDTH
		beqz $t2, aPressed_If # if current position is at edge
		subi $t1, $t1, 1
		
		aPressed_If: # at edge
			j MainLoop_Sleep
			
	wPressed:
		li $t6, CANVAS_WIDTH
		blt $t1, $t6, wPressed_If # position at the top
		sub $t1, $t1, $t6
		
		wPressed_If:
			j MainLoop_Sleep
	sPressed:
		li $t6, CANVAS_WIDTH
		li $t2, CANVAS_HEIGHT
		subi $t2, $t2, 1
		mult $t6, $t2
		mflo $t2
		blt $t1, $t2, sPressed_If # position NOT at the bottom
		j MainLoop_Sleep
		
		sPressed_If:
			add $t1, $t1, $t6
			j MainLoop_Sleep
		
	dPressed:
		li $t6, CANVAS_WIDTH
		div $t1, $t6
		mfhi $t2 # t2 = position % CANVAS_WIDTH
		subi $t6, $t6, 1
		beq $t2, $t6 dPressed_If # at right edge
		addi $t1, $t1, 1
		
		dPressed_If:
			j MainLoop_Sleep

End:
	li $v0, 10		# terminate the program gracefully
	syscall
