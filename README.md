# Machine Design

This matlab function allows the user to obtain all parameters on slot/pole combination of a machine.

Upon running this function, designMotor.m accepts 3 input arguments listed below:
```
Enter number of poles:
Enter number of slots:
Enter nominal coil span:
```

The output of designMotor function returns a cell array. Below shows how to access the data in it.
```
To view final angle, enter: s = ans{1}
To view winding layout, enter: phase = ans{2}
```

Below shows the parameters of array 's'

|Parameters	| Values	|
|-----------|:-------:|
|Final Angle    |degree |
|In             |slot   |
|Out            |slot   |

Below shows the parameters of array 'phase'

|Parameters	| Values	|
|-----------|:-------:|
|phase(:,:,1) |Phase A  |
|phase(:,:,2) |Phase B  |
|phase(:,:,3) |Phase C  |

The nominal coil span value is given by number of slots per magnet pole.