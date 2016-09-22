function s = designMotor()
polesPrompt = 'Enter number of poles: ';
slotsPrompt = 'Enter number of slots: ';
POLES = input(polesPrompt);
SLOTS = input(slotsPrompt);

% find relative angle of all potential coils
relativeAngle = POLES / SLOTS * 180;

i = 0; % Initialize the column size of array 's'
slotOut = 3; % Initialize SlotOut value
s = zeros(4,SLOTS); % Create an array of 3 x SLOTS

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
    
    s(1,i) = k; %assign all original angles to row 1
    s(2,i) = newAngle; %assign all newAngles to row 2
    s(3,i) = i; %asign number of slotIn to row 3
    
    slotOut = slotOut + 1; %increase slotOut in every loop
    if (slotOut) <= SLOTS
        % make slotOut start from 4 to total SLOTS
        s(4,i) = slotOut; %assign number of slotOut to row 4
    else
        % reset from 1 if slotOut exceeds total SLOTS 
        s(4,i) = slotOut - (SLOTS - 3); %assign number of slotOut to row 4
    end
    
    if sign(k) ~= sign(newAngle)
        % swap slotIn and SlotOut if sign changes between original and
        % converted values
        s([3 4],i) = s([4 3],i);
    end
end

%phase = zeros(3,SLOTS/3,3);
% z = s(1,:);
% slotsPerPhase = SLOTS/3;
% phaseA = zeros(1,slotsPerPhase);
% for i = 1:slotsPerPhase
%     [phaseA(i),index] = min(abs(z));
%     z(idx) = [];
% end
end
