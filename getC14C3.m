[file_name,v_src,v_rcv,dist_src,dist_rcv,ind_src,ind_rcv,lat,lon] = read_C1(src,rcv,scomp,rcomp1,rcomp2);
dur = [-9000+7000+1:9000-7000-1]+9000;
u = [-400+0.2:0.2:400-0.2];
% figure(1)
% plot_seismo2(u,v_src(dur,:),dist_src)
% figure(2)
% plot_seismo2(u,v_rcv(dur,:),dist_rcv)
%load sta_lat_lon