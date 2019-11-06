% iSci_extract_station_data.m
%%% Set working_dir to the directory where the content exists
working_dir = 'D:\Local\iSci3A12-CC2019-Matlab\'; 
cd(working_dir);
%% Load the raw data file and the station list 

data = csvread('Data\step2.v3.csv');% step2.v3.csv is the raw station data file
% data = csvread([load_path 'step2.v3.csv']); this is how to formulate it if you don't have all data in the same directory

% Recondition the first column (station ID), to round it down.
data_id = data(:,1) - (floor(data(:,1)/1e9)*1e9);
data(:,1) = data_id;

%%% Load the station list:
C = importdata('Data\stations_tab.tsv','\t');
% Create a structure variable with items from station list
station_info.id = str2double(C.textdata(:,1)); %numeric identifier
station_info.lat = str2double(C.textdata(:,4))./10; %latitude
station_info.long = str2double(C.textdata(:,5))./10; %longitude
station_info.name = C.textdata(:,2); %Station name


%% Use data in step2.v3 to identify sites that meet quality criteria:
[a,i_data,i_a] = unique(data_id); % a is the list of all 
site_index = [];
site_names = {};

keep_minyears = 100;     % minimum number of years 
keep_endafter = 2012;   % The timeseries' last year must be on or after this
keep_maxmissing = 1;    % The maximum number of missing years allowed.

stn_data = [];
format_out = ['%d,%d' repmat(',%4.2f',1,12) '\n'];
%%% Cycle through the station data, find stations that meet the criteria
for i = 1:1:length(i_data)
   ind1 = find(data(:,1)==a(i),1,'first'); % Find the first year of data for that site
   ind2 = find(data(:,1)==a(i),1,'last');  % Find the last year of data for that site
   ind_all = find(data(:,1)==a(i));         % List of all rows matching that station and year
   
   %%% Evaluate if the site meets our criteria
   if data(ind2,2)>=keep_endafter && (data(ind2,2)-data(ind1,2))>70 && abs( ((data(ind2,2)-data(ind1,2))-length(ind_all)) )<keep_maxmissing+1
   ind3 = size(site_index,1)+1;    
       site_index(ind3,1)= a(i);
       site_index(ind3,2)= (data(ind2,2)-data(ind1,2));
       
       %%% Find the lat/long from station_info:
       ind4 = find(station_info.id==a(i));
       site_index(ind3,3)= station_info.lat(ind4);
       site_index(ind3,4)= station_info.long(ind4);
       
       %%% Can we get a measure of data quality?
       tmp = data(ind1:ind2,3:14);
       site_index(ind3,5) = length(find(tmp==-9999))./numel(tmp);
       
       %%% or how about how many years without -9999?
       tmp2 = sum(tmp./10,2);
       site_index(ind3,6) = length(find(tmp2<=-500))./numel(tmp2);
       
%        site_names{size(site_names,1)+1,1} = num2str(station_info.id(ind4,1));
       site_names{size(site_names,1)+1,1} = station_info.id(ind4,1); 
       site_names{size(site_names,1),2} = station_info.name{ind4,1};
       site_names{size(site_names,1),3} = station_info.long(ind4,1);
       site_names{size(site_names,1),4} = station_info.lat(ind4,1);
      
       %%% Write the measurement data to stn_data file
       stn_data = [stn_data; data(ind1:ind2,:)];
   end
end
%% Make a plot of all of the sites that are included. Save data
figure(1);
% Try to plot a world map as a base
try
geoshow('landareas.shp', 'FaceColor', [0.5 1.0 0.5]);
hold on;
catch
disp('Couldn''t display world map using geoshow function');
end
% Plot the locations of all sites.
plot(site_index(:,4),site_index(:,3),'mx')

%%% Put data into degrees Celsius (not 100s of a degree):
stn_data(stn_data==-9999) = NaN;        % turn -9999s to NaNs
stn_data(:,3:end) = stn_data(:,3:end)./100; % Divide temperature by 100 (put in deg C)
stn_data(isnan(stn_data))= -9999;       % turn NaNs back to -9999

%%% Save the data file:
fid= fopen('Data\stn_data_filtered.csv','w+');
fprintf(fid,'%s',sprintf(format_out,stn_data'));
fclose(fid);

% Save the station list as matlab variable and text
save('Data\stn_list_filtered.mat','site_names');
site_names = site_names'; % transpose it
fid3 = fopen('Data\stn_list_filtered.csv','w+');
fprintf(fid3,'%s',sprintf('%d,%s,%3.1f,%3.1f\n',site_names{:}))
fclose(fid3);
