function ApisAudioSimpleAutoRegistration() : ApisAudioAssetAutoRegistration() constructor {
    static register_asset = function(_asset) {
        return ApisAudioSimpleSoundDefinition.define(_asset);
    }
}