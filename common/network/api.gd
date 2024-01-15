##define USE_NAKAMA
extends Node


##if USE_NAKAMA
var nakama_client: NakamaClient = null
var nakama_session: NakamaSession = null
##endif


func _ready() -> void:
##if USE_NAKAMA
    var scheme: = "http"
    var host: = "www.devatstation.com"
    var port: = 7350
    var server_key: = "defaultkey"
    nakama_client = Nakama.create_client(server_key, host, port, scheme, 
                                            Nakama.DEFAULT_TIMEOUT, 
                                            NakamaLogger.LOG_LEVEL.INFO)
##endif
    pass


func login(user_name: String, password: String) -> bool:
##if USE_NAKAMA
    nakama_session = await nakama_client.authenticate_email_async(user_name, password)
    if nakama_session.exception:
        Log.everywhere("Nakama: " + str(nakama_session.exception), Log.LEVEL.ERROR)
        return false
##endif
    return true


func _process(_delta: float) -> void:
##if USE_NAKAMA
##endif
    pass
