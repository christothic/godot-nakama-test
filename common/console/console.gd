class_name Console
extends TextEdit


func setup_console() -> void:
    await get_tree().create_timer(0.001).timeout
    set_v_scroll(get_v_scroll_bar().max_value)
    move_to_front()
    hide()
    set_smooth_scroll_enabled(true)
    
    
func _ready() -> void:
    setup_console()
    
    
func _input(_event: InputEvent) -> void:
    if Input.is_action_just_pressed("console"):
        visible = !visible
        if visible:
            move_to_front()
            set_v_scroll(get_v_scroll_bar().max_value)


func add(content: String) -> void:
    text += content + "\n"
    set_v_scroll(get_v_scroll_bar().max_value)
