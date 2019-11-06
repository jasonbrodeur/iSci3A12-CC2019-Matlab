% plot_global_trends.m
% This function....


% Created by...

%% YOUR TASKS:
% 1. Complete the tasks outlined below with '#######'
% 2. Complete the bottom figure and ensures that it outputs a result when
% the script is run.
% 3. Add comments to the top part of the script 

clearvars; % Clears any variables in the workspace.
%% Open the filtered station data file and the station name list:

%%% Load the filtered station data
stn_data = csvread('Data/stn_data_filtered.csv');
% col 1 = site identifier
% col 2 = year
% cols 3: 14: monthly (Jan - Dec) mean temperature (C)

%%% Load the station list:
load('Data\stn_list_filtered.mat');

%% Cycle through each unique station by going through site_names.
data_to_plot = []; % will be our final output |Longitude | Latitude | slope|

%%%
% Calculate annual average temperature anomaly
% Use polyfit to fit a linear trend to the data
% Make a new matrix
for i = 1:1:size(site_names,1) % cycle through rows
    %%% retrieve site_id, latitude and longitude from site_names
    station_ID = site_names{i,1}; % Need to turn this string into a number
    longitude = site_names{i,3}; % longitude
    latitude =  site_names{i,4};  % latitude
    
    %%% Find all rows in stn_data that match the id:
    rows_to_use = find(stn_data(:,1)==station_ID);
    
    %%% Pull out years and temperatures from stn_data
    years = ; % List of years ####### YOU NEED TO COMPLETE THIS 
    temps = ; % Temperature data ####### YOU NEED TO COMPLETE THIS 
    temps(temps==-9999)= NaN; % Turn -9999s to NaNs
    
    %% Calculate annual means
    % Annual means - years with NaNs in months will also have NaNs in annual avg
    annual_mean = mean(temps,2); %(the second argument <2> means to average across columns)
    
    %% Calculate trendline of annual means
    ind = find(~isnan(annual_mean)); % find years without an NaN
    %%% fit a first-order (linear) polynomial
    p = polyfit(,,1); % p(1) is the slope ####### YOU NEED TO COMPLETE THIS 
    slope = p(1);
    data_to_plot(i,1:3) = [longitude latitude slope];
    clear latitude longitude slope;
end



%% Plot data in 5 different colors:
% #### YOU NEED TO COMPLETE A NUMBER OF ITEMS HERE
% Color reference:
% red = 'r'; magenta = 'm'; green = 'g'; cyan = 'c'; blue = 'b';
% Slope >= 0.01: Red
% 0.002 <= Slope < 0.01: Magenta
% -0.002 < Slope < 0.002: Green
% -0.01 < Slope <= -0.002: Cyan
% Slope <= -0.01: Blue 

fig4 = figure; clf;

%%% Find all rows that meet the criteria for red. plot those rows. Plot longitude, latitude for the rows indicated in 'dark_red'
dark_red = find(data_to_plot(:,3)>0.01);
plot(data_to_plot(dark_red,1),data_to_plot(dark_red,2),'o','MarkerFaceColor','r'); hold on;

%%% Find all rows that meet the criteria for magenta. plot those rows ####### YOU NEED TO COMPLETE THIS 

%%% Find all rows that meet the criteria for green. plot those rows ####### YOU NEED TO COMPLETE THIS 

%%% Find all rows that meet the criteria for cyan. plot those rows ####### YOU NEED TO COMPLETE THIS 

%%% Find all rows that meet the criteria for blue. plot those rows
blue = find(data_to_plot(:,3)<=-0.01);
plot(data_to_plot(blue,1),data_to_plot(blue,2),'o','MarkerFaceColor','b');

%%% Style the figure
ylabel();
xlabel();
title();
legend();
    
% Print it to the \Figs directory:
print('-dpng','')
