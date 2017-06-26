function plot_seismo2(u,data,dist,scale,Ind_use)

inter = 7;
%scale = 2;
m =1;
k =1000;
dt = 0.2;
v=6;
Max = max(max(abs(data)));
[b,a] = butter(4,[(2*1/3*0.2),(2*1/1*0.2)],'bandpass');
data = filtfilt(b,a,data);
w = ones(size(data,1),1);
w(round(length(w)/2)-2:round(length(w)/2)+2)=0;
for i=1:length(dist)
    if dist(i) > 400 | dist(i) == 0 | sum(Ind_use==i) == 0
        continue
    end
    temp = dist(i) - mod(dist(i),inter);
    %if mod(dist(i),inter)/inter < 1 & dist(i) < 600 & dist(i) >0 & sum(k==temp)<4
    %if dist(i) < 600 & dist(i) >0 & sum(k==temp)<2
        basevalue = dist(i);
        Data = data(:,i)-mean(data(:,i));
        %Data = Data.*w;
        Data = Data/max(abs(Data))*scale+basevalue;
        %Data = Data/Max*scale+basevalue;
        Uwig = u;
        Vwig = Data;
        
        ind = [1:length(Vwig)];
        pind = Vwig>basevalue+scale*0.23;
        pind2 = ind(pind);
        ind2 = [1:length(pind2)];
        pind3 = ind2(diff(pind2)>1);
        
        plot(Uwig,Vwig,'Color',[0.8,0.8,0.8],'LineWidth',0.6)
        hold on
        if pind3
        plot(Uwig(pind2(1:pind3(1))),Vwig(pind2(1:pind3(1))),'Color',[1,0.2,0],'LineWidth',0.7)

        for ii=1:length(pind3)-1
            plot(Uwig(pind2(pind3(ii)+1:pind3(ii+1))),Vwig(pind2(pind3(ii)+1:pind3(ii+1))),'Color',[1,0.2,0],'LineWidth',0.7)
        end
        plot(Uwig(pind2(pind3(end)+1:end)),Vwig(pind2(pind3(end)+1:end)),'Color',[1,0.2,0],'LineWidth',0.7)
        end
        
        pind=Vwig<basevalue-scale*0.23;
        pind2=ind(pind);
        ind2=[1:length(pind2)];
        pind3=ind2(diff(pind2)>1);
        if pind3
        plot(Uwig(pind2(1:pind3(1))),Vwig(pind2(1:pind3(1))),'Color',[0,0.6,1],'LineWidth',0.7)
        
        for ii=1:length(pind3)-1
            plot(Uwig(pind2(pind3(ii)+1:pind3(ii+1))),Vwig(pind2(pind3(ii)+1:pind3(ii+1))),'Color',[0,0.6,1],'LineWidth',0.7)
        end
        plot(Uwig(pind2(pind3(end)+1:end)),Vwig(pind2(pind3(end)+1:end)),'Color',[0,0.6,1],'LineWidth',0.7)
        end
        m = m+1;
        k(m) = temp;
    %end
end
axis([max(-100,u(1)) min(100,u(end)) 5 170])
xlabel('Time (s)','FontSize',15)
ylabel('Distance (km)','FontSize',15)
set(gca,'FontSize',20)
axis equal