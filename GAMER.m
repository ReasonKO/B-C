function GAMER
clc
fprintf('=========== Bulls_n_cows =========== \n');
STEP=0;
Question=[];
out=1234;
while 1
fprintf('Enter answer for %d\n',out)
B=input('B= ');
%if size(B,2)==2
if B==4
    fprintf('--------YOU WIN!!!-----\n')
    B=input('Repet game? 1 or 0 ...');
    if B=='y' || B=='Y' || B==1
        GAMER
    end
    return 
end
K=input('K= ');
STEP=STEP+1;
Question(STEP,:)=[out,B,K];
out=BullsAndCows(Question);
end

end