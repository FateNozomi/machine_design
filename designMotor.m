function final = designMotor()
polesPrompt = 'Enter number of poles: ';
slotsPrompt = 'Enter number of slots: ';
nomCoilSpanPrompt = 'Enter nominal coil span: ';
POLES = input(polesPrompt);
SLOTS = input(slotsPrompt);
nomCoilSpan = input(nomCoilSpanPrompt);

% POLES = 10;
% SLOTS = 12;
% nomCoilSpan = 1;
% find relative angle of all potential coils
relativeAngle = POLES / SLOTS * 180;

i = 0; % Initialize the column size of array 's'
slotOut = nomCoilSpan; % Initialize SlotOut value
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
        s(3,i) = slotOut - (SLOTS); %assign number of slotOut to row 3
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
z = s; %Assign 's' into a new array 'z' so that 's' remains untouched.
zAngle = z(1,:); %Get the angle row
% All zAngle negative values are increased by 1 so that the min index will
% always get negative values first. (Quick hack)
zAngle(zAngle<0) = (zAngle(zAngle<0)+1);

for i = 1:SLOTS
    % index returns the position of the minimum value
    [phaseA_abs(i),index] = min(abs(zAngle(1,i:end)));
    % reposition zAngle from min to max
    zAngle(:,[i index+k]) = zAngle(:,[index+k i]);
    % reposition z from min to max
    z(:,[i index+k]) = z(:,[index+k i]);
    
    k = k + 1; %increase k to compensate shrinking zAngle and z
end

phase = zeros(2,slotsPerPhase,3);
phaseOffset = SLOTS-slotsPerPhase;

%Assign Phase A
phaseA = z([2 3],1:slotsPerPhase);
phase(:,:,1) = phaseA;

% Assign Phase B
phaseB = phaseA + (phaseOffset);
%Minus SLOTS if more than SLOTS
phaseB(phaseB>SLOTS) = (phaseB(phaseB>SLOTS)-SLOTS);
phase(:,:,2) = phaseB;

% Assign Phase C
phaseC = phaseB + (phaseOffset);
%Minus SLOTS if more than SLOTS
phaseC(phaseC>SLOTS) = (phaseC(phaseC>SLOTS)-SLOTS);
phase(:,:,3) = phaseC;

% Assign 's' and 'phase' into a cell array
final = {s phase};
fprintf('To view final angle, enter: s = ans{1}\n');
fprintf('To view winding layout, enter: phase = ans{2}');
end
