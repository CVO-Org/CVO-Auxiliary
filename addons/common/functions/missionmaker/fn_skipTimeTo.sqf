params [
    ["_desired", 0, [0]]
];

private _desired = 1 + 49/60;

private _current = daytime;

private _timeToSkip = switch (true) do {
    case ( _desired > _current ): {  _desired - _current };
    case ( _desired < _current ): { (_current - _desired) * -1 };
    default { 0 };
};

skipTime _timeToSkip;

setTimeMultiplier 1;