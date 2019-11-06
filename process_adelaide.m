%%% process_adelaide.m
% This script ....<fill in this part with details about what the script does>
%
%
%
% Created by: 
% Date created: 
% 
% Modifications: 
%
%

%% Your tasks with this function:
%%% ********YOU MUST RUN iSci_extract_station_data first!!!! ***********
%%% 1. Complete the code where tasks have been left for you (indicated by <TO DO>)%%%%%
%%% 2. Ensure that the script runs without issue and produces the figures in the \Figs directory
%%% 3. Comment the top and other lines appropriately.

%% Set working_dir to the directory where the content exists (i.e. iSci3A12-CC2019-Matlab directory)
working_dir = 'D:\Local\iSci3A12-CC2019-Matlab\'; 
cd(working_dir);

%% Load the data for the site:
colheaders = {'StationID','Year','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'}; % Column headers
stn_data = csvread('Data/stn_data_filtered.csv'); %%% Load the station data:
% col 1 = site identifier
% col 2 = year
% cols 3: 14: monthly (Jan - Dec) mean temperature (C)

%%% Load the station list as the variable 'site_names':
load('Data\stn_list_filtered.mat'); 
site_numbers = cell2mat(site_names(:,1)); % creates a variable from the first column of site_names that is site number

%% Extract data from stn_data where the first column matches the ID:

% Looking at the site_names variable in the Variable Browser, we see that the unique id for ADELAIDE AIRP is 946720000
rows_to_use = find(stn_data(:,1)==946720000); % rows_to_use is a list of all rows in stn_data that matches the station id for ADELAIDE AIRP
data = stn_data(rows_to_use,1); % Create a new variable (data) with only rows for Adelaide
% Open up the data in the Variable Browser and inspect. 

%%% Pull out years and temperatures from stn_data
years = stn_data(rows_to_use,2); % List of years
temps = stn_data(rows_to_use,3:end); % Temperature data
temps(temps==-9999)= NaN; % Turn -9999s to NaNs

% Pull out the name (ADELAIDE AIRP) from the site_names list and assign to station_name. **This will be important for your following deliverable**
station_name = site_names{site_numbers==946720000,2}; 



%% Calculate annual means, anomalies, etc.
ref_start = 1951;
ref_end = 1980;
% Annual means - years with NaNs in months will also have NaNs in annual avg
%%% <TO DO> Figure out how to take the mean of all years (i.e. average temperatures for each row across columns <TO DO> 
annual_mean = ; % hint: enter 'doc mean' into the command window to learn how to average across columns
% Mean of reference period -- take average of all non-NaNs between the reference years
annual_mean_ref = mean(annual_mean(years>=ref_start & years<= ref_end & ~isnan(annual_mean)));
% <TO DO> Calculate Annual anomalies from annual_mean and annual_mean_ref <TO DO>
anoms_annual = ;


%% Calculate trendline *** THIS IS DONE FOR YOU *** 
ind = find(~isnan(anoms_annual)); % find years without an NaN
%%% fit a first-order (linear) polynomial
p = polyfit(years(ind),anoms_annual(ind),1); % p(1) is the slope, p(2) is the intercept
anoms_annual_trend = polyval(p,years); % polyval uses the linear coefficients to create predicted values (i.e. our trendline)

%% Figure 1: Create line plot and save it to the /Figs directory with a filename that matches the station name *** YOU NEED TO FINISH THIS *** 
fig1 = figure; clf;
plot(years,anoms_annual,'b.-'); hold on; % Plot the anomaly time series
plot(years,anoms_annual_trend,'r-'); % Plot the trend line
% <TO DO> Plot anoms_annual and anoms_annual_trend; style the figure appropriately<TO DO>
ylabel(''); 
xlabel('');
legend('','');
print('-dpng',['Figs\' station_name '_timeseries']); % saves as .png with the name of the station in the filename

%% Figure 2: Create a 'Barcode' graph of Annual anomalies and save it to the /Figs directory with a filename that matches the station name *** YOU NEED TO FINISH THIS *** 
anoms_annual_plot = anoms_annual'; % transpose for plotting purposes
anoms_annual_plot(isnan(anoms_annual_plot))=0;
fig2 = figure;
imagesc(anoms_annual_plot);
shading flat;
colormap(cmap);
caxis([-2 2]); % Scales the limits of the colours to +/- 2 degrees C
c2 = colorbar;
ylabel(c2,''); % insert label for the colorbar
set(gca,'XTick',[first_ten_mult:20:numel(years)]);
set(gca,'XTickLabels',year_labels);
set(gca,'YTick',[]); % Leave this blank
% <TO DO> Save this in the Figs\ director (as above) with the name of the station and '_barcode' (e.g. \Figs\ADELAIDE AIRP_barcode) <TO DO>
print('-dpng',[]);








