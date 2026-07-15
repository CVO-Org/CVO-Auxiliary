class CfgAILevelPresets {
    class Custom;
    class GVAR(LevelAI): Custom {
        displayName = CSTRING(DifficultyName);

        skillAI = 0.90;
        precisionAI = 0.35;
    };
};