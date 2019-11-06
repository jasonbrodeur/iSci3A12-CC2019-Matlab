%% iSci_Workshop_Intro.m
% This script is meant to lead the user through an introduction to scientific programming in MATLAB.  

% Orignal created 5-Nov-2011 by JJB
% Updated regularly by JJB

%% 1. Introduction 
% Welcome to MATLAB.  
% Go through slides 1-5
%% 2. Open up MATLAB
% * >File>Set Path> “Add with Subfolders”; C:\Users\<yourMacID>\Documents\MATLAB
% * cd C:\Users\<yourMacID>\Documents\MATLAB  
% * Introduce students to the MATLAB interface  
% * a) Folder Browser
% * b) Command Window
% * c) Workspace
% * d) Command History

%% 3. Variables

%%% 3a. Assigning and naming Variables: 
%

% Into Command Window, enter:
8
% Notice how MATLAB assigns the inputted value to a variable called 'ans'
% 'ans' is the default name given to a variable if it is not specified. 
% MATLAB stores all values that are given to it as variables.

% Now enter:
7
% Notice that ans=8 is now overwritten by ans=7.  

% To avoid overwritting, and to make more useful variable names, we can
% name variables
a = 8
b = 7
test123 = 12
c = a;
% Now, you'll see in the Workspace that you have 'a', 'b', 'c' and 'test123'
% listed.  You can view the value of a variable by typing the variable name
% back into the command window:
test123 
% You'll also notice MATLAB is echoing everything you input to it.  Use a
% semicolon at the end to stop this:
test123 = 14;

% You can remove a variable from your workspace by using the 'clear'
% function
clear c

% You can clear the Command Window by typing:
clc

%%% 3b. Scalars, Vectors and Matrices:

% All previous variables we've used are scalars (1 row x 1 column).  
% We can also work with vectors and matrices.  
% We use '[' and ']' to make these:
rv1 = [2 19 3 -3 4]
% notice we've created a row vector that is 1 row x 5 columns (1x5)

% We can create a column vector by using the semicolon (;) to start a new
% row:
cv1 = [31; 8; -10; 39; 2] 

% Change row vector to column vector (transpose) with '
cv2 = [31 a -10 39 2]'

% Now, make a 5row x 4column (5x4) matrix
mymatrix1 = [12 4 2 1; 13 4 1 23; 39 20 10 9; 3 -22 -12 0; 78 -6 -3 2];

%%%% Not a Numbers (NaN):
% Often, we may end up with a gap, or missing data in our dataset, and we
% may need to keep that empty data where it is (instead of just shrinking
% the size of the variable).
% To do this, we use NaN to tell MATLAB that the entry here is not a number
%e.g. 
cv3 = [4 NaN 5; 9 10 NaN; 8 10 4];

%%%% Exercise3b: %%%%%%% 
% Make a 6x2 matrix, name it 'mymatrix2'

%%% 3c. Referencing Elements in Vectors, Matrices
% We can reference specific elements in a vector/matrix using '(' and ')',
% remembering that we always specify (row,column)
d = mymatrix1(3,3); % gives d the value of the element in row3, column3 of matrix1
e = mymatrix1(:,1); % we can use the colon (:) to mean 'all' - this gives e the value of the entire first column 

%%%% Exercise3c: %%%%%% 
% Make a new variable, called mycolumn, which is just the second column of mymatrix2

%%% 3d. Types of Arrays (Data types in MATLAB):
% What we've worked with so far are numerical arrays (numbers).
% There are other variables, namely:

%%% Character Arrays (character strings):
% Character arrays contain strings of characters.  They are treated
% differently by MATLAB.  We use 'blahblahblah' to tell MATLAB we want to
% make a string.  Otherwise it would think we were trying to reference a
% variable:
str1 = 'Hello.';
str2 = 'Do you know where I can find Batman?'
size(str2) % 'size' command gives number of rows and columns in variable

str3 = str2(1,17:24);
disp(str3); % disp shows the value of a variable in the command window

%%% Cell Arrays
%  Cell arrays can be thought of as similar to an Excel spreadsheet, in
%  that it may contain both numeric and character elements.  We use 
% '{' '}' to refer to locations within the cell array
cell1{1,1} = 453.8732;
cell1{1,2} = 'Is the most used number in the universe';
% However, unlike Excel, we can put larger things inside single cells.
% For example, we can put a matrix inside of a single cell:
cell1{1,3} = mymatrix1;
% We can even put a cell inside a cell:
cell1{1,4} = cell1(1,1:2);

%% 4. Simple Commands and Operations
%%% 4a) Arithmetic Operations

23+7        % Add:
a-b         % Subtract
23*a        % Multiply
23/b        % Divide
d = 8^2.5   % Exponent
sqrt(a+b)   % square root:

% We can also do arithmetic operations on vectors and matrices 
cv1 - 8      % subtract 8 from each element
cv1 / 8      % divide each element by 8
sqrt(matrix1)    % notice the imaginary parts

% If we wanted to subtract two vectors element-wise (like we
% would in excel:
cv1-cv2 % Note that this will only work if the vectors are exactly the same size and shape
% For multiplicaiton/division, we need to use .* or ./ to do this:
% e.g:
cv1.*cv2 % Will multiply together the same cells of each vector

% Why do we need .*?  If we use just *, MATLAB tries to do matrix
% multiplicaiton:
cv1*cv2 % Gives an error b/c sizes aren't right for matrix multiplication
rv1*cv1 % Works.

%%% 4b) Other Numerical Operations and Functions

log_d = log(d)      % natural logarithm
log10_d = log10(d)  % base10 logarithm
exp_cv1 = exp(cv1)      % natural exponent
cos_m1 = cos(matrix1)      % trig functions
sin_d = sin(d)     % 
tan_d = tan(d)  

%%% 4c) Statistical Operations
% We can also do Statistical Functions
mean_cv1 = mean(cv1)
mode_cv1 = mode(cv1)
std_m1 = std(matrix1) % Notice it takes the standard deviation for each column
std_m1b = std(matrix1,0,2) % This will take it across rows, instead.
var_m1 = var(matrix1)

%%% 4d) Concatenating (Adding) Strings
% When we add strings together, we can combine all (or parts) of different
% strings to make a new one.  We use '[' ']' to combine parts (similar to
% making a row vector:
str4 = [str1 str2 ' I am Batman.']; % Add three strings
disp(str4);

%% 5. Scripts and Functions

%%% 5a. Scripts
% Have students open this script: File>Open or navigate using the Folder
% browser or type 'edit iSci_Workshop_Intro' into the command window.
% This file is a script.  It contains a list of commands that will be
% executed if you enter the script's name into the command window, or if
% you simply press the 'Go' button (green play button) on the toolbar.
% When you run the script, it is the equivalent of typing each command
% sequentially into the command window.  All variables created will show up
% in the Workspace

% Another handy tool is the F9 key.  If you highlight any commands in the
% script, you can run just the highlighted pieces by pressing F9.

%%% 5b. Functions:
% Open up and take a look at iSci_lucky_numbers.m (Click >File>Open and
% navigate to it, or simply type 'edit iSci_lucky_numbers' in the Command
% Window.

% A function is similar to a script in that it is a list of commands to be
% executed.  Where it differs, however, is that functions run within their
% own personal Workspace (called a 'stack').  By default, internal variables will
% not be placed in the Workspace, and functions will not be able to
% 'see' any existing variables in your Workspace.

% You pass data into and out of functions using the function declaration
% statement at the top of the function. It looks something like:
% function [output1 output2] = nameoffunction(input1 input2 input3)
% Functions can have any number of input and output variables, and can be
% named mostly anything (as long as they don't have a special character or
% a space in them).

% Functions are useful when you are interested in only select output
% variables in a set of commands.  You can also run a function inside of a
% script (or another function), which makes it a very space and time-saving
% way to run many commands.  

% Functions are called by using their name and
% the output/input format specified above (see below example).
% For example, the operation 'mean' is a function.  It is called by, e.g.:
% [average] = mean(values)
% where 'average' is the output, 'mean' is the function name, and 'values'
% are the input. 

%%% 5c. Commenting
% You'll notice that scripts and functions contain more than just the
% commands that will be executed in MATLAB.  A very crucial part of
% programming is documenting your programs.  This documentation allows
% future users (yourself or others) to quickly figure out what you are
% doing at each point of a program.
% We use the '%' character to indicate we are making a comment.  Anything
% written after a '%' character will be ignored by MATLAB when the program
% is run.
% It is always good practice to comment a description of the program at its
% top, and comment thoroughly throughout the program.


%%% 5d. Using Help and Other Resources:
% MATLAB's help documentation is extensively thorough, and an invaluable
% resource.  You can access it a number of ways:
% a) Go to >Help>Product Help> from any MATLAB toolbar
% b) In the command window, type: 'doc' (short for 'documentation')
% In the documentation, you can browse through the sections, or use the
% search box to find out more information on a specific function, or
% operation.  In addition, you can type:
% c) 'doc <nameoffunction>' in the Command window to browse directly to
% information on the function you're interested in.
% You can also type"
% d) 'help <nameoffunction>' in the Command window to get information right
% in the command window.

%% Exercise: 
clear all; % When you 'clear all', you erase all variables from the Workspace
clc;
% A) Run the function iSci_lucky_numbers from the command line
% 
% B) Now, modify this function and save it under a new name: 'my_lucky_numbers'  
% (remember you need to change the name at the top of the function as well).

% C) Make some changes to the new function's greeting, changing it to your
% liking.

% D) Change your function to select 6 lucky numbers between 1 and 100. Run
% it once to make sure it works.

