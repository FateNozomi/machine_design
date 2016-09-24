function s = designMotor()
polesPrompt = 'Enter number of poles: ';
slotsPrompt = 'Enter number of slots: ';
POLES = input(polesPrompt);
SLOTS = input(slotsPrompt);

% find relative angle of all potential coils
relativeAngle = POLES / SLOTS * 180;

i = 0; % Initialize the column size of array 's'
slotOut = 3; % Initialize SlotOut value
s = zeros(3,SLOTS); % Create an array of 3 x SLOTS

% Create array S with angles, ins and outs.
%
%Creates object K with angles for a slots
for k = 0:relativeAngle:(relativeAngle*(SLOTS-1))
    
    % converts all angles to within -180<stage<180 degrees
    stage = rem((k + 180),360)-180;
    
    % converts stage to be within -90<stage<90 degrees
    if stage > 90
        newAngle = stage - 180;
    elseif stage < -90
        newAngle = stage + 180;
    else
        newAngle = stage;
    end
    
    % Increment the column size of array 's'
    i = i + 1;
    
    s(1,i) = newAngle; %assign all newAngles to row 1
    s(2,i) = i; %asign number of slotIn to row 2
    
    slotOut = slotOut + 1; %increase slotOut in every loop
    if (slotOut) <= SLOTS
        % make slotOut start from 4 to total SLOTS
        s(3,i) = slotOut; %assign number of slotOut to row 3
    else
        % reset from 1 if slotOut exceeds total SLOTS
        s(3,i) = slotOut - (SLOTS - 3); %assign number of slotOut to row 3
    end
    
    if sign(stage) ~= sign(newAngle)
        % swap slotIn and SlotOut if sign changes between original and
        % converted values
        s([2 3],i) = s([3 2],i);
    end
end

%% Reposition the potential coils
% The potential coils are repositioned for Phase A in array s to the first
% (slotsPerPhase) columns.

slotsPerPhase = SLOTS/3; %Get the number of slots per phase
phaseA_abs = zeros(1,slotsPerPhase); %Array to temporary store Phase A values

% In order to find the first (slotsPerPhase) values, we need to shrink the
% array by removing the previous indexed value.

% Initialize value k required for swapping columns in 's'. This is needed 
% due to the previous index being removed.
k = 0;
for i = 1:slotsPerPhase
    %
    [phaseA_abs(i),index] = min(abs(s(1,i:end)));
    
    s(:,[i index+k]) = s(:,[index+k i]);
    
    k = k + 1;
end
end
