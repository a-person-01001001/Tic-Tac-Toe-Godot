extends Node2D


# VARIABLES
var xTexture = $spriteX.texture.get_data()
var oTexture = $spriteO.texture.get_data()
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
	else: # If it is a valid square
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
			return Vector2(392, 180)

		elif pos.y >= 240 and pos.y <= 360:
			return Vector2(392, 300)

		else:
			return Vector2(392, 420)


	elif pos.x >= 452 and pos.x <= 572: # 1, x

		if pos.y >= 120 and pos.y <= 240:
			return Vector2(512, 180)

		elif pos.y >= 240 and pos.y <= 360:
			return Vector2(512, 300)

		else:
			return Vector2(512, 420)


	elif pos.x >= 572 and pos.x <= 692: # 2, x

		if pos.y >= 120 and pos.y <= 240:
			return Vector2(632, 180)

		elif pos.y >= 240 and pos.y <= 360:
			return Vector2(632, 300)

		else:
			return Vector2(632, 420)

	else:
		pass


func _input(event):
	if event is InputEventMouseButton:
		print("I got here")
		setSquare(event)
		print("before for")
		for item in x_locations:
			draw_texture(xTexture, item)
		print("after x for")
		for item in o_locations:
			draw_texture(oTexture, item)
		print("after o for")


#func _draw(): # DEBUG
#	var point = PoolVector2Array([Vector2(512, 0), Vector2(512, 600)])
#	var color = PoolColorArray([Color(0, 0, 0)])
#	draw_primitive(point, color, PoolVector2Array(), null, 50)
