clearvars -except S R R_list
[b,a] = butter(4,[(2*1/10*0.2),(2*1/3*0.2)],'bandpass');
S = 'TR02'
R = 'SAL'
src = ['YN.',S];
rcv = ['CI.',R];
scomp = 'BHZ'
rcomp1 = 'BHZ'
rcomp2 = 'BHN'
getC14C3
v_rcv_ZN = v_rcv;
v_src_ZZ = v_src;
[CAC1_ZZZN_mw,CAC2_ZZZN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZZ,v_rcv_ZN);
CACZZZN_mw=(filtfilt(b,a,CAC1_ZZZN_mw+CAC2_ZZZN_mw));

scomp = 'BHN'
getC14C3
v_src_NZ = v_src;
v_rcv_NN = v_rcv;
[CAC1_ZNNN_mw,CAC2_ZNNN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NZ,v_rcv_NN);
CACZNNN_mw=(filtfilt(b,a,CAC1_ZNNN_mw+CAC2_ZNNN_mw));
scomp = 'BHE'
getC14C3
v_src_EZ = v_src;
v_rcv_EN = v_rcv;
[CAC1_ZEEN_mw,CAC2_ZEEN_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EZ,v_rcv_EN);
CACZEEN_mw=(filtfilt(b,a,CAC1_ZEEN_mw+CAC2_ZEEN_mw));


scomp = 'BHZ'
rcomp1 = 'BHZ'
rcomp2 = 'BHE'
getC14C3
v_rcv_ZE = v_rcv;
v_src_ZZ = v_src;
[CAC1_ZZZE_mw,CAC2_ZZZE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZZ,v_rcv_ZE);
CACZZZE_mw=(filtfilt(b,a,CAC1_ZZZE_mw+CAC2_ZZZE_mw));
scomp = 'BHN'
getC14C3
v_src_NZ = v_src;
v_rcv_NE = v_rcv;
[CAC1_ZNNE_mw,CAC2_ZNNE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NZ,v_rcv_NE);
CACZNNE_mw=(filtfilt(b,a,CAC1_ZNNE_mw+CAC2_ZNNE_mw));
scomp = 'BHE'
getC14C3
v_src_EZ = v_src;
v_rcv_EE = v_rcv;
[CAC1_ZEEE_mw,CAC2_ZEEE_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EZ,v_rcv_EE);
CACZEEE_mw=(filtfilt(b,a,CAC1_ZEEE_mw+CAC2_ZEEE_mw));




scomp = 'BHZ'
rcomp1 = 'BHN'
rcomp2 = 'BHZ'
getC14C3
v_rcv_ZZ = v_rcv;
v_src_ZN = v_src;
[CAC1_NZZZ_mw,CAC2_NZZZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZN,v_rcv_ZZ);
CACNZZZ_mw=(filtfilt(b,a,CAC1_NZZZ_mw+CAC2_NZZZ_mw));
scomp = 'BHN'
getC14C3
v_src_NN = v_src;
v_rcv_NZ = v_rcv;
[CAC1_NNNZ_mw,CAC2_NNNZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NN,v_rcv_NZ);
CACNNNZ_mw=(filtfilt(b,a,CAC1_NNNZ_mw+CAC2_NNNZ_mw));
scomp = 'BHE'
getC14C3
v_src_EN = v_src;
v_rcv_EZ = v_rcv;
[CAC1_NEEZ_mw,CAC2_NEEZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EN,v_rcv_EZ);
CACNEEZ_mw=(filtfilt(b,a,CAC1_NEEZ_mw+CAC2_NEEZ_mw));



scomp = 'BHZ'
rcomp1 = 'BHE'
rcomp2 = 'BHZ'
getC14C3
v_rcv_ZZ = v_rcv;
v_src_ZE = v_src;
[CAC1_EZZZ_mw,CAC2_EZZZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_ZE,v_rcv_ZZ);
CACEZZZ_mw=(filtfilt(b,a,CAC1_EZZZ_mw+CAC2_EZZZ_mw));
scomp = 'BHN'
getC14C3
v_src_NE = v_src;
v_rcv_NZ = v_rcv;
[CAC1_ENNZ_mw,CAC2_ENNZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_NE,v_rcv_NZ);
CACENNZ_mw=(filtfilt(b,a,CAC1_ENNZ_mw+CAC2_ENNZ_mw));
scomp = 'BHE'
getC14C3
v_src_EE = v_src;
v_rcv_EZ = v_rcv;
[CAC1_EEEZ_mw,CAC2_EEEZ_mw,sta_use] = C3_SC3(src,rcv,lat,lon,file_name,v_src_EE,v_rcv_EZ);
CACEEEZ_mw=(filtfilt(b,a,CAC1_EEEZ_mw+CAC2_EEEZ_mw));

CACZN_mw = CACZZZN_mw+CACZNNN_mw+CACZEEN_mw;
CACNZ_mw = CACNZZZ_mw+CACNNNZ_mw+CACNEEZ_mw;
CACZE_mw = CACZZZE_mw+CACZNNE_mw+CACZEEE_mw;
CACEZ_mw = CACEZZZ_mw+CACENNZ_mw+CACEEEZ_mw;
rotation_matrix
clear v_*
save(strcat('/Users/Hugh/Documents/C3/Borrego_Springs/15/YN.TR02/3-10s/TR02_',R),'-append')