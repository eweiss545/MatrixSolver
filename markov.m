%% 8.1) Create a Markov Model

%% Problem 2.11: Model Use

%% a)

% col 1 = sunny
% col 2= rainy
% col 3 = cloudy
% col 4 = snowy

s = {'sunny';'rainy';'cloudy';'snowy'};

M = [.60 .30 .20 .10;.10 .20 .30 .30;.20 .30 .30 .30;.10 .20 .20 .30];

%% b)
% Tuesday's state vector:
w = [.6;.1;.2;.1];

%% c) 
% Testing
% Function

%% 2.11.1 Yesterday's Weather
v = [.295;.230;.270;.205]
% yesterday's state vector was x, where Mx = v

