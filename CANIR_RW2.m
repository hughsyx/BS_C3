function Corr = CANIR_RW2(CB,CA,len1)
% one bit normalization
Len=min(length(CA),length(CB));
overlap = 200;%round(len1/2); %200
nw=floor((Len-len1)/overlap)+1;
temp1=0;
esp=1e-4;

CB=sign(CB);
CA=sign(CA);
for i=1:nw
    win = (i-1)*overlap+1:(i-1)*overlap+len1;
    temp = CANIR(CB(win),CA(win),10);%xcorr(CB(win),CA(win));
    temp1 = temp1+temp./max(abs(temp+esp));
end
Corr = temp1./max(abs(temp1));