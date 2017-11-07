load('BC');
tic
for i=1:9999
    i
    for j=1:9999
        BaC_checkin_fast(i,j,BC);
    end
end
toc