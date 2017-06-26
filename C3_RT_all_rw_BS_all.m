clearvars -except S R R_list rcv
[b,a] = butter(4,[(2*1/10*0.2),(2*1/3*0.2)],'bandpass');
S = 'TR02'
R = 'DPP'
src = ['YN.',S];
rcv = ['CI.',R];
scomp = 'BHZ'
rcomp1 = 'BHZ'
rcomp2 = 'BHZ'
getC14C3
v_rcv_ZZ = v_rcv;
v_src_ZZ = v_src;
[CAC1_ZZZZ_mw,CAC2_ZZZZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZZ,v_rcv_ZZ);
CACZZZZ_mw=(filtfilt(b,a,CAC1_ZZZZ_mw+CAC2_ZZZZ_mw));

scomp = 'BHN'
getC14C3
v_src_NZ = v_src;
v_rcv_NZ = v_rcv;
[CAC1_ZNNZ_mw,CAC2_ZNNZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NZ,v_rcv_NZ);
CACZNNZ_mw=(filtfilt(b,a,CAC1_ZNNZ_mw+CAC2_ZNNZ_mw));
scomp = 'BHE'
getC14C3
v_src_EZ = v_src;
v_rcv_EZ = v_rcv;
[CAC1_ZEEZ_mw,CAC2_ZEEZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EZ,v_rcv_EZ);
CACZEEZ_mw=(filtfilt(b,a,CAC1_ZEEZ_mw+CAC2_ZEEZ_mw));


scomp = 'BHZ'
rcomp1 = 'BHN'
rcomp2 = 'BHN'
getC14C3
v_rcv_ZN = v_rcv;
v_src_ZN = v_src;
[CAC1_NZZN_mw,CAC2_NZZN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZN,v_rcv_ZN);
CACNZZN_mw=(filtfilt(b,a,CAC1_NZZN_mw+CAC2_NZZN_mw));
scomp = 'BHN'
getC14C3
v_src_NN = v_src;
v_rcv_NN = v_rcv;
[CAC1_NNNN_mw,CAC2_NNNN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NN,v_rcv_NN);
CACNNNN_mw=(filtfilt(b,a,CAC1_NNNN_mw+CAC2_NNNN_mw));
scomp = 'BHE'
getC14C3
v_src_EN = v_src;
v_rcv_EN = v_rcv;
[CAC1_NEEN_mw,CAC2_NEEN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EN,v_rcv_EN);
CACNEEN_mw=(filtfilt(b,a,CAC1_NEEN_mw+CAC2_NEEN_mw));
scomp = 'BHZ'
rcomp1 = 'BHE'
rcomp2 = 'BHE'
getC14C3
v_rcv_ZE = v_rcv;
v_src_ZE = v_src;
[CAC1_EZZE_mw,CAC2_EZZE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZE,v_rcv_ZE);
CACEZZE_mw=(filtfilt(b,a,CAC1_EZZE_mw+CAC2_EZZE_mw));
scomp = 'BHN'
getC14C3
v_src_NE = v_src;
v_rcv_NE = v_rcv;
[CAC1_ENNE_mw,CAC2_ENNE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NE,v_rcv_NE);
CACENNE_mw=(filtfilt(b,a,CAC1_ENNE_mw+CAC2_ENNE_mw));
scomp = 'BHE'
getC14C3
v_src_EE = v_src;
v_rcv_EE = v_rcv;
[CAC1_EEEE_mw,CAC2_EEEE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EE,v_rcv_EE);
CACEEEE_mw=(filtfilt(b,a,CAC1_EEEE_mw+CAC2_EEEE_mw));
[CAC1_EZZN_mw,CAC2_EZZN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZE,v_rcv_ZN);
[CAC1_ENNN_mw,CAC2_ENNN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NE,v_rcv_NN);
[CAC1_EEEN_mw,CAC2_EEEN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EE,v_rcv_EN);
[CAC1_NZZE_mw,CAC2_NZZE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZN,v_rcv_ZE);
[CAC1_NEEE_mw,CAC2_NEEE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EN,v_rcv_EE);
[CAC1_NNNE_mw,CAC2_NNNE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NN,v_rcv_NE);
[CAC1_ZZZN_mw,CAC2_ZZZN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZZ,v_rcv_ZN);
[CAC1_ZNNN_mw,CAC2_ZNNN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NZ,v_rcv_NN);
[CAC1_ZEEN_mw,CAC2_ZEEN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EZ,v_rcv_EN);
[CAC1_ZZZE_mw,CAC2_ZZZE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZZ,v_rcv_ZE);
[CAC1_ZNNE_mw,CAC2_ZNNE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NZ,v_rcv_NE);
[CAC1_ZEEE_mw,CAC2_ZEEE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EZ,v_rcv_EE);
[CAC1_NZZZ_mw,CAC2_NZZZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZN,v_rcv_ZZ);
[CAC1_NNNZ_mw,CAC2_NNNZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NN,v_rcv_NZ);
[CAC1_NEEZ_mw,CAC2_NEEZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EN,v_rcv_EZ);
[CAC1_EZZZ_mw,CAC2_EZZZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZE,v_rcv_ZZ);
[CAC1_ENNZ_mw,CAC2_ENNZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NE,v_rcv_NZ);
[CAC1_EEEZ_mw,CAC2_EEEZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EE,v_rcv_EZ);

CACEZZN_mw=(filtfilt(b,a,CAC1_EZZN_mw+CAC2_EZZN_mw));
CACEEEN_mw=(filtfilt(b,a,CAC1_EEEN_mw+CAC2_EEEN_mw));
CACENNN_mw=(filtfilt(b,a,CAC1_ENNN_mw+CAC2_ENNN_mw));
CACNNNE_mw=(filtfilt(b,a,CAC1_NNNE_mw+CAC2_NNNE_mw));
CACNEEE_mw=(filtfilt(b,a,CAC1_NEEE_mw+CAC2_NEEE_mw));
CACNZZE_mw=(filtfilt(b,a,CAC1_NZZE_mw+CAC2_NZZE_mw));
CACZZZN_mw=(filtfilt(b,a,CAC1_ZZZN_mw+CAC2_ZZZN_mw));
CACZNNN_mw=(filtfilt(b,a,CAC1_ZNNN_mw+CAC2_ZNNN_mw));
CACZEEN_mw=(filtfilt(b,a,CAC1_ZEEN_mw+CAC2_ZEEN_mw));
CACZZZE_mw=(filtfilt(b,a,CAC1_ZZZE_mw+CAC2_ZZZE_mw));
CACZNNE_mw=(filtfilt(b,a,CAC1_ZNNE_mw+CAC2_ZNNE_mw));
CACZEEE_mw=(filtfilt(b,a,CAC1_ZEEE_mw+CAC2_ZEEE_mw));
CACNZZZ_mw=(filtfilt(b,a,CAC1_NZZZ_mw+CAC2_NZZZ_mw));
CACNNNZ_mw=(filtfilt(b,a,CAC1_NNNZ_mw+CAC2_NNNZ_mw));
CACNEEZ_mw=(filtfilt(b,a,CAC1_NEEZ_mw+CAC2_NEEZ_mw));
CACEZZZ_mw=(filtfilt(b,a,CAC1_EZZZ_mw+CAC2_EZZZ_mw));
CACENNZ_mw=(filtfilt(b,a,CAC1_ENNZ_mw+CAC2_ENNZ_mw));
CACEEEZ_mw=(filtfilt(b,a,CAC1_EEEZ_mw+CAC2_EEEZ_mw));

CACEE_mw = CACEZZE_mw+CACENNE_mw+CACEEEE_mw;
CACNN_mw = CACNZZN_mw+CACNNNN_mw+CACNEEN_mw;
CACNE_mw = CACNZZE_mw+CACNNNE_mw+CACNEEE_mw;
CACEN_mw = CACEZZN_mw+CACENNN_mw+CACEEEN_mw;
CACZN_mw = CACZZZN_mw+CACZNNN_mw+CACZEEN_mw;
CACNZ_mw = CACNZZZ_mw+CACNNNZ_mw+CACNEEZ_mw;
CACZE_mw = CACZZZE_mw+CACZNNE_mw+CACZEEE_mw;
CACEZ_mw = CACEZZZ_mw+CACENNZ_mw+CACEEEZ_mw;

rotation_matrix
for i=1:length(CACNE_mw)
for j=1:size(CACNE_mw,2)
RT_mw(:,i,j) = Rotation(1:4,:)*[CACNN_mw(i,j);CACEE_mw(i,j);CACNE_mw(i,j);CACEN_mw(i,j)];
RZ_mw(:,i,j) = Rotation(5:8,:)*[CACZN_mw(i,j);CACZE_mw(i,j);CACNZ_mw(i,j);CACEZ_mw(i,j)];
end
end
CACTT_mw = squeeze(RT_mw(2,:,:));
CACRR_mw = squeeze(RT_mw(1,:,:));
CACZR_mw = squeeze(RZ_mw(1,:,:));
CACRZ_mw = squeeze(RZ_mw(3,:,:));
CACZT_mw = squeeze(RZ_mw(2,:,:));
CACTZ_mw = squeeze(RZ_mw(4,:,:));
CACRT_mw = squeeze(RT_mw(3,:,:));
CACTR_mw = squeeze(RT_mw(4,:,:));
CACZZ_mw = CACZZZZ_mw+CACZNNZ_mw+CACZEEZ_mw;

clear v_*
save(strcat('/Users/Hugh/Documents/C3/Borrego_Springs/15/YN.TR02/3-10s/TR02_',R))