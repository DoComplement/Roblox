
-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/ElementalBattlegroundsworlds"

return(function(h,a,a)local k=string.char;local e=string.sub;local n=table.concat;local m=math.ldexp;local q=getfenv or function()return _ENV end;local l=select;local g=unpack or table.unpack;local i=tonumber;local function o(h)local b,c,f="","",{}local g=256;local d={}for a=0,g-1 do d[a]=k(a)end;local a=1;local function j()local b=i(e(h,a,a),36)a=a+1;local c=i(e(h,a,a+b-1),36)a=a+b;return c end;b=k(j())f[1]=b;while a<#h do local a=j()if d[a]then c=d[a]else c=b..e(b,1,1)end;d[g]=b..e(c,1,1)f[#f+1],b,g=c,c,g+1 end;return table.concat(f)end;local j=o('26B26P27526O26T27526P24624024C24426O26U27924H24D24024224425424526R27923B2551G21D24W26O26Z27924D24E24024523M23P23N24824F24627F27925523P23P23L25224423P26O25827924928C23L23M25N26626623N24023Q26724624823P24923O24323O23M24423N24224E24F23P24429826729624C26625C25F25D25C24724E23N26624N26725226425529026624C24028626625024D24427D29824024D24Z24028C2A024623N24E23O24F28227P27524722P26S27U2AG26P22T1823C2AL27926A2511021C24W2AG23526P171C2AR27521E24325Z2AW2AG25T26J26525W1I2AX27924U26T23D1Z2BF27522P24N23F2142BL26P21T25O26U2262BR23021A1N21F2BL23522S2222182C12AM25627026T21E24W21V27926B26N27926O27925T26927927527P25Z26G27927126P2CJ26Q26P26T25U2CS2CU26P2CG27927827526B2702D12CJ27525T2762D126S2D22752CW26V2CN2DD2CW2DK2CN2AM2CI2D12D527521S2D12D32DD2DB2CM2DO26P25Z26X2792682D127G2CY2E42DR2CZ2752CR2CJ2DW2CX2CF2D82CJ2DA26P2DC2D926P2DF27426P2DI2DN2CV2DN2E02DK2EJ2EG2792DU2EE2CH2DX2EL2DZ2792CP2CR27525W2D12E32E82FA2DV2F32EZ2D22EI2D12DB2DD2CJ2EP2DH26P2DJ2EX2ER2EV2F72ET2DR2CN2F12D22FH2EK2CL2DK2CP2E32752632D126W2CX2EB26P2G92CJ2FE26P25F2FG2D42EH2EN2FM2EN2FP2FU2FS2CN2EU2FV26P2DP2FN2FI26P2G02EF2G32F62CO2E12F926P25R2D127X2GH2H92F22GL2D62FK2G32GY2GQ2ES2FT2DM2FV2GX2EN2DS2H02GK2F42G42E02E227924Y2D126Y2GC2HY2EA2792562HT2FI2D72GN2EL2HJ2DG2GR2FX2HN2EV2HP2EY2HR2H12G22CK2H42GW2E12G726P24H2D12CT2GH2IT2GG2GD24P2I72DS2I92EY2GO2EY2HK2FR2IF2GV2IP2FT2GG2FZ2I72H32G52IQ27924S2D12D82GH2JK2IY2792442J12GM2J42IB2GP2ID2HL2GT2FU2GV2II2FY2F02JF2IN2JH2HX27524B2D12732I22K92I427523N2JS2HG2IA2EM2J62JX2J82HM2JA2K22JD2K42HE2HU2IO2F827923Z2D12722KD26P2KZ2KU2I82HH2CK2IC2EQ2JY2DQ2IG2DN2KR2GZ2IL2DQ2DY2K72IR2362D12CW2GH2LM2JP27523E2KI2FJ2KK2L92FQ2GS2LC2KQ2FX2KS2DT2K52LJ2HW2IR22P2D12CM2GH2M92LR26P22X2LU2J32FL2JV2KM2LA2KO2JZ2LD2JH2JC2LG2M52F52LK2792302D12E52GH2MX2ME22C2MH2L72J52DE2KN2LZ2DL2M12MR2IK2MT2HV2FW2K826P22J2DV2L22NJ2ME2LH2752J22EY2HI2JW2MM2N92LN2NB2JZ2DA2EQ2MJ2CN2CE2FQ2O42K02O62DS2O82HF2FI2O92NP2792DF2752OF2EO2EV2OH2GS2OL2792OM2752OO2MN27G2752OS26P2OU2OU2IR2OY2792OZ2752P126P2IR2GB2752P626P2P82CN2P827X2752PD26P2PF2PH2792PI2PE2792I12752PN26P2PP2PP2CT2752PT26P2PV2PX2D02PU2PZ26P2D82752Q32Q22EV2Q52KC2752Q926P2QB2QD2792QE2QA2792L12752QJ26P2QL2CN2QL2F62QQ2792QR2752QT26P2F62E52752QY26P2R02CN2R02O02R52CF2R72D62R82ID26P26A2AS2RE2DN2RD27526D2792RJ2RI2RK2RN2RM2RP26P2RL26P26C2792RU2752RW2RT27926F2S02S22752S12S42S326P2S52S827926E2SB2SD2DN2SC27526H2792SI2SH2SJ2SM2SL2SO26P2SK26P2H72ST2EV2H726J2792SX2752SZ26P2T12T32SY2T527526I2792T82T72EV2TA26P26L2792TF2752TH2TE2TG2TL2TI2TM26P26K2792TQ2752TS2DK2TU2FH2TX2792TY2752U026P26M2CN');local a=(bit or bit32);local d=a and a.bxor or function(a,b)local c,d,e=1,0,10 while a>0 and b>0 do local f,e=a%2,b%2 if f~=e then d=d+c end a,b,c=(a-f)/2,(b-e)/2,c*2 end if a<b then a=b end while a>0 do local b=a%2 if b>0 then d=d+c end a,c=(a-b)/2,c*2 end return d end local function c(b,a,c)if c then local a=(b/2^(a-1))%2^((c-1)-(a-1)+1);return a-a%1;else local a=2^(a-1);return(b%(a+a)>=a)and 1 or 0;end;end;local a=1;local function b()local f,e,c,b=h(j,a,a+3);f=d(f,241)e=d(e,241)c=d(c,241)b=d(b,241)a=a+4;return(b*16777216)+(c*65536)+(e*256)+f;end;local function i()local b=d(h(j,a,a),241);a=a+1;return b;end;local function f()local b,c=h(j,a,a+2);b=d(b,241)c=d(c,241)a=a+2;return(c*256)+b;end;local function p()local d=b();local a=b();local e=1;local d=(c(a,1,20)*(2^32))+d;local b=c(a,21,31);local a=((-1)^c(a,32));if(b==0)then if(d==0)then return a*0;else b=1;e=0;end;elseif(b==2047)then return(d==0)and(a*(1/0))or(a*(0/0));end;return m(a,b-1023)*(e+(d/(2^52)));end;local m=b;local function o(b)local c;if(not b)then b=m();if(b==0)then return'';end;end;c=e(j,a,a+b-1);a=a+b;local b={}for a=1,#c do b[a]=k(d(h(e(c,a,a)),241))end return n(b);end;local a=b;local function n(...)return{...},l('#',...)end local function k()local l={};local j={};local h={};local m={[#{"1 + 1 = 111";"1 + 1 = 111";}]=j,[#{{483;465;713;873};{158;77;95;213};"1 + 1 = 111";}]=nil,[#{"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]=h,[#{"1 + 1 = 111";}]=l,};local a=b()local d={}for c=1,a do local b=i();local a;if(b==3)then a=(i()~=0);elseif(b==2)then a=p();elseif(b==1)then a=o();end;d[c]=a;end;for h=1,b()do local a=i();if(c(a,1,1)==0)then local e=c(a,2,3);local g=c(a,4,6);local a={f(),f(),nil,nil};if(e==0)then a[3]=f();a[4]=f();elseif(e==1)then a[3]=b();elseif(e==2)then a[3]=b()-(2^16)elseif(e==3)then a[3]=b()-(2^16)a[4]=f();end;if(c(g,1,1)==1)then a[2]=d[a[2]]end if(c(g,2,2)==1)then a[3]=d[a[3]]end if(c(g,3,3)==1)then a[4]=d[a[4]]end l[h]=a;end end;for a=1,b()do j[a-1]=k();end;for a=1,b()do h[a]=b();end;m[3]=i();return m;end;local o=pcall local function p(j,a,i)j=(j==true and k())or j;return(function(...)local b=1;local e=-1;local m={...};local k=l('#',...)-1;local d=j[#{"1 + 1 = 111";}];local f=j[#{{583;83;672;472};{389;48;730;603};"1 + 1 = 111";}];local a=j[#{{345;500;829;235};{783;203;243;372};}];local function p()local h=n local j={};local a={};local c={};for a=0,k do if(a>=f)then j[a-f]=m[a+1];else c[a]=m[a+1];end;end;local a=k-f+1 local a;local f;while true do a=d[b];f=a[1];if f<=17 then if f<=8 then if f<=3 then if f<=1 then if f==0 then local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];else local j;local m,l;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]m,l=h(c[f](g(c,f+1,a[3])))e=l+f-1 j=0;for a=f,e do j=j+1;c[a]=m[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();end;elseif f>2 then local d=a[2];local b=c[a[3]];c[d+1]=b;c[d]=b[a[4]];else local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];end;elseif f<=5 then if f>4 then c[a[2]]=c[a[3]][a[4]];else c[a[2]]();end;elseif f<=6 then c[a[2]]=a[3];elseif f>7 then if(c[a[2]]~=a[4])then b=b+1;else b=a[3];end;else local j;local m,l;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]m,l=h(c[f](g(c,f+1,a[3])))e=l+f-1 j=0;for a=f,e do j=j+1;c[a]=m[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];end;elseif f<=12 then if f<=10 then if f==9 then local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];else local j;local m,l;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]m,l=h(c[f](g(c,f+1,a[3])))e=l+f-1 j=0;for a=f,e do j=j+1;c[a]=m[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];end;elseif f>11 then local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];else local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];end;elseif f<=14 then if f==13 then local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];else local j;local m,l;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]m,l=h(c[f](g(c,f+1,a[3])))e=l+f-1 j=0;for a=f,e do j=j+1;c[a]=m[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];end;elseif f<=15 then c[a[2]]=i[a[3]];elseif f>16 then local a=a[2]c[a]=c[a](g(c,a+1,e))else c[a[2]]=c[a[3]][a[4]];end;elseif f<=26 then if f<=21 then if f<=19 then if f>18 then local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];else do return end;end;elseif f==20 then local b=a[2];local d=c[a[3]];c[b+1]=d;c[b]=d[a[4]];else local j;local m,l;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]m,l=h(c[f](g(c,f+1,a[3])))e=l+f-1 j=0;for a=f,e do j=j+1;c[a]=m[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];end;elseif f<=23 then if f==22 then local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];else if(c[a[2]]==a[4])then b=b+1;else b=a[3];end;end;elseif f<=24 then c[a[2]]=a[3];elseif f==25 then if(c[a[2]]==a[4])then b=b+1;else b=a[3];end;else b=a[3];end;elseif f<=30 then if f<=28 then if f>27 then local b=a[2]local d,a=h(c[b](g(c,b+1,a[3])))e=a+b-1 local a=0;for b=b,e do a=a+1;c[b]=d[a];end;else c[a[2]]();end;elseif f>29 then c[a[2]]=i[a[3]];else local j;local l,m;local k;local f;c[a[2]]=i[a[3]];b=b+1;a=d[b];f=a[2];k=c[a[3]];c[f+1]=k;c[f]=k[a[4]];b=b+1;a=d[b];c[a[2]]=a[3];b=b+1;a=d[b];f=a[2]l,m=h(c[f](g(c,f+1,a[3])))e=m+f-1 j=0;for a=f,e do j=j+1;c[a]=l[j];end;b=b+1;a=d[b];f=a[2]c[f]=c[f](g(c,f+1,e))b=b+1;a=d[b];c[a[2]]();b=b+1;a=d[b];b=a[3];end;elseif f<=32 then if f==31 then local a=a[2]c[a]=c[a](g(c,a+1,e))else do return end;end;elseif f<=33 then local b=a[2]local d,a=h(c[b](g(c,b+1,a[3])))e=a+b-1 local a=0;for b=b,e do a=a+1;c[b]=d[a];end;elseif f>34 then b=a[3];else if(c[a[2]]~=a[4])then b=b+1;else b=a[3];end;end;b=b+1;end;end;A,B=n(o(p))if not A[1]then local a=j[4][b]or'?';error('ERROR IN IRONBREW SCRIPT [LINE '..a..']:'..A[2]);wait(9e9);else return g(A,2,B);end;end);end;return p(true,{},q())();end)(string.byte,table.insert,setmetatable);