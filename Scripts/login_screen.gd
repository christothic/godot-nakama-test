extends Control


@onready var user_name_field: LineEdit = %UserNameField
@onready var password_field: LineEdit = %PasswordField


func _ready() -> void:
    
    pass


func _on_user_name_field_text_submitted(new_text: String) -> void:
    password_field.grab_focus()
    

func _on_password_field_text_submitted(new_text: String) -> void:
    Log.everywhere(await API.login(user_name_field.text, password_field.text))
    
