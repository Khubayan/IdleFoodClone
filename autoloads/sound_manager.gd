extends Node


const COINS = preload("res://Idle Assets/Sound/coins.wav")
const NORMAL_SFX = preload("res://Idle Assets/Sound/normal sfx.mp3")

@export var stream_players: Array[AudioStreamPlayer]


func play_audio(clip: AudioStream, volume: float) -> void:
	var audio_player := get_available_player()
	if audio_player == null:
		print("audio is null")
		return
	audio_player.stream = clip
	audio_player.volume_db = volume
	audio_player.play()

func play_coins() -> void:
	play_audio(COINS, 15)

func play_ui() -> void:
	play_audio(NORMAL_SFX, 0.5)

func get_available_player() -> AudioStreamPlayer:
	for audio: AudioStreamPlayer in stream_players:
		if not audio.playing:
			return audio
	return null
