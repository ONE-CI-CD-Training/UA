function plan = buildfile
plan = buildplan(localfunctions);
plan.DefaultTasks = "archive";
plan("archive").Dependencies = ["check" "test"];
end

function checkTask(~)
% Identify code issues
proj = openProject(pwd);

issues = codeIssues;
assert(isempty(issues.Issues),formattedDisplayText( ...
    issues.Issues(:,["Location" "Severity" "Description"])))

% Run model advisor check
results = modelAdvisorChecks;
totalFail = 0;
for modelCheck = results
    totalFail = totalFail + modelCheck{1}.numFail;
end
assert(totalFail == 0)
close(proj);
end

function testTask(~)
% Run unit tests
results = runtests(IncludeSubfolders=true,OutputDetail="terse");
assertSuccess(results);
end

function archiveTask(~)
% Create ZIP file
zipFileName = "source_" + ...
    string(datetime("now",Format="yyyyMMdd'T'HHmmss"));
zip(zipFileName,"*")
end