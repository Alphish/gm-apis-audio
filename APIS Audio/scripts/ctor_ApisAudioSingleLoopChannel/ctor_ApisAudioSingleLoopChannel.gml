function ApisAudioSingleLoopChannel(_identifier, _volume, _maxvolume = _volume) : ApisAudioChannel(_identifier, _volume, _maxvolume) constructor {
    current_track_definition = undefined;
    current_track_settings = undefined;
    current_track_instance = undefined;
    
    // --------
    // Playback
    // --------
    
    static play = function(_sound, _settings = undefined) {
        if (current_track_definition == _sound) {
            modify(_sound, _settings);
            return;
        }
        
        if (!is_undefined(current_track_instance)) {
            current_track_instance.stop();
            current_track_instance = undefined;
        }
        
        current_track_definition = _sound;
        current_track_settings = _settings;
        if (!channel_is_muted && !is_undefined(current_track_definition)) {
            current_track_instance = current_track_definition.play_loop(_settings);
            current_track_instance.apply_gain(channel_volume / channel_max_volume);
        }
    }
    
    static modify = function(_sound, _settings) {
        current_track_settings = _settings;
        if (current_track_definition == _sound && !is_undefined(current_track_instance))
            current_track_instance.modify(_settings);
    }
    
    static stop = function(_sound) {
        if (current_track_definition == _sound) {
            if (!is_undefined(current_track_instance))
                current_track_instance.stop();
            
            current_track_definition = undefined;
            current_track_settings = undefined;
            current_track_instance = undefined;
        }
    }
    
    static stop_all = function() {
        if (!is_undefined(current_track_instance)) {
            current_track_instance.stop();
        }
        current_track_definition = undefined;
        current_track_settings = undefined;
        current_track_instance = undefined;
    }
    
    static apply_gain = function(_gain) {
        if (!is_undefined(current_track_instance))
            current_track_instance.apply_gain(_gain);
    }
    
    static apply_mute = function() {
        if (!is_undefined(current_track_instance)) {
            current_track_instance.stop();
            current_track_instance = undefined;
        }
    }
    
    static apply_unmute = function(_gain) {
        if (!is_undefined(current_track_definition)) {
            current_track_instance = current_track_definition.play_loop(current_track_settings);
            current_track_instance.apply_gain(_gain);
        }
    }
}

ApisAudioSingleLoopChannel.define = function(_identifier, _volume, _maxvolume = _volume) {
    var _channel = new ApisAudioSingleLoopChannel(_identifier, _volume, _maxvolume);
    apis_audio_register_channel(_channel, _identifier);
    return _channel;
}
