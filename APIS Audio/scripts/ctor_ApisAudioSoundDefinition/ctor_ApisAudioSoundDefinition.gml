function ApisAudioSoundDefinition(_identifier) constructor {
    identifier = _identifier;
    default_channel = undefined;
    
    static with_default_channel = function(_channel) {
        default_channel = apis_audio_get_channel(_channel);
        return self;
    }
    
    static play_once = function(_settings = undefined) {
        throw ApisAudioException.method_not_implemented(self, nameof(play_once));
    }
    
    static play_loop = function(_settings = undefined) {
        throw ApisAudioException.method_not_implemented(self, nameof(play_loop));
    }
}
