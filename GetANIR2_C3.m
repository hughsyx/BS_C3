% seperate each trace into 1h long series and calculate the
% crosscorrelation
tic
dt=0.2;
winlen=60*60/dt;
winover=60*20/dt;
nmb_w=0;

%freqlow=0.01;
%freqhigh=2;
%[B,A] = butter(6, [(2 * freqhigh * dt)], 'low');

i=1;
temp=0;
eps=1e-9;
for i=1:length(v1)
    
    len=min(length(v1{i}),length(v2{i}));
    nwin=floor((len-winlen)/winover)+1;
    %v12=filtfilt(B,A,v1{i});v22=filtfilt(B,A,v2{i});
    v12=v1{i};v22=v2{i};
    for j=1:nwin
        dur=(j-1)*winover+1:(j-1)*winover+winlen;
        if max(abs(v12(dur)))<std(v12(dur))*8 && max(abs(v22(dur)))<std(v22(dur))*8 
            if sum(abs(v12(dur))<eps)<500 && sum(abs(v22(dur))<eps)<500 
                 s1=v12(dur);%downsample(filtfilt(B,A,v12(dur)),4);
                 s2=v22(dur);%downsample(filtfilt(B,A,v22(dur)),4);
		         nmb_w=nmb_w+1;
%                temp=temp+xcorr(v2{i}((j-1)*winover+1:(j-1)*winover+winlen),v1{i}((j-1)*winover+1:(j-1)*winover+winlen));
                 c=CANIR2(s2,s1,10);
                 temp = temp+c;
            end
        end
    end
    
end 
toc
ANIR=temp;
% [B,A] = butter(6, [2 * 2 * dt], 'low');
% temp = downsample(filtfilt(B,A,temp),4);
% dt=0.2;

freqlow=1/15;
freqhigh=1/2;
[b,a] = butter(6, [(2 * freqlow * dt),(2 * freqhigh * dt)], 'bandpass');
ANIR_filt = filtfilt(b,a,temp);

save results/C3_test_HOPS_BDM_ZZ ANIR ANIR_filt nmb_w
