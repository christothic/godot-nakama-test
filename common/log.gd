extends Node


enum LEVEL {NONE, ERROR, WARNING, INFO, VERBOSE, DEBUG}


@onready var _console: Console = ConsoleNode
const LOG_PATH: = "user://console_log.txt"
var file: FileAccess = FileAccess.open(LOG_PATH, FileAccess.WRITE)
var log_level: = LEVEL.DEBUG


func get_log_level_string(log_level: LEVEL) -> String:
    match log_level:
        LEVEL.NONE:
            return "[NONE] "
        LEVEL.ERROR:
            return "[ERROR] "
        LEVEL.WARNING:
            return "[WARNING] "
        LEVEL.INFO:
            return "[INFO] "
        LEVEL.VERBOSE:
            return "[VERBOSE] "
        LEVEL.DEBUG:
            return "[DEBUG] "
        _:
            return "[INVALID] "
    
    
func everywhere(content: Variant, log_level: LEVEL = LEVEL.DEBUG) -> void:
    if (log_level == LEVEL.NONE 
        or log_level > self.log_level):
        return
    var to_print: = get_log_level_string(log_level) + str(content)
    print(to_print)
    if file:
        file.store_line(to_print)
    if _console:
        _console.add(to_print)
    
    
#func _notification(what) -> void:
    #if what == NOTIFICATION_WM_CLOSE_REQUEST:
        #file.close()
        
        
func _exit_tree() -> void:
    file.close()
