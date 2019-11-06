function [mean_temps] = plot_station_data(station_numbers, ref_start, ref_end)
%%% Note that this function should be run while MATLAB is in the directory where the content exists (i.e. iSci3A12-CC2019-Matlab directory)
% This function.....
% 
%
% inputs: 
% station_numbers: a column vector of station numbers (taken from stn_list_filtered)
% ref_start: the reference period start year for calculating anomalies
% ref_end: <TO DO> FILL THIS IN <TO DO>
% 
% outputs:
% two figures are created and saved in the /Figs directory
% mean_temps: an n x 2 matrix (where n is the number of stations in station_numbers) consisting of the following information: 
%%% - column 1 - the station number 
%%% - column 2 - the mean temperatures for the given station over the *entire period*
%
%
% usage example: <TO DO> FILL THIS IN <TO DO>
%
% created by: <TO DO> FILL THIS IN <TO DO>
%
%


%% Your tasks with this function:
%%% ********YOU MUST RUN iSci_extract_station_data first!!!! ***********
%%% 1. Style each figure and ensure that they print to file properly%%%%%
%%% 2. Ensure that the function runs without issue for a number of inputs
%%% (names found in \Data\stn_list_filtered.csv)
%%% 3. Comment the top and other lines appropriately.
%% Declare variables
% station_numbers = [2318220; 173000000]; ref_start = 1951; ref_end = 1980;% uncomment for internal testing. Comment for normal operation

%%% Colormap (used for barcode plots)
cmap = ([0,0,0.562500000000000;0,0,0.625000000000000;0,0,0.687500000000000;0,0,0.750000000000000;0,0,0.812500000000000;0,0,0.875000000000000;0,0,0.937500000000000;0,0,1;0,0.0625000000000000,1;0,0.125000000000000,1;0,0.187500000000000,1;0,0.250000000000000,1;0,0.312500000000000,1;0,0.375000000000000,1;0,0.437500000000000,1;0,0.500000000000000,1;0,0.562500000000000,1;0,0.625000000000000,1;0,0.687500000000000,1;0,0.750000000000000,1;0,0.812500000000000,1;0,0.875000000000000,1;0,0.937500000000000,1;0,1,1;0.117647059261799,0.992647051811218,0.992647051811218;0.235294118523598,0.985294103622437,0.985294103622437;0.352941185235977,0.977941155433655,0.977941155433655;0.470588237047195,0.970588207244873,0.970588207244873;0.588235318660736,0.963235318660736,0.963235318660736;0.705882370471954,0.955882370471954,0.955882370471954;0.823529422283173,0.948529422283173,0.948529422283173;0.941176474094391,0.941176474094391,0.941176474094391;0.948529422283173,0.948529422283173,0.823529422283173;0.955882370471954,0.955882370471954,0.705882370471954;0.963235318660736,0.963235318660736,0.588235318660736;0.970588207244873,0.970588207244873,0.470588237047195;0.977941155433655,0.977941155433655,0.352941185235977;0.985294103622437,0.985294103622437,0.235294118523598;0.992647051811218,0.992647051811218,0.117647059261799;1,1,0;1,0.937500000000000,0;1,0.875000000000000,0;1,0.812500000000000,0;1,0.750000000000000,0;1,0.687500000000000,0;1,0.625000000000000,0;1,0.562500000000000,0;1,0.500000000000000,0;1,0.437500000000000,0;1,0.375000000000000,0;1,0.312500000000000,0;1,0.250000000000000,0;1,0.187500000000000,0;1,0.125000000000000,0;1,0.0625000000000000,0;1,0,0;0.937500000000000,0,0;0.875000000000000,0,0;0.812500000000000,0,0;0.750000000000000,0,0;0.687500000000000,0,0;0.625000000000000,0,0;0.562500000000000,0,0;0.500000000000000,0,0]);

%% Open the filtered station data file and the station name list:

%%% Load the filtered station data
colheaders = {'StationID','Year','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'}; % Column headers
stn_data = csvread('Data/stn_data_filtered.csv');
% col 1 = site identifier
% col 2 = year
% cols 3: 14: monthly (Jan - Dec) mean temperature (C)

%%% Load the station list as the variable 'site_names':
load('Data\stn_list_filtered.mat'); 
site_numbers = cell2mat(site_names(:,1)); % creates a variable from the first column of site_names that is site number

%% Cycle through each station and do the following: 

for i = 1:1:length(station_numbers)
% Identify the rows to be extracted in the stn_data file for a given station ID.

% Pull out years and temperatures from stn_data

% Pull out the station name form the sites_name list.     


%% Calculate annual means, anomalies, etc.
    
    
%% Calculate trendline


%% Figure 1: Create line plot and save it to the /Figs directory with a filename that matches the station name

%% Figure 2: Create a 'Barcode' graph of Annual anomalies and save it to the /Figs directory with a filename that matches the station name



end



