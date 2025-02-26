function ApisAudioSimpleSoundInstance(_definition, _audio) : ApisAudioSoundInstance(_definition) constructor {
    audio_instance = _audio;
    original_gain = audio_sound_get_gain(audio_instance);
    
    static modify = function(_settings) {
        // do nothing
    }
    
    static stop = function() {
        audio_stop_sound(audio_instance);
    }
    
    static apply_gain = function(_gain) {
        audio_sound_gain(audio_instance, original_gain * _gain, 0);
    }
}
