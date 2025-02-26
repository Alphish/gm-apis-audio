function ApisAudioMultiSoundChannel(_identifier, _volume, _maxvolume = _volume) : ApisAudioChannel(_identifier, _volume, _maxvolume) constructor {
    playing_instances = [];
    
    // --------
    // Playback
    // --------
    
    static play = function(_sound, _settings = undefined) {
        if (channel_is_muted)
            return;
        
        var _instance = _sound.play_once(_settings);
        _instance.apply_gain(channel_volume / channel_max_volume);
        array_push(playing_instances, _instance);
    }
    
    static modify = function(_sound, _settings) {
        for (var _count = array_length(playing_instances), i = _count - 1; i >= 0; i--) {
            var _instance = playing_instances[i];
            if (_instance.definition != _sound)
                continue;
            
            _instance.modify(_settings);
        }
    }
    
    static stop = function(_sound) {
        for (var _count = array_length(playing_instances), i = _count - 1; i >= 0; i--) {
            var _instance = playing_instances[i];
            if (_instance.definition != _sound)
                continue;
            
            _instance.stop();
            array_delete(playing_instances, i, 1);
        }
    }
    
    static stop_all = function() {
        array_foreach(playing_instances, function(_sound) { return _sound.stop(); });
        array_resize(playing_instances, 0);
    }
    
    static apply_gain = function(_gain) {
        for (var i = 0, _count = array_length(playing_instances); i < _count; i++) {
            playing_instances[i].apply_gain(_gain);
        }
    }
    
    static apply_mute = function() {
        array_foreach(playing_instances, function(_sound) { return _sound.stop(); });
        array_resize(playing_instances, 0);
    }
    
    static apply_unmute = function(_gain) {
        // do nothing, sounds won't get restored
    }
    
    static update = function() {
        var _remaining_count = array_filter_ext(playing_instances, function(_sound) { return _sound.is_playing(); });
        array_resize(playing_instances, _remaining_count);
    }
}

ApisAudioMultiSoundChannel.define = function(_identifier, _volume, _maxvolume = _volume) {
    var _channel = new ApisAudioMultiSoundChannel(_identifier, _volume, _maxvolume);
    apis_audio_register_channel(_channel, _identifier);
    return _channel;
}
