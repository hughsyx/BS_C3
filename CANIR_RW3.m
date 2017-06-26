function Corr = CANIR_RW3(CB,CA,len1)
% one bit normalization
Len=min(length(CA),length(CB));
overlap = 200;%round(len1/2); %200
nw=floor((Len-len1)/overlap)+1;
esp=1e-4;

CB=sign(CB);
CA=sign(CA);
for i=1:nw
    win = (i-1)*overlap+1:(i-1)*overlap+len1;
    temp = CANIR(CB(win),CA(win),10);
    temp1(:,i) = temp./max(abs(temp+esp));
end
Corr = temp1;