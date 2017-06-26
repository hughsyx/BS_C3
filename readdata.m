clear all
%stalist=['CI_BFS','CI_CHN','CI_CLT','CI_IPT','CI_LPC','CI_MLS','CI_OLI','CI_PDU','CI_RSS','CI_RVR','CI_TA2'];

pwd1='../data/san_fernando/C3/BHN/2001/BK_HOPS';
pwd2='../data/san_fernando/C3/BHZ/2001/BK_BDM';
a1 = dir(pwd1);
a2 = dir(pwd2);
a1(1:3)=[];
a2(1:3)=[];
m=1;
%dlen=432000;
%i=130;
tic
for i=1:length(a1)
    %tic
    b1=a1(i).name;
    i1=strfind(b1,'BH');
    i2=strfind(b1,'SAC');
    n=b1(i1+4:i2-2);
    S1=strcat(pwd1,'/',b1);
    for j=1:length(a2)
        b2=a2(j).name;
        if strfind(b2,n)            
            S2=strcat(pwd2,'/',b2);
            [u,v]=readsac(S1);
            u1{m}=u;v1{m}=v;
            [u,v]=readsac(S2);
            u2{m}=u;v2{m}=v;
            m=m+1;
        end
    end
    %toc
end 

 toc   
