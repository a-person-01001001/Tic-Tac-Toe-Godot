extends Node2D


# VARIABLES
var x_locations = [] # Fill with Vector2s of coordinates
var o_locations = [] # Fill with Vector2s of coordinates
var isXTurn = true


func draw_board():
	$board.position.x = 512
	$board.position.y = 300


# On ready
func _ready():
	draw_board()



func checkIfTaken(x, o, xTurn):
	if xTurn: # If it is X's turn
		for oloc in o: # Cycle through all of o's pieces
			if oloc in x: # And if one piece matches the square the player clicked
				return false # Don't place it
	elif not xTurn: # If it is not X's turn
		for xloc in x: # Cycle through all of X's pieces
			if xloc in o: # And if one piece matches the square the player clicked
				return false # Don't place it
	# If it is a valid square
	return true


func setSquare(event):
	if isXTurn: # If it's X's turn
		if event.button_index == BUTTON_LEFT and event.pressed: # Check if the Left Mouse Button was pressed
			print(event.as_text(), event.pressed)
			var square = getSquare(event.position)
			if checkIfTaken(square, o_locations, isXTurn):
				x_locations.append(square)

	elif not isXTurn:
		if event.button_index == BUTTON_LEFT and event.pressed: # Check if the Left Mouse Button was pressed
			var square = getSquare(event.position)
			if checkIfTaken(square, o_locations, isXTurn):
				o_locations.append(square)


func getSquare(pos):
	if pos.x >= 332 and pos.x <= 452: # 0, x

		if pos.y >= 120 and pos.y <= 240:
			return Vector2(305, 100)

		elif pos.y >= 240 and pos.y <= 360:
			return Vector2(305, 220)

		elif pos.y >= 360 and pos.y <= 480:
			return Vector2(305, 340)

# :musical_note::notes::joy:(Yeah:thumbsup: , aye):joy: It's:point_right:the:salt:thirst:droplet::cold_sweat:, thirstiest:hot_face::sweat_drops:time:alarm_clock:, of:cup_with_straw:the:warning:year:calendar_spiral:. (Aye:rofl:, yuh:ok_hand_tone4:):eyes:I:eye:have:flushed:just:point_up_tone4:one:one:query:question:(:flushed:What's:question:that?:thinking:)Wanna:man_raising_hand_tone4:Sprite:cup_with_straw::sunglasses:Cranberry:cherries::sweat_drops:?(:smirk:Uh:eyes:huh:smirk:)The:weary:answer :drooling_face:is :tumbler_glass:clear..:yum::wink:It's:point_right:the:hot_face::flushed:thirst,:shushing_face::face_with_hand_over_mouth:thirstiest:sweat_drops::sweat_drops::100:time:alarm_clock:, of:cup_with_straw:the:cherries:year.:date:(:cup_with_straw:Sprite:cherries:,let's:cherries::cherries::100:go:man_running_tone4:):notes::musical_note:

	elif pos.x >= 452 and pos.x <= 572: # 1, x

		if pos.y >= 120 and pos.y <= 240:
			return Vector2(430, 100)

		elif pos.y >= 240 and pos.y <= 360:
			return Vector2(430, 220)

		else:
			return Vector2(430, 340)


	elif pos.x >= 572 and pos.x <= 692: # 2, x

		if pos.y >= 120 and pos.y <= 240:
			return Vector2(550, 100)

		elif pos.y >= 240 and pos.y <= 360:
			return Vector2(550, 220)

		else:
			return Vector2(550, 340)

	else:
		return Vector2(0, 0)

func _input(event):

	if event is InputEventMouseButton:
		print("I got here")
		var loc = getSquare(event.position)
		if loc == Vector2(0, 0):
			pass
		else:
			setSquare(event)
			update()


func _draw():

	for pos in x_locations:
		draw_texture($spriteX.texture, pos)

	for pos in o_locations:
		draw_texture($spriteO.texture, pos)





#func _draw(): # DEBUG
#	var point = PoolVector2Array([Vector2(512, 0), Vector2(512, 600)])
#	var color = PoolColorArray([Color(0, 0, 0)])
#	draw_primitive(point, color, PoolVector2Array(), null, 50)

#var xTexture = $spriteX.texture.get_data()
#var oTexture = $spriteO.texture.get_data()
