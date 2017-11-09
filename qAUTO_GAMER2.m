clc
clear all
prepare_data_BC

FIRST_ANSWER=   1234;

global FAST_ANSWERS
FAST_ANSWERS=zeros(5,5);
for i=0:4
    for j=0:4         
        Questions =[      FIRST_ANSWER           i           j  ];
        FAST_ANSWERS(i+1,j+1)=BullsAndCowsFast2(Questions);
    end
end


tic()
GAME_LN=zeros(1,4536);%4536
GAME_LN_Q=zeros(size(GAME_LN,2),4);
IND=1:9999; aAnswers=IND(Array_init(:,5)==1);     
fprintf('\n--- START AUTO GAMER 2 N=%d\n',size(GAME_LN,2));
for gameN=1:size(GAME_LN,2)
    %fprintf('\n--------------- NEW GAME %d / %d----------------------\n',gameN,size(GAME_LN,2));
    if 4536==size(GAME_LN,2)
        Answer=aAnswers(gameN);
    else        
        Answer=aAnswers(randi(4536));
    end
    %Answer    
    GAME_LN_Q(gameN,:)=Answer(:);
    GAME_LN(gameN)=1;
    
    out=FIRST_ANSWER;
    Questions=BaC_checkin(Answer,out);
    sm=4536;
    while out~=Answer && ~isnan(out)
        sm_old=sm;
        [out,sm]=BullsAndCowsFast2(Questions);
        sm_old/sm;
        
        if ~isnan(out)
            Questions=[Questions;BaC_checkin(Answer,out)];
        end
        GAME_LN(gameN)=GAME_LN(gameN)+1;
    end

    if isnan(out) || out~=Answer
        error('asdasd');
    end
    fprintf('--- Game %d / %d ans %d ,ln %d ---\n',gameN,size(GAME_LN,2),Answer,GAME_LN(gameN))

    %Answer
    %out
end

if out~=Answer
    gameN=gameN-1;
    out=Answer;
end

GAME_LN_Q(1:gameN)
GAME_LN(1:gameN)
sg=sort(GAME_LN(1:gameN));
gameN
MEDIANNAYA_IGRA=sg(floor(gameN/2))
SREDNYAYA_IGRA=sum(GAME_LN)/gameN

ETALON.GAME_LN=GAME_LN;
ETALON.GAME_LN_Q=GAME_LN_Q;
ETALON.SREDNYAYA_IGRA=SREDNYAYA_IGRA;
ETALON.MEDIANNAYA_IGRA=MEDIANNAYA_IGRA;
%save('ETALON','ETALON');

% toc()
% fprintf('\n--- Srednee vremya t=%6.4f\n',toc()/size(GAME_LN,2));
% 
% 
% gameN =
% 
%         4536
% 
% 
% MEDIANNAYA_IGRA =
% 
%      5
% 
% 
% SREDNYAYA_IGRA =
% 
%     5.2313 %init=1234
%     5.2317 %init=9876
%     5.2509 %7890
%     5.2496 %1023
%     5.2500 %5067
% 
% Elapsed time is 35.424602 seconds.
% 
% --- Srednee vremya t=0.0078

%1023  5.2496