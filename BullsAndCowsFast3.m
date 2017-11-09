function [out,sz]=BullsAndCowsFast3(Questions)
%Questions
global BC FAST_ANSWERS Array_init
if isempty(BC) || isempty(Array_init) || isempty(FAST_ANSWERS)
    prepare_data_BC
end
%clc
DEBUG=0;
if DEBUG
    Questions
end
% 
% Questions =...
%  [       1234           0           3
%         2145           2           0
%         2346           1           1];
%     
 if size(Questions,1)==1
     fast_answer=FAST_ANSWERS(Questions(2)+1,Questions(3)+1);
     if ~isnan(fast_answer) && fast_answer>0
         sz=1000;
         out=fast_answer;
         return
     end
     %%FAST ANSWER 
%     if Question(1)==1234 && Question(2)=0
 end
    
%     
    
Array=Array_init;
ArrayF=Array_init;
IND=1:9999;
aAnswers=IND(Array_init(:,5)==1);    

for i=1:size(Questions,1)
    Array=BaC_check_fast(Array,Questions(i,1),Questions(i,2),Questions(i,3),BC);
end




ArrayI=IND(Array(:,5)==1)';
ArrayI;
if DEBUG
    ArrayI
end

sz=length(ArrayI);
S=zeros(sz,sz);
%sz;
BC_min=BC(ArrayI,ArrayI);

%BC_min;

szF=4536;
V=zeros(szF,50);

if sz==1
    out=ArrayI;    
    return
end
for i=1:szF
    for j=1:sz
        V(i,BC(aAnswers(i),ArrayI(j))+1)=V(i,BC(aAnswers(i),ArrayI(j))+1)+1;  
    end    
end
K=sum((V.*V)');

if DEBUG
%V
%V.^2
K;
end

if sum(K)==4536
    error('ANSWER');
end


% if DEBUG
% BC_min
% S
% end



if DEBUG
    log(S)/log(5);
end

SSum=sum(log(S));
%%% NEED ki^2/N
%[~,ansIND]=min(sum(S)./sum(V')); %ALTERNATIVE LAW 2
%[~,ansIND]=min(SSum); %ALTERNATIVE LAW
% size(K);
% size((Array(:,5)==1));
% X=Array(aAnswers);
% Y=K+0.1*Array(aAnswers);
% Z=[aAnswers',Y'];
%size(Array(aAnswers,5))
%size(K)
[~,ansIND]=min(K+1*(1-Array(aAnswers,5)'));
%Array(ansIND)
%[~,ansIND]=min(sum(S));
%ansIND
ansIND;
if isempty(ansIND) || sz==0
    out=NaN;
else
out=aAnswers(ansIND);
end
% for i=1:sz
%     i
%     for j=1:sz
%         %Arrayout(i);        ;
%         out=BaC_checkin(Arrayout(i),Arrayout(j));
%         B(i,j)=out(2);
%         K(i,j)=out(3);
%         temp=BaC_check(Array,Arrayout(i),B(i,j),K(i,j));
%         %temp(temp(:,5)==1,:);
%         S(i,j)=sum(temp(:,5)==1);
%     end
% end

% B
% K
% S
%S(S==1)=0
% S_log=log(S)/log(5)
% [v,ind]=min(sum(S_log'))
% Arrayout(ind)
