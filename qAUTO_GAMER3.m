clc
clear all
prepare_data_BC

FAST_ANSWERS=zeros(5,5);
GENERATE_ANSWERS=1;
if GENERATE_ANSWERS
for i=0:4
    for j=0:4         
        Questions =[      1234           i           j  ];
        if FAST_ANSWERS(i+1,j+1)==0
                FAST_ANSWERS(i+1,j+1)=BullsAndCowsFast3(Questions);
        end
    end
end
    save('FAST_ANSWERS','FAST_ANSWERS');
else
    load('FAST_ANSWERS');
end

sr=0;
tic()
GAME_LN=zeros(1,4536);%4536
GAME_LN_Q=zeros(size(GAME_LN,2),4);
IND=1:9999; aAnswers=IND(Array_init(:,5)==1);     
fprintf('\n--- START AUTO GAMER 2 N=%d\n',size(GAME_LN,2));
load('ETALON3');
sr_etalon=0;
for gameN=1:size(GAME_LN,2)
    %fprintf('\n--------------- NEW GAME %d / %d----------------------\n',gameN,size(GAME_LN,2));
    if 4536==size(GAME_LN,2)
        gameI=gameN;
        Answer=aAnswers(gameN);
    else        
        gameI=randi(4536);
        Answer=aAnswers(gameI);
    end
    %Answer    
    GAME_LN_Q(gameN,:)=Answer(:);
    GAME_LN(gameN)=1;
    
    out=1234;
    Questions=BaC_checkin(Answer,out);
    sm=4536;
    while out~=Answer && ~isnan(out)
        sm_old=sm;
        [out,sm]=BullsAndCowsFast3(Questions);
        sm_old/sm;
        
        if ~isnan(out)
            Questions=[Questions;BaC_checkin(Answer,out)];
        end
        GAME_LN(gameN)=GAME_LN(gameN)+1;
    end

    if isnan(out) || out~=Answer
        error('asdasd');
    end
    sr=sr+GAME_LN(gameN);
    sr_etalon=sr_etalon+ETALON.GAME_LN(gameI);
    fprintf('--- Game %d / %d ans %d ,ln %d ---   sr=%d   etalon=%d\n',gameN,size(GAME_LN,2),Answer,GAME_LN(gameN),sr/gameN,sr_etalon/gameN)

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
ETALON_SR=sr_etalon/gameN
clear ETALON
% ETALON.GAME_LN=GAME_LN;
% ETALON.GAME_LN_Q=GAME_LN_Q;
% ETALON.SREDNYAYA_IGRA=SREDNYAYA_IGRA;
% ETALON.MEDIANNAYA_IGRA=MEDIANNAYA_IGRA;

%save('ETALON3','ETALON');
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
%    Obshii poisk 
%         SREDNYAYA_IGRA: 5.1766 v^2+1*(1-I)
%           5.1634 FULL  K=sum((log(max(1,V)).*V)'); [~,ansIND]=min(K+1*(1-Array(aAnswers,5)'));

% 
% Elapsed time is 35.424602 seconds.
% 
% --- Srednee vremya t=0.0078

%1023  5.2496