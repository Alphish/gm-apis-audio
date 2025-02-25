function ApisAudioChannel(_volume, _maxvolume = _volume) constructor {
    channel_volume = _volume;
    channel_max_volume = _maxvolume;
    channel_is_muted = false;
    
    // --------
    // Playback
    // --------
    
    static play = function(_sound, _settings = undefined) {
        throw ApisAudioException.method_not_implemented(self, nameof(play));
    }
    
    static modify = function(_sound, _settings) {
        throw ApisAudioException.method_not_implemented(self, nameof(modify));
    }
    
    static stop = function(_sound) {
        throw ApisAudioException.method_not_implemented(self, nameof(stop));
    }
    
    static stop_all = function() {
        throw ApisAudioException.method_not_implemented(self, nameof(stop_all));
    }
    
    // --------------
    // Volume control
    // --------------
    
    static get_volume = function() {
        return channel_volume;
    }
    
    static set_volume = function(_volume) {
        if (_volume == channel_volume)
            return;
        
        channel_volume = clamp(_volume, 0, channel_max_volume);
        apply_gain(channel_volume / channel_max_volume);
    }
    
    static apply_gain = function(_gain) {
        throw ApisAudioException.method_not_implemented(self, nameof(apply_gain));
    }
    
    static mute = function() {
        if (channel_is_muted)
            return;
        
        channel_is_muted = true;
        apply_mute();
    }
    
    static apply_mute = function() {
        throw ApisAudioException.method_not_implemented(self, nameof(apply_mute));
    }
    
    static unmute = function() {
        if (!channel_is_muted)
            return;
        
        channel_is_muted = false;
        apply_unmute(channel_volume / channel_max_volume);
    }

    static apply_unmute = function(_gain) {
        throw ApisAudioException.method_not_implemented(self, nameof(apply_unmute));
    }
    
    // ----------
    // Management
    // ----------
    
    static update = function() {
        // no per-channel update logic by default
    }
}
