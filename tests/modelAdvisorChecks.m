function [results] = modelAdvisorChecks()
%MODELADVISORCHECKS run Model Advisor checks on project models
%   
checkIDs = {'mathworks.iec61508.UnconnectedObjects',...
'mathworks.maab.jc_0061',...
'mathworks.maab.db_0142'};

systems = {'thermostatController_SimHarness',...
    'thermostatController'};
results = ModelAdvisor.run(systems,checkIDs);
end

