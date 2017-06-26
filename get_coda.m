function  [Coda1,Coda2,Coda3,Coda4]=get_coda(C1,C2,C3,C4,dist1,dist2,npt,vel)
    c=vel;
    ind1=round(dist1/c/0.2*2); ind2=round(dist2/c/0.2*2);
    %ind=max(ind1,ind2)+30/0.2;
    ind = max(ind1,ind2);

    Coda1=C1(ind:ind+npt-1);
    Coda2=C2(ind:ind+npt-1);
    Coda3=C3(ind:ind+npt-1);
    Coda4=C4(ind:ind+npt-1);
    
%     
%     Coda1 = sign(Coda1);
%     Coda2 = sign(Coda2);
%     Coda3 = sign(Coda3);
%     Coda4 = sign(Coda4);
end
