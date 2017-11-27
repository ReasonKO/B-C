function s=insum(X)
s=0;
for i=1:41
    X{i};
    if iscell(X{i})
        s=s+insum(X{i});
    else
        s=s+X{i};
    end
end
end