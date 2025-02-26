function ApisAudioRegistry() constructor {
    channels = [];
    channels_by_identifier = {};
    
    sounds_by_identifier = {};
    sounds_by_asset = ds_map_create();
    auto_register = undefined;
    
    static with_auto_register = function(_autoregister) {
        auto_register = _autoregister;
        return self;
    }
    
    static register_channel_identifier = function(_channel, _identifier) {
        if (!array_contains(channels, _channel))
            array_push(channels, _channel);
        
        var _key = string_lower(_identifier);
        if (struct_exists(channels_by_identifier, _key))
            throw ApisAudioException.duplicate_channel_identifier(_channel);
        
        channels_by_identifier[$ _key] = _channel;
    }
    
    static register_sound_identifier = function(_sound, _identifier) {
        var _key = string_lower(_identifier);
        if (struct_exists(sounds_by_identifier, _key))
            throw ApisAudioException.duplicate_sound_identifier(_sound, _identifier);
        
        sounds_by_identifier[$ _key] = _sound;
    }
    
    static register_sound_asset = function(_sound, _asset) {
        if (ds_map_exists(sounds_by_asset, _asset))
            throw ApisAudioException.duplicate_sound_asset(_sound, _asset);
        
        sounds_by_asset[? _asset]  = _sound;
    }
    
    static get_channel = function(_channel) {
        if (is_undefined(_channel))
            return undefined;
        
        if (is_instanceof(_channel, ApisAudioChannel))
            return _channel;
        
        if (is_string(_channel)) {
            var _key = string_lower(_channel);
            var _resolved = channels_by_identifier[$ _key];
            if (is_undefined(_resolved))
                throw ApisAudioException.unknown_channel(_channel);
            
            return _resolved;
        }
        
        throw ApisAudioException.unknown_channel(_channel);
    }
    
    static get_sound_definition = function(_sound) {
        if (is_undefined(_sound))
            return undefined;
        
        if (is_instanceof(_sound, ApisAudioSoundDefinition))
            return _sound;
        
        if (audio_exists(_sound)) {
            var _resolved = sounds_by_asset[? _sound];
            if (is_undefined(_resolved))
                _resolved = auto_register.register_asset(_sound);
            
            return _resolved;
        }
        
        if (is_string(_sound)) {
            var _key = string_lower(_sound);
            var _resolved = sounds_by_identifier[$ _key];
            if (is_undefined(_resolved))
                throw ApisAudioException.unknown_sound_definition(_sound);
            
            return _resolved;
        }
        
        throw ApisAudioException.unknown_sound_definition(_sound);
    }
    
    static cleanup = function() {
        ds_map_destroy(sounds_by_asset);
    }
}
