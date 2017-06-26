function plot_seismo(u,data,dist)

inter = 7;
scale = 5;
m =1;
k =1000;
dt = 0.2;
v=2.5;
Max = max(max(abs(data)));
[b,a] = butter(4,[(2*1/10*0.2),(2*1/3*0.2)],'bandpass');
data = filtfilt(b,a,data);
for i=1:length(dist)
    if dist(i) > 450 | dist(i) == 0
        continue
    end
    temp = dist(i) - mod(dist(i),inter);
    %if mod(dist(i),inter)/inter < 1 & dist(i) < 600 & dist(i) >0 & sum(k==temp)<4
    %if dist(i) < 600 & dist(i) >0 & sum(k==temp)<2
        basevalue = dist(i);
        Data = data(:,i)-mean(data(:,i));
        Data = Data/max(abs(Data))*scale+basevalue;
        %Data = Data/Max*scale+basevalue;
        Uwig = u;
        Vwig = Data;
        
        ind = [1:length(Vwig)];
        pind = Vwig>basevalue+scale*0.18;
        pind2 = ind(pind);
        ind2 = [1:length(pind2)];
        pind3 = ind2(diff(pind2)>1);
        
        plot(Uwig,Vwig,'Color',[0.8,0.8,0.8],'LineWidth',0.8)
        hold on
        for ii=1:length(pind3)-1
            plot(Uwig(pind2(pind3(ii)+1:pind3(ii+1))),Vwig(pind2(pind3(ii)+1:pind3(ii+1))),'Color',[1,0.2,0],'LineWidth',0.8)
        end
        
        pind=Vwig<basevalue-scale*0.18;
        pind2=ind(pind);
        ind2=[1:length(pind2)];
        pind3=ind2(diff(pind2)>1);

        for ii=1:length(pind3)-1
            plot(Uwig(pind2(pind3(ii)+1:pind3(ii+1))),Vwig(pind2(pind3(ii)+1:pind3(ii+1))),'Color',[0,0.6,1],'LineWidth',0.8)
        end
        m = m+1;
        k(m) = temp;
    %end
end
axis([max(-200,u(1)) min(200,u(end)) -10 450])
xlabel('Time (s)')
ylabel('Distance (km)')