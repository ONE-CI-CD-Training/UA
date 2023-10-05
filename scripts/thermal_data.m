%   This script runs in conjunction with the "thermostat_demo"
%   house thermodynamics example. Note that time is given in units of hours

% -------------------------------
% Problem constant
% -------------------------------
% converst radians to degrees
r2d = 180/pi;
% -------------------------------
% Define the room geometry
% -------------------------------
% House length
lenHouse = 10;
% House width
widHouse = 5;
% House height
htHouse = 2.5;
% Number of windows
numWindows = 1;
% Height of windows
htWindows = 0.5;
% Width of windows
widWindows = 0.5;
windowArea = numWindows*htWindows*widWindows;
wallArea = 2*lenHouse*htHouse + 2*widHouse*htHouse + ...
           2*widHouse*lenHouse - windowArea;
% -------------------------------
% Define the type of insulation used
% -------------------------------
% Glass wool in the walls, 0.2 m thick
% k is in units of J/sec/m/C - convert to J/hr/m/C multiplying by 3600
kWall = 0.038*3600;   % hour is the time unit
LWall = .2;
RWall = LWall/(kWall*wallArea);
% Glass windows, 0.01 m thick
kWindow = 0.78*3600;  % hour is the time unit
LWindow = .01;
RWindow = LWindow/(kWindow*windowArea);
% -------------------------------
% Determine the equivalent thermal resistance for the whole building
% -------------------------------
Req = RWall*RWindow/(RWall + RWindow);
% c = cp of air (273 K) = 1005.4 J/kg-K
c = 1005.4;
% -------------------------------
% Determine total internal air mass = M
% -------------------------------
% Density of air at sea level = 1.2250 kg/m^3
densAir = 1.2250;
M = (lenHouse*widHouse*htHouse)*densAir;
% -------------------------------
% Enter the initial internal temperature
% -------------------------------
% TinIC = initial indoor temperature
TinIC = 0;
% Air flow rate Mdot = 1 kg/sec = 3600 kg/hr
Mdot = 3600;  % hour is the time unit
