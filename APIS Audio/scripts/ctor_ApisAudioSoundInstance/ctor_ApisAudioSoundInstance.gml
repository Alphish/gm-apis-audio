function ApisAudioSoundInstance(_definition) constructor {
    definition = _definition;
    
    static modify = function(_settings) {
        throw ApisAudioException.method_not_implemented(self, nameof(play_loop));
    }
    
    static stop = function() {
        throw ApisAudioException.method_not_implemented(self, nameof(play_loop));
    }
    
    static apply_gain = function(_gain) {
        throw ApisAudioException.method_not_implemented(self, nameof(apply_gain));
    }
}