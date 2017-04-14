function out=BullsAndCows(varargin)

 

if nargin==0
fprintf('=========== Bulls_n_cows =========== \n');
fprintf('              Hello!\n');
fprintf('I can halp you to find answer in this game!\n');
fprintf('Enter information like this...');
fprintf('\n>>BullsAndCows([1234,0,3],[2145,2,0],[2346,1,1])\n');
fprintf('it''s mean you have 3 steps \n  1)1234 0B 3K \n  2)2145 2B 0K \n  3)2345 1B 1K\n');
return
end
if isstr(varargin{1})
    DEBUG=1;
    nargin2=nargin-1;
    varargin={varargin{2:end}};
else
    nargin2=nargin;
    DEBUG=0;
end
if nargin2>1
    Questions=[];
    for i=1:nargin2
        if size(varargin{i},1)~=1 || size(varargin{i},2)~=3
            error('input size');
        end 
        Questions=[Questions;varargin{i}];
    end
end

if nargin2==1
    Questions=varargin{1};
end

if isempty(Questions)
    fprintf('\n Starting game? Try 1234\n');
    return
end

clc
fprintf('=========== Bulls_n_cows =========== \n');
fprintf('progress...');

Questions
Qln=size(Questions,1);

if size(Questions,2)~=3
    error('size(Question,2)~=3');
end
for i=1:Qln
if Questions(i,2)<0 || Questions(i,2)>4 ...
    || Questions(i,3)<0 || Questions(i,3)>4 ...
    || (Questions(i,3)+Questions(i,2)<0) || (Questions(i,3)+Questions(i,2)>4)
    error('Input Error');
    return
end
if Questions(i,1)<1000
 error('Input Error : First sign ==0');
end
out=BaC_checkin(Questions(i,1),Questions(i,1));

if out(3)>0
 error('Input Error : repeat sign');
end
end

%% Компановка массива вариантов
Array=zeros(9999,5);

for i=1000:9999
    Array(i,1)=mod(floor(i/1000),10);
    Array(i,2)=mod(floor(i/100),10);
    Array(i,3)=mod(floor(i/10),10);
    Array(i,4)=mod(i,10);
    if Array(i,1)~=Array(i,2) &&...
       Array(i,1)~=Array(i,3) &&...
       Array(i,1)~=Array(i,4) &&...
       Array(i,2)~=Array(i,3) &&...
       Array(i,2)~=Array(i,4) &&...
       Array(i,3)~=Array(i,4)
        Array(i,5)=1;
    end
end

for i=1:size(Questions,1)
    Array=BaC_check(Array,Questions(i,1),Questions(i,2),Questions(i,3));
end
if DEBUG
    Array(Array(:,5)==1,1:4)
end
%% Выборка лучшего предложения
ArrayIN=Array;
[ArrayOUT,N,Pos,Ver]=BaC_Nerf(ArrayIN);
ArrayOUT1=ArrayOUT(ArrayOUT(:,5)==1,1:4);
if DEBUG
    fprintf('\n\nSTEP 1------------\n\n')
    [N;Pos;Ver]
    sum(ArrayOUT(:,5)==1)
    ArrayOUT1
end

ArrayIN=ArrayOUT;
[ArrayOUT,N,Pos,Ver]=BaC_Nerf(ArrayIN);
ArrayOUT2=ArrayOUT(ArrayOUT(:,5)==1,1:4);
if DEBUG
    fprintf('\n\nSTEP 2------------\n\n')
    [N;Pos;Ver]
    sum(ArrayOUT(:,5)==1)
    ArrayOUT2
end

ArrayIN=ArrayOUT;
[ArrayOUT,N,Pos,Ver]=BaC_Nerf(ArrayIN);
ArrayOUT3=ArrayOUT(ArrayOUT(:,5)==1,1:4);
if DEBUG
    fprintf('\n\nSTEP 3------------\n\n')
    [N;Pos;Ver]
    sum(ArrayOUT(:,5)==1)
    ArrayOUT3
end

ArrayIN=ArrayOUT;
[ArrayOUT,N,Pos,Ver]=BaC_Nerf(ArrayIN);
ArrayOUT4=ArrayOUT(ArrayOUT(:,5)==1,1:4);
if DEBUG
    fprintf('\n\nSTEP 4------------\n\n')
    [N;Pos;Ver]
    sum(ArrayOUT(:,5)==1)
    ArrayOUT4
end

if DEBUG
    sum(Array(Array(:,5)==1,5))
end

if ~isempty(ArrayOUT4)
    OUT=ArrayOUT4;
elseif ~isempty(ArrayOUT3)
    OUT=ArrayOUT3;
elseif ~isempty(ArrayOUT2)
    OUT=ArrayOUT2;
elseif ~isempty(ArrayOUT1)
    OUT=ArrayOUT1;
else
    temp=Array(Array(:,5)==1,1:4);
    OUT=temp(1,:);
end

if DEBUG==0 
    clc
    fprintf('=========== Bulls_n_cows =========== \n');
    fprintf('previous answers:\n');
    Questions
end
fprintf('-------------------------------------\n');

if isempty(OUT)
fprintf('NO ANSWER, try to check input questions...\n');
out=NaN;
else
OUT2=OUT(1)*1000+OUT(2)*100+OUT(3)*10+OUT(4);
out=OUT2;
fprintf('\n             Try   %s\n\n',int2str(OUT2));
end
end