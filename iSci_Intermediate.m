%% iSci_Intermediate.m
% This script will lead you through some more advanced MATLAB operations
% and commands:

%%% Step 1: Define the data location -- adjust this to match your data location:
data_loc = 'C:\Users\<yourMacID>\Documents\MATLAB\Data\'; 
% e.g. data_loc = 'C:\Users\brodeujj\Documents\MATLAB\Data\';

%%% The Scenario:
% You’ve been given this ‘lucky number generating program’ from a friend.
% You suspect that it’s outputting nothing but uniformly random numbers
% between 1 and 100. How can you prove it?

%% 6. Intermediate tools:

%%% 6a. Loops:
% Often, you may find that you need to repeat a process many times.
% Instead of doing these manually, you can use a loop to do the work for
% you.
% Here, we will use a loop to run your lucky number estimator many times.
% We will save the results from each run.

name = 'Jimmy'; % character array (string)

% Most commonly, we use the 'for' command, which allows us to specify how
% many times we want the loop to run.  We enter all operations we want
% repeated beneath the 'for' statement, and then close it up with 'end'
% e.g. Run your function 100 times:

% Here, we make a for loop that runs from 1, increasing by 1, to 100
% i is a counter variable, that will increase by 1 with every loop (it
% keeps track of what loop we're on):

for i = 1:1:100 
    lucky_numbers = my_lucky_numbers(name);
end
name = 'Bobby';
% Look at lucky_numbers (the output variable).  How big is the matrix you just made?
% The problem here is that we keep overwriting the data to the same row.
% Instead, we can use the value of i to make a new row each time:
clear lucky_numbers;
for i = 1:1:100
    lucky_numbers(i,:) = my_lucky_numbers(name);
end

% What is the size of lucky_numbers now?  

% Loops can count up or down at any interval, and the counting variable can
% have any name

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 6b. Ifs:
% An 'if' statement checks to see if a statement is true.  If it is true,
% it will execute whatever commands are below it.  If it is untrue, it will
% execute the commands that are below the 'else' statement.
% Just like 'for' loops, 'if' statements have to be closed with an 'end'

% Here's a loop that counts up by 7, with an if statement inside of it:
for looploop = 3:7:90
    if isprime(looploop)==1
        disp([num2str(looploop) ' is a prime number.']); %num2str is a function that converts a number to a character
    else
    end
end
% What does the 'if' statement do here?

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 6c. Indexing and the 'find' function
% The 'find' function tells you the location(s) in matrices where specified
% conditions exist.  For example, we can use find on our lucky numbers to
% learn more about them:
lucky_numbers = lucky_numbers(:); % using (:) puts everything into 1 row

% Let's try and use the 'find' function to figure out if the lucky numbers
% are somewhat evenly distributed between 1 and 100:
over70 = find(lucky_numbers > 70); % over70 is a list of the row numbers in lucky numbers where the value is >70
over_eq50 = find(lucky_numbers >= 50); % same, but for >=50
equals100 = find(lucky_numbers == 100); % rows where lucky_numbers is 100
under10 = find(lucky_numbers < 10);

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 6d. Saving and Loading:
% There are many different ways to save your data, depending on what format
% you want to save your data in.  The functions to do this include:
% save: used to save data to a matlab-specific (.mat) file (not readable in
% excel)
% xlswrite: saves data in .xls format
% csvwrite: saves data in comma separated format (.csv). Readable by most
% all programs.
%
% Similarly, there are different functions for loading
% e.g. 'load', 'csvread', 'xlsread', etc.

% Let's save our lucky numbers in .csv format to the R:/Matlab/Data/ directory:
% To figure out how to do this go to help:

doc csvwrite
csvwrite([data_loc 'lucky_numbers.csv'],lucky_numbers);

% Now, let's clear all the variables, and try to load our numbers back in:

% clearvars -except data_loc name% clears all variables except 'data_loc' and 'name'; "clear all" will clear all data; "clearvars" will clear all variables
% luck_num = csvread([data_loc 'lucky_numbers.csv']);

% Note that we can assign whatever name we want to a variable when we load
% it back in.

luck_num = lucky_numbers; % Since we've commented out the task where we reload the data as luck_num, we need this line so we can continue plotting.

%% 7. Plotting:

%%% 7a. Line Plots, and simple properties:
% To create a plot (or to bring up one that exists, we use the 
% 'figure' command
figure(1) % This creates a blank figure (if figure 1 doesn't exist), or brings it back up (if it already has been made)
% There are many different plot types we can make.  The simplest is a line
% plot (or time series plot).  We use the 'plot' command for this:
plot(luck_num);
% By default, you get a line plot in blue, with no title or legend. Let's
% change some of these features:
%%% Line Type: 
plot(luck_num,'.');  % Plots Data points as dots instead of connected series
plot(luck_num,'.-'); % Connected dots
plot(luck_num,'--'); % Dashed line
plot(luck_num,'o'); % Open Circles
plot(luck_num,'s-'); % Connected Open Squares

%%% Color:
plot(luck_num,'r.-'); % Makes the line and dots red.
plot(luck_num,'gp-'); % Green.
plot(luck_num,'kx'); % Makes the 'x's red.
plot(luck_num,'.','Color',[0.8 0.4 0.5]); % Can specify color as [Red Green Blue] from 0 to 1

%%% Marker and Line Colors
plot(luck_num,'s-','Color',[0.2 0.3 0.7],'MarkerEdgeColor',[1 0.1 0.1],'MarkerFaceColor',[0.4 0.7 0.2],'LineWidth',3 ); % Makes the line and dots red.

%%% Holding content on a figure
% Notice that each time you plot, you lose the previously plotted data.
% If you want to keep the previous plotted data, use the command:
hold on;
% Now, we can plot a second series on top of it:

%%% Exercise:
% Let's use the 'randi' function to create 5 different sets of 
% 600 random numbers between 1 and 100:
rand_num = randi([1,100],600,5);

plot(rand_num,'c.-'); % Plots a random series of 600 numbers between 1 and 100

%%% Clearing a figure:  
% Use the command 'clf' to clear the figure:
clf; 
plot(luck_num,'r.-'); % Makes the line and dots red.
hold on;
plot(rand_num(:,1),'c.-'); % Plots the first random series of 600 numbers between 1 and 100

%%% Adding a Legend:
% The 'legend' command adds a legend to the plot. The labels correspond to
% the order of plotted series in your figure.
legend('lucky numbers','random numbers');
% You can specify the location of the legend on the figure by using the
% 'Location' keyword, and then specifying a compass direction:
legend('lucky numbers','random numbers','Location','NorthWest');

%%% Title, X and Y labels,  Font Size
% Set the title using the title command:
title('Lucky and Random Numbers','FontSize',14);
% 'FontSize' sets the weight of the font.

% Set the x- and y-labels with the following Commands:
xlabel('Sample Number','FontSize',14);
ylabel('Number Value','FontSize',14);

% Set the font size of the axes and the legend with:
set(gca,'FontSize',14);

% Let's replot this, with all the commands together, as figure 2:
figure(2);clf;
plot(luck_num,'r.-'); % Makes the line and dots red.
hold on;
plot(rand_num(:,1),'cx-'); % Plots a random series of 600 numbers between 1 and 100
legend('lucky numbers','random numbers','Location','NorthWest');
title('Lucky and Random Numbers','FontSize',14);
xlabel('Sample Number','FontSize',14);
ylabel('Number Value','FontSize',14);
set(gca,'FontSize',14);

%% Question
% Does figure 2 tell us a whole lot about whether or not the 'lucky
% numbers' are, in fact, random?  Why or why not?  What is the apparent
% trend in the data?

%%% Sorting 
% Let's try sorting both sets of numbers from lowest to largest value
% using the 'sort' command:

%%% Figure Handles
% Another way specify a figure is to assign it a variable name (you can
% then recall this figure by referring to its variable name)
f2b = figure(); 
luck_num_sort = sort(luck_num);
rand_num_sort = sort(rand_num);
figure(f2b); clf;
plot(luck_num_sort,'r.-','LineWidth',2); % Makes the line and dots red.
hold on;
% Let's plot all the random number series on top of our lucky numbers.  
% Since we're not specifying a column to plot, MATLAB assumes that we want
% to plot each column as a separate line.  It will give each its own color
plot(rand_num_sort,'LineWidth',0.5);
legend('LuckyNumbers','Random1','Random2','Random3','Random4','Random5','Location','NorthWest')
title('Lucky and Random Numbers','FontSize',14);
xlabel('Sample Number','FontSize',14);
ylabel('Number Value','FontSize',14);
set(gca,'FontSize',14);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 7b. Printing Figures:
% Figures can be saved by either using the 'Save Figure' option in the
% figure window, or by using the MATLAB function 'print'
% Note that this will print whichever figure is currently active (last
% selected).  We can make sure we save the right one by calling figure 2
% again:
figure(f2b)
print('-dpng',[data_loc 'lucky_random_numbers']); % saves as .png
print('-dtiff',[data_loc 'lucky_random_numbers']); % saves as .tiff
print('-djpeg',[data_loc 'lucky_random_numbers']); % saves as .jpg
% See 
doc print % for more information about printing figures

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 7c) Other Types of plots.
% There are many types of plots. Highlight either variable in Workspace,
% and click the dropdown 'plot' menu above to see the different types of
% plots available.

%%% Closing figures:
% You can close a figure by using the 'close' command:
close(f2b);

%%% Scatterplot:
% Can be done similar to a line plot, except that you specify both x and y
% values:
figure(3);
plot(rand_num(:,1),luck_num,'b.'); % Scatterplot between random (x) and lucky numbers (y)
title('Random vs. Lucky Numbers','FontSize',14);
xlabel('Random Numbers','FontSize',14);
ylabel('Lucky Numbers','FontSize',14);
set(gca,'FontSize',14);

%%% Bar Graphs:
% The command 'bar' is used to make a bar graph:
% Let's make and compare histograms of the distribution of numbers in 
% rand_num and luck_num to see if they are similar (use the 'histc'
% command')
doc histc;
edges = (0:5:100)';
% Do for Lucky Numbers:
counts_lucky = histc(luck_num,edges);
fbar_lucky = figure();
bar(edges+2.5,counts_lucky);
title('Histogram for Lucky Numbers','FontSize',14);
xlabel('Value of Lucky Number','FontSize',14);
ylabel('Count','FontSize',14);

% Do for Random Numbers:
counts_rand = histc(rand_num,edges);
fbar_rand = figure();
bar(edges+2.5,counts_rand);
title('Histogram for Random Numbers','FontSize',14);
xlabel('Value of Random Number','FontSize',14);
ylabel('Count','FontSize',14);

%%% Closing figures:
% You can close a figure by using the 'close' command:
close(figure(fbar_rand));
% Or, close all:
close all;

%% Statistical Tests
% Let's try and solve this by means of a statistical test

% First, let's define our null hypthesis:
% H0: 
% H1:

% We can use the two-sample kolmogorov-smirnov test to evaluate whether
% our sample data (lucky numbers) differ significantly from what we'd
% expect if the numbers were uniformly randomly selected:
doc kstest2

% Generate random numbers from a uniform distribution, 1 to 100.
rand_num = randi([1,100],50000,1);

% Use my_lucky_numbers.m function to generate a larger sample of data than before:
for i = 1:1:1000
    lucky_numbers(i,:) = my_lucky_numbers(name);
end
% Compare with our lucky numbers using the ks-test
[h,p] = kstest2(lucky_numbers(:),rand_num);

% If we go to:
doc kstest2
% We'll see what the h and p values are telling us.

% Is the lucky number generator simply outputting random values?
