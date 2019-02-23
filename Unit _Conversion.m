%% Clean House

clc
clearvars
close all

%% Load Data

load SEBT

%% Hard code
% units = 'inches';

%% Command Window Prompt
%units = input('Enter units: ', 's');

%% Input Dialog Box
%units = char(inputdlg('Enter units: '));

%% Menu Button
% unit_types = {'inch','feet','meter','centimeter','millimeter'};
% c = menu('Select units:',unit_types);
% units = unit_types{c};

%% List Box
unit_types = {'inch','feet','meter','centimeter','millimeter'};
[s,v] = listdlg('PromptString','Pick yo unit!: ',...
                    'Name', 'UNIT BOX!!!!',...
                    'SelectionMode','single',...
                    'ListSize',[240 80],...
                    'OKString','Click that shit',...
                    'CancelString', 'Naw fam',...
                    'ListString',unit_types);
units = unit_types{s}
               
%% Switch-Case Structure
units = lower(units);
switch units
    case {'inches','inch','in'}
        WBLT_c = SEBT(:,14) / 2.54;
    case {'feet','foot','ft'}
        WBLT_c = SEBT(:,14) / (2.54 * 12);
    case {'meter','meters','m'}
        WBLT_c = SEBT(:,14) / 100;
    case {'millimeter','millimeters','mm'}
        WBLT_c = SEBT(:,14) *10
    case {'centimeter','centimeters','cm'}
        WBLT_c = SEBT(:,14);
    otherwise
        uiwait(warndlg(['Unknown units: ' units],'WHAT IS THAT?!'))
        return
end

T = table(SEBT(:,14),WBLT_c,'VariableNames',{'WBLT_cm';['WBLT_' units]});

disp(T)
