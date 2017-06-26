function [CAC1,CAC2,sta_use] = C3_SC4(src,rcv,lat,lon,file_name,v_src,v_rcv)

tic
npt1 = 6000;
vel = 2.5%3.2;
% get the index of the source and receiver in file_name
for i=1:length(file_name)
    if strcmp(file_name(i).name,src)
        ind_src = i;
    end
    if strcmp(file_name(i).name,rcv)
        ind_rcv = i;
    end
end
Npt = round(size(v_rcv,1)+1)/2;
npt = 8000;
dur = [-npt+1:npt-1]+Npt;
[b,a] = butter(4,[(2*1/10*0.2),(2*1/1*0.2)],'bandpass');
V_src = filtfilt(b,a,v_src(dur,:));
V_rcv = filtfilt(b,a,v_rcv(dur,:));
CAC1=0;CAC2=0;CAC=0;
calculator = 0; sta_use=0;
dist = distance([lat(ind_src),lon(ind_src)],[lat(ind_rcv),lon(ind_rcv)])*111.11; % distance between the virtual source and receiver
 u = [-280+0.2:0.2:280-0.2];
for i=1:length(file_name)
    CBA = V_src(:,i); CBC = V_rcv(:,i);
    
        dist1 = distance([lat(ind_src),lon(ind_src)],[lat(i),lon(i)])*111.11;
        dist2 = distance([lat(ind_rcv),lon(ind_rcv)],[lat(i),lon(i)])*111.11;
        if max(dist1,dist2) > 450
            continue
        end
%         if abs(dist1^2-dist2^2) < dist^2*1.8
%             continue            
%         end
%         
        if (dist1-dist)*(dist2-dist) ==0
            continue
        end
%         if if2keep([lat(ind_src),lon(ind_src)],[lat(ind_rcv),lon(ind_rcv)],[lat(i),lon(i)],0.1) == 0 %0.25
%             continue
%         end
        CBA1=fliplr(CBA(1:npt)')';
        CBC1=fliplr(CBC(1:npt)')';
        CBA2=CBA(npt:end);
        CBC2=CBC(npt:end);
        
        %plot(CBA2)
        [CBA_coda1,CBA_coda2,CBC_coda1,CBC_coda2,Clbrtn1,Clbrtn2] = get_coda2(CBA1,CBA2,CBC1,CBC2,dist1,dist2,npt1,vel);
       
        
%         Clbrtn1 = 1;
%         Clbrtn2 = 1;
        
        if max(abs(CBA_coda1))==0 | max(abs(CBC_coda1))==0
            continue
        end
        
        if Clbrtn1 > 1 | Clbrtn2 > 1
            continue
        end
        
        calculator=calculator+1; sta_use(calculator) = i;
        %cc1 = CANIR2(CBC_coda1,CBA_coda1,10)*Clbrtn1;
        %cc1 = CANIR(CBC_coda1,CBA_coda1,10)*Clbrtn1;
        cc1 = CANIR_RW3(CBC_coda1,CBA_coda1,1000);
        CAC1 = CAC1+cc1;        
        %cc2 = CANIR2(CBC_coda2,CBA_coda2,10)*Clbrtn2;  
        %cc2 = CANIR(CBC_coda2,CBA_coda2,10)*Clbrtn2; 
        cc2 = CANIR_RW3(CBC_coda2,CBA_coda2,1000);
        CAC2 = CAC2+cc2;
%        CAC = CAC+CANIR(CBC_coda1+CBC_coda2,CBA_coda1+CBA_coda2,10);

end
calculator
toc