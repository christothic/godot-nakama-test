extends Control


@onready var _user_name_field: LineEdit = %UserNameField
@onready var _password_field: LineEdit = %PasswordField


func _ready() -> void:
    _user_name_field.grab_focus()


func _on_user_name_field_text_submitted(_new_text: String) -> void:
    _password_field.grab_focus()
    

func _on_password_field_text_submitted(new_text: String) -> void:
    if await API.login(_user_name_field.text, new_text):
        pass #next screen

