function v2 = RWA2(v,npt)
    temp = zeros(1,npt-1);
    len = length(v);
    v2 = zeros(len+npt-1,1);
    v2(1:len) = v;
    temp=v(end-npt+1:end-1);
    v2(len+1:end)=fliplr(temp);
    v2=abs(v2);
end