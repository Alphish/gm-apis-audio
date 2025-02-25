function ApisAudioSoundDefinition(_identifier) constructor {
    identifier = _identifier;
    
    static play_once = function(_settings = undefined) {
        throw ApisAudioException.method_not_implemented(self, nameof(play_once));
    }
    
    static play_loop = function(_settings = undefined) {
        throw ApisAudioException.method_not_implemented(self, nameof(play_loop));
    }
}
