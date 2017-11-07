
tic()
GAME_LN=zeros(1,1000);
GAME_LN_Q=zeros(size(GAME_LN,2),4);
    fprintf('\n--- START AUTO GAMER N=%d\n',size(GAME_LN,2));
for gameN=1:size(GAME_LN,2);
    %    fprintf('\n--- NEW GAME %d\n',gameN);
    Answer=0;
    K=10;
    while Answer<1000 || K>0 || Answer==1234 || Answer==5678
        Answer=rand(1)*9999;
        Answer=round(Answer);
        out=BaC_checkin(Answer,Answer);
        K=out(3);
    end
    %Answer
    GAME_LN_Q(gameN,:)=Answer(:);

    GAME_LN(gameN)=1;
    Questions=BaC_checkin(Answer,1234);
    %Questions(2,:)=BaC_checkin(Answer,5678);
    out=1234;
%fprintf('----------\n');
%sm=4536;
    while out~=Answer && ~isnan(out)
        %sm_old=sm;
        [out,sm]=BullsAndCowsFast(Questions);
        %sm_old/sm
        
        if ~isnan(out)
            Questions=[Questions;BaC_checkin(Answer,out)];
        end
        GAME_LN(gameN)=GAME_LN(gameN)+1;
    end

    if isnan(out) || out~=Answer
        error('asdasd');
    end
    [gameN,Answer,GAME_LN(gameN)]

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