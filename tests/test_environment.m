%% Carbon Neutrality Project
% Cross-platform environment verification
%
% Compatible with MATLAB R2025b
% Intended for Linux, Windows, and macOS.

clear;
clc;

fprintf('====================================\n');
fprintf('CARBON NEUTRALITY - ENVIRONMENT TEST\n');
fprintf('====================================\n\n');

%% 1. MATLAB version

fprintf('MATLAB Version: %s\n', version);
fprintf('Operating System: %s\n', computer);

%% 2. Numerical computation

A = [1 2 3;
     4 5 6;
     7 8 10];

b = [1; 2; 3];

x = A\b;

residual = norm(A*x-b);

fprintf('\nNumerical residual: %.4e\n', residual);

assert(residual < 1e-12, ...
    'Numerical verification failed.');

%% 3. Basic time-series calculation

years = (2000:2025)';

% Synthetic test data, not actual emissions.
emissions = 100 * exp(-0.03 * (years - 2000));

assert(all(emissions > 0), ...
    'Emissions must remain positive.');

assert(all(diff(emissions) < 0), ...
    'Synthetic emissions must decrease.');

fprintf('Synthetic time-series test: PASSED\n');

%% 4. Plotting and export

fig = figure('Visible','off');

plot(years, emissions, 'LineWidth', 2);

xlabel('Year');
ylabel('Synthetic emissions (arbitrary units)');
title('Carbon Neutrality - Environment Test');

grid on;

outputFile = fullfile(tempdir, ...
    'carbon_neutrality_environment_test.png');

exportgraphics(fig, outputFile, 'Resolution', 150);

assert(isfile(outputFile), ...
    'Figure export failed.');

close(fig);

fprintf('Figure export: PASSED\n');
fprintf('Output file: %s\n', outputFile);

fprintf('\nALL ENVIRONMENT TESTS PASSED.\n');