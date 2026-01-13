extends Panel


#we need an onready variable so we can access our item display,so that we can change it
@onready var item_visual:Sprite2D=$CenterContainer/Panel/item_display

func update(item:InvItem):
	if !item:
		item_visual.visible=false
	else:
		item_visual.visible=true
		item_visual.texture=item.texture
		item_visual.scale = Vector2(0.05, 0.05)
