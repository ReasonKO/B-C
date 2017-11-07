prepare_data_BC

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
    
    Questions=BaC_checkin(Answer,1234);
    out=1234;
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

toc()
fprintf('\n--- Srednee vremya t=%6.4f\n',toc()/size(GAME_LN,2));