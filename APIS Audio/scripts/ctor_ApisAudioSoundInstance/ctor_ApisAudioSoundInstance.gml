function ApisAudioSoundInstance(_definition) constructor {
    definition = _definition;
    
    static is_playing = function() {
        throw ApisAudioException.method_not_implemented(self, nameof(is_playing));
    }
    
    static modify = function(_settings) {
        throw ApisAudioException.method_not_implemented(self, nameof(modify));
    }
    
    static stop = function() {
        throw ApisAudioException.method_not_implemented(self, nameof(stop));
    }
    
    static apply_gain = function(_gain) {
        throw ApisAudioException.method_not_implemented(self, nameof(apply_gain));
    }
}