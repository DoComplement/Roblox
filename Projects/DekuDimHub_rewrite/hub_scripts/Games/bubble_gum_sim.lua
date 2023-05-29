-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/bubble%20gum%20sim"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=2512643572 or nil~=getgenv()[":?=R;N#igBObq-Tw(iL9d&q;hy[)?w8t"])then return end;
getgenv()[":?=R;N#igBObq-Tw(iL9d&q;hy[)?w8t"] = true;

return(function(h, m, q)
    local k = string.char
    local e = string.sub
    local o = table.concat
    local n = math.ldexp
    local r = getfenv or function()return(_ENV)end;
    local l = select
    local g = unpack or table.unpack
    local j = tonumber
	
    local function p(h)
        local b, c, f = "", "", {}
        local g = 256
        local d = {}
        for a = 0, g - 1 do
            d[a] = k(a)
        end
        local a = 1
        local function i()
            local b = j(e(h, a, a), 36)
            a = a + 1
            local c = j(e(h, a, a + b - 1), 36)
            a = a + b
            return c
        end
        b = k(i())
        f[1] = b
        while a < #h do
            local a = i()
            if d[a] then
                c = d[a]
            else
                c = b .. e(b, 1, 1)
            end
            d[g] = b .. e(c, 1, 1)
            f[#f + 1], b, g = c, c, g + 1
        end
        return table.concat(f)
    end
	
    local j = p("21621J27521I21P27521J22J22G22E22B21W21V21X22M22H22821I21F27922822E22I22A21I21C27923J21V21V21Z23422A21V21I23A27922N27W21Z21W1D1O1O21X22E21S1P22822M21V22N21U22D21U21W22A21X22C22G22H21V22A28S1P28Q22I1O1615171622922G21X1O22P1P2341Q23J28K1O22I22E27I1O23I23E22T23622R23A22T23723623721I21R27923822E28T22829522621I1Z27928L22D22D22J22A1N22821U22H1N21W22M22I21U22J29X29521I21D27922R22G2282282A821I21Q27923A21U21V22G1N23927B21S2AU2AW2AY2B022S22A22J22J21I2132B62AZ1N22Q21Z22828C22B2A923421U22I2A22BF2B02BI2BK27D2A92292AJ21T29521W21I2112BS2BH2BJ2BL2A923522E22C22A2C22AN27522S22J22M2BM21X2B527522O22E22J22K22S21Z22A22A22B2792CX1723B2CX27923223B2CM21J23H2BP21Z22V22G21S28O2AM2792392AY2AZ22H2DE2752392AP22G22J2C229U2752341N23D22G2382CI21Z21I21E2DF1N23522J2A121A27928T2A821Z29521V1N2BG22T22E22H22B22G22I1N22V2AJ2262DD21M27923F22E2281N22S21S28H22C22N2E3142D52B921X21T28O23J22G2DZ27T27523821X2CV28H2C22E12752ET22D2BA21I21729V2FF22B2FH2EE2B022E1N21X1N21Y1N2942FY21U22M1N2CI22D22E21I1K2FQ2FG21V21W2FU1N23722A22K21U2372AG2251K101E11171N22E22K2FW27Q2G62DO2DK21J22T2BA27C22B2ER27527827627M2752A72DB27L27921S29G21V2D127525J182772DF2B32DG2A62AT2HB21J27O27Q2HO2DS2802F521T22M2CC21I2122792H321Z2CI22C29X2CV22S2AZ28C22827R2C427523D28021S29522K2H322I22G28T2362F728S2HY21J23522M2FF2I12DD2CF21J2AC21Z2CB22K2CX2A32752112I627627921125621J21I2JJ27921D2342JL2102JL27521F2312792JQ2JK2JH2JL21H2CX2D02JK2K32CX2JK2JF172JF21G21J27M2IJ2K02FJ21J1N2752K02K02AN2IJ27M2FC2CX2K027M2K02KH21J2KJ21J29U2KT2KV2AV2KM21J2H92CX2E12K62CX27M2KF2792K02JF2HU2JL2K622V2792L62BD2LH2KF2HH28H162HF2752LM2812HU2HW27R2KO2EN22E2EP21X2C221O2ES22G2IB22J2LX2LZ2D523822N22E28C22C28T2CL2BE27529C29F22H22G2CJ22T22G2IS22V2MC2812J423823528C2HX2KA27522H22A21S21J25V21F23K25K21125X2352D022Y22I26Q25L2111B26P2D01S1O25Q24O22321L21Y26V2HK21J2HM21J23K24722T25325022C2NB21J21G21Q2592142102NI2D023Y1X1Q23B24S25G21Z2NS2791J2JG2JE2JR21J2JY2K427521D23I2JL2L52JL2JT2792OW2OY2752GB2JX2JI2JK2LB2752582LE2JL2IJ2JK2MZ2KG2JF2JK27M2KT2K42E12PJ2JL2AN2PM2JK27T2KD2KW2792KY2KU21J2L02752KA2L32L12M22JC2752E121N2HK2KE2PW2MH2JK29U2K02PC2PW2Q42PW2H72K52PW2JX2K92PU2PG2KB2PF2PA2PL2QP2PO2QP2PR2KI2PT2752PV2K02PY2O421J21L2JG2JS21J21K2R721J2E12MH2KP2RC2QA2JF2QD2QQ2LH2JR2LG2JF2761L2LH2PE2AB2BQ2HU2LR21I2Q321J2DG22622S22N2FA23I28T2BQ2DR21J2362MS22N2BO2BQ2PE2SD2IX2DV21X29F22J1N2SG2Q72CG27G2802F02262SM2BP2C327923622727G2FW2IE2FF21V2SS2SU2BQ2AV2FD22N2N22ST2SG2RA2752SY2T01N2MA2TB2T629T2SX21Z2I32TL2T821J22S21U2CT2FY2TD2792TT2TV2GH2TU28O2TQ27923C27Q27O2TL2L322Q22H2FF2CP2TL2RY23E28R27F2U32SG2TR22Q22J2TH2SD2NT2NV2NT2D42LT27P27R2L327Z21V2I12I327R2ON2I82IA2IC22B2IE2952EU2II2792IL21V2IN21X2IP22A2IR2IT2IV2812L32IZ2J128O2F72CL2S82CS2CB22A2SG2L323J28O2MM22C2TL2QJ23F22A2IH2EI2MC2TC2SV2SO21J23E22628I2I32UE2UL27923422G22B2E52W42792UB22M2VS21W2WJ2SV2TR23A2CI28U2TL2TE2H227D22M27C2ME2WT2BN2SV2R62TF2272TV2AG28U2ED1K141521I2XC2S92XE28O2XG28S1N1K12132CX2RN2OP2ON2L62OQ2OO2JN2JL23C2OO2P121J2Y62P42JZ2CX1M2PA2QM2JL2PE2PS2HU2IJ2KA2L92R82WD2IJ2E12J42IJ2AN2KO2IJ27T2S82IJ29U2TR2IJ2AV2Q12H821J2RY2IJ2M22YP2752Q72QJ2IJ2ER2XN2IJ2R62X32IJ2RA2RE2IJ2BE2ON27927M2BE2JX2E12E12IJ27524Y21J2AN2YK2E12QX2JS2KH2E11T2PB2JI2AV2P721124L2L221J2JQ2D1310A2PB2752AV2JB2QR2AV2AV1Y2OP2752M21X2HK2AV2M22KS310K2PX21J1W310N311021B2CX2M22L62792Q72P72792ER2PE2792R627M2S831102R62PH22G2RG2182PB2ZU2R42JC310U2AN2E72QH27T2YN2PT2ZA31102192RB278311O2QH2M22FP2QH2Q72742QH2ER2152RB2R62142RB2RA2KT310R21J2BE2YE2QH2I62RQ2QH2C42ZJ2752JQ2ZM2752A32ZP27529U2A32ZT31102ZW21J2ZY2782YY2E12M22ZW21F2KH2AV23D310821J2ER310B310D2R6310G2CX313K310J313J21J310M2KT2ER2ER310Q2ZK21J310U2D12ER2RA310Y313S2ER3112313V313S31152792RA311Y2BE2J42792I62KO2R729U2WD313S2C4311L3110182OX2JU2QP21J2XY2LI312O2JJ2KO2BY22E2C02M02LP21J2RW2RY2S02S22S42S621I2WD2SA21X28I2E431522C127S279315I31532C22TR2B221U22A2FM21X21X2A12KF22V22M2252252G92MU2TA315V315X27923728R2AY2M92S328Q2AJ28T2IX2CO2MF27Q27B2DJ2S823828R2T027F31552WM22J22B2E02ES2VJ28R316W2CG2EY21X22J2UR2HN2UV2HX2UY2I02VR2V22I52I722A2I92WI28T2V82IF2VB2SW2IK2IM2IO2IQ2IS22A2IU2XH2IX2VP22A2J22CL2WD2VV2CC315N315K2KF2MW22G316R2HU22T28K2A12HU22P2MM316V2HU23A21Y21U31632792LX21W29F31552ET21T2G92KF22P28U2EK2H12342CP22E2272A12KO2EG27I22D2HE2KF2TT21X2IH2IX22R27H2EH2AB2AJ21X2CX23J2OM2RL2JC2P52Y32OU2JK2OW2PH314T2RG319U2WL313I2P62JA2YF312L2PD2RB2KQ2RB2YM2HK27M2Z42RG2YS2OS21J2YV2752YX2RB2Z02RB2Z331232Z62RB2Z92RB2ZC2RB2ZF312F2R931A92R5311P2RG2RE31372ZZ2RK2OP3102312M2ZQ310521J1H313I2AV2ON1N274310O310R2Z8310F310V31AO314531BH2A32KT31BH310Q27931172HK311A2HK311D2HK311G2QZ310Z311K2KB311M2E1312231342E12YI31742AN3141312L311X2HK29U2Z7310Z31122QH278314B312L2M2311V312L2Q73122312C21J3125312L2R63128312L2RA312B312L2BE312E312P21J312H312S2QR312L2JQ314Y27929U2JW31B5311031B1313831C1211313B31B731043110235313I2ER31BE274313W31BI2752RA313O311C31AW314531DW31BP27531DW31BS31DY2RG2D1314F2HK314I2HK2C4314L313P310R314P2AV1D314S2RL2LF319N2JJ31E8315L2753151315O315531572DF21U2S12S321Z2S52VJ2IX315F315H2VW2FI315M31F92XM31EZ2HS2A9319E22G28K2AT2RY2IZ22H2AD23E22C316O2H02X32MW22M28U2WO2ST315Z28C316G2WD2342FF2X12HR2A727R315822J315S2B128K31G7315D31682MC27I2EV23922A2MC316V2P723329S2HU2322BP1M2D52H322B1N22R319G22G2LJ27531GW2SM2B331GI1N2362EP21W317531552LU2IX2UZ2V12I42V4317F2V6317I2V92IG2VC317N2VF317P316Y2VL317U2VO2J0317X2VR28O2CX1V319M2RO2OP319P2L62OT2OV2PA2Y82P0319V1G319Z2QG312Y31A22QF2YI2QY2YK2PZ31EA2L7310E2QH2YR2RB2YU2RB31AI2QH31AK2QH31AM31CL31AO312621J312031AS31CU2ZG2752ZI31AX31C331DM31B02CX2ZY31002JG31B62RE313E2RG31BB2YB31BD2PU31BG313531CO31BK310H31BM3113310L31JX21J31E831AO31182ZB31IG31E1311E31J92QQ311I2AV31C321F31C521J31C72KB319V2OR314W2LH2J431HD2UW31ET314V2EO28O2M12M32M52M72DD2TR2MA2MC2CB2MF2TM2MI2BP2EH318F2D52CO2CQ2CS2CU2CW2792YV22Y2PA2R02QP31452K42KA2PP2QQ31LN2RD2JF314G2QK27631KM31772LV318M31KR31542RY23F2M42CP31KW2CL31KY2MB2MD31L22S82MJ31L62CJ2D52D722I2D92DB31I031LE2JG31LG2OR2QR2K431LK2YH31MP2OX31MT319S31DO2JK31LS31EQ31H22JJ31LW2IX2IE2MS28O2BO22M317D2CG280316O2FF31N823622H22E31G731LD2HK2D42L62G92S823I22H27F2EH2I42PE2N12B42TR2F921Z2TV23927I31KP31M531KT2FK31M32M631LZ31L32RZ2J82J722C22K31KP31O222H22R2262CT21I2L622D2NT21R31NM27922C2NT2132D027931I22JC2X32L6312K2LA31DA2792KA2YJ2HK2KA31K331P6313R31AE31LI2D131032QC31A52OO2R1311031PL27831PL2RY31P42QE2L42RB2Q52792K831192QQ31362J431P331AH31A331DL2QY31P22QY2R22QR2KV31PO31Q831J22RF31PS31E12QH31E631PW2CX2Q72R631Q02QO31PG31Q42YY31Q631QP2KZ31QA2PW31QC2PW2K031PQ31QD3136312U314C31QK31PY31B131I431J431KL2792ML22C2DY31KN31782WL317A2F6317C2L3318A22H31HH31LX2SP317F2CT316V2KO28Q31FN22A2ME21I2PE2I92CL2LW31LZ31O621J31M231KV31OA2KF2IR28M27R2S82UZ2UH31SD31KP23G22A226316921S22H2P72S82H131RD31RF31N331S42LY31KS2RX31KU31M431OA31M731L02ME2DD31MB31L52ML31ME2RY31KZ27J317X21V2IC2NT1H31OX31QJ319O31EQ31I82R82K42Y827M319X31K42YB2QY2R01F2D131LM31AX31Q22RG31U12QV31QQ2PS311I2RF31EP31R92TR31ON27N31SS2M431SU27N31KO31SW2LZ31S631S831T131SX31M629V31M831L131T627U31T831L731TB2MB31TD31N528T31TH31TJ31AW2751H22U31PC31TP319V31PA31KH311F31IF311B31DR31MO2QF310B2QN31PF31TP31MV31U22QU31VN27T31LN29U2YL31102D131A431U92OO21I31CN21J1Q2NT31362Y12RF31PF2CX31P731IL2NT31QZ31P531PV31U32KU22R31K527531CW2K02YG31TV31WE2PT31U12R331Q331QI31AF31QP31162Q82PW313631AB2Z531W831PY31WG21H31WI31WM2CX31CN31X8314V31EQ31C131WC31N231UH2HX2KO28N31RK2I431UJ31SY31M131O831M531OB31SG31FI28N31SJ31SL31SN2DJ31RV28R2N131RZ27931CK2JJ2KF2B32DD31OO31RG31RQ21J31XK2I231XM31LY31UO31UL31XQ31OA31SF28031SH28N31HC2P722W2342H123523F23223I23D23431PA31T331M92DD2UA31O028O2AP2M031H12L631DR31WC31UC2DL31ZE31S731ZG22T2NT1Z2D42KO31SK31SM2DB31XZ31OT31Y131RY2812KF31ZO2BI31WC23B2PE313O21I31YR31YT2J431YV31YX31YZ21G31ON31NP31NR31TF22H31NU31RC2N231OB2392WN22623422621X31H12WD320K22B226318V27B22C28H2A12L62XY27925Q25E2D42TR29F22731Z8318J31YC318V2ME295142CX26F25B26S2RZ2H122C2292MX27R2MU2MW31KO2S82F7320W320Y31XF21J24T24U3220322023Y2HN2S832172352952I42KF21W2J731SO2L631CZ31EX2HI316C31T431MA31UU2MK31L72QJ2LX21V2G222I31N52EI320A31ZG23F31ZI31XF31ZG23531ZG2392NT23I2D4321T2H4320X21V318C31XH27R2TR22O2IO322B2VW21I2QJ23821U315V2XH29W27Q28C21I2X331FR21X2FS31NH28T321R31RH27527B22G22K321C2IF2H12MV321O31S0320H2N3321Z322124U2722HN2L62FB2793245321E321Y324E24U3223321L321N31KO320431YU31YW31YY31YT2KO2BM27F320P22631K725Z2JG2JI31R92PE31MO2NT31U1314531W921J31PX2R8311Y31Q72D1314G31MO31LN314J2QK31BB279310Q31PI2Y8325S27522I31EQ1N325Q2792TR31LH31VN2L331VW31BA2CX325V29U325U31EN27531153134310S2CX1I31P42JS319V1R2JR325X31I4325Z325K2QK325J2K4325O2RL326021J326M325T326L326N325Y325G310Z31EO31QP2K43265325P2CX31IE3270279327C31VC275326Z325W326J31BA31V7327H2JL326A3271326F31XE326I31WO21J326O31PK326X31B3327631VL2JL326V2JF326X1C327O327G21J32862K6327W31P2327Y3262325M2QP3279326W2CX328A2PT2Y8328L2Y821U327231IN2JC314O313S32812JK2R631LN312J2QP2BE31LN2ZP31XB31QW31Q931V831QP2KA2Q031QF311R31LJ312L2K02QJ31PL328Y31QD329031WD2BE31VU2ZW2KT329A31JU31TO31QP27M27M314G2OW31PF311Q314J329V31IO319W31QP311Q32622AN325J2AN2AN3265311Q31U4311Q2A32YT31XE31IN2AN3145329R31K12KV31WA2R4329H31IN2KA329J2R42KA329L329R329232AS31K0329C311E31MQ329C326631A031B12Q731PB2R8328031VN2AV31B12AV3118328G2PA27831B127832BH31PK31VP31B132A8326S3277328231DO31Q331PB2HU2LD23V328R327X326R32BC325N31ZD326727923N32872Y832C9328B327331JV32C4328H32C6326X24Z32CA319V32CK31TS21J32CC327J31WO1H23327925B32CL32CV326C32CP32C12YI31X832AR2PA32AU2K4329L2K432AZ2PA329431B431PL32622KA2HU329Q2R4326532AO32BS31QG329G31QU2PW32AU2KV329L2KV329N31IN329P32B031E032A231PF32A2329X32DD31PV31B62ZQ2QQ2L92E132DH32E531VV31AE32EB31B332AB31PT31IS2KT32AF312L2AN31U72R432AK2QR32AM32B2312L2KA32D4329R32AU329R32AX2R432DA32ES31PR329D2PA311B2KV32B62RH31PY2PH2CX32C032CD328S2OP1O2JL31CD31LN2JQ31U631A731112RB311H2HK32FC2K032B832C12KF2112322JL32D42K432D62JL32D82JL2BE31B1326E312L27531CQ31U13122314G26O2Y7319V32GG32CO2RO2XW31IP173107310Z29U32743139325F2CX32EN32GU31ML32EO32BA32E732742AV32GR2CX32GT327432GW327431IW31IP31WU32EO327U31PT31X331WK31WY31PB2PE31U131CW31P432H032HG2PW31U12KA327427M31CZ31XD32FI2JC23G31EQ32742K032AP32BB31WP2ZV31LR31WY31XF2KV2QF32EF2PK329F31WV31TY32C62KA2K0327431AK2PS2RY31PL32I62R4312027M31202Q631WY2E132FU32H531K5311B329631AY31B1313Q32IM32DP2Q931VU312X2QQ2ON2YQ32BV31P432IW31MX31E232IE32IN31QD32IP2KA32IR31RA31IR32JO2RF32JF2QB310R32DN329S21D2N33259327Z25331XD32K1327U32K332F525132K232E727932K72NT24N31WD31VY31182RY317027A31MJ2CL2L62B431ZB31HC2L62C22L632332HK25J23S31ZG2G92L6322X2L6316V2L631ZJ27931D82KG22L31VZ27531HB31A02K031V631I931A031IB32CZ29U32CD31K317321F31A4329V319V312E2JK1N32L82LI32LA2YC32LD32CU2JK2RA31MW2Y832M1327J32LL32LN31B327T2Y832LR32L732L931YD32LX327L2JL3133328M319V32MI2Y8311232LK2D132LM2JL2AV32M932LQ2JL32LT32MD32LB31WD32LE2JK2FP2JK2782Y832N2328832MB327V2OO27532MQ2JK2M22HB31KK2762L332KI31Y832KL2HG3230322Z32KQ323232KX322W31ZG32L22I72CX31D232MW32LV32ME32LC31BA32LZ31WV32LG319V27T32MO2CY32M732DG328832N632NY319N32MY2KV32N031RA32M2319V32B9328832M432N932M62PN2QQ32N532MV32LU32OF32MF32CT32FJ32BU2Y8310U32O831PW32M7326A32OC32OU32MX32OX32O332N62AV32OT32P332NB32M732N427532NG2JJ31TX2R032OV2RO32OG2PW32OY2JK102YC2Y832PU2YB31A42R031TR31MU31VU325I2R431MR31MY31QW2PQ329C311B31K732DI2KA311I31K731VU2TR31PX329B2M232DI2JK2Q732QD328V32I427M31PX27M31JA32QT31B72RA32QW2I632QY2R8312T32HF2QQ31PX2E132QV31PV2BE32R12RG32R032GX32I62RA32AH313O32JX32IF31I921J32KB32K631XD32RN2LD32RN314G32RN2KF1N32CW2RJ31BP32L829U29U310Q32RJ32BM31LH32RQ31X92PT32S532RW2PT2K0310U32MW32S132B132S42QL2JR32S72791132S932NA29U326V32LJ32SP2D1325Q29U32SN2JK31122Y832SX31I52PT32QI321F29U278313C2E129U2X321J326I32EO312H31PB32PK31FD2JC2QJ31W62YC328W2R431VU2LD2QN32Q631VO32SJ314G2KV32AL2PW31VR32B029U32RJ2KF2OR32RN2D1311531A832KF2CX2Y031SV31YH31UK31HF28031O5315529F28I2H128C2EI2EK31HC31XP31S931UO322I31Z32MG322L31MD22B2MO2MQ2MS3247323Z27R31NV320I2KO324L21X2F32HU2W027D31OB2DA2AF21V2X62DJ2L623331ZG23231ZG319V21J31IE2JC31CT32BO2D1325D31PC32VV31WZ2LC32BT31MW2PS31AD2R4325J329R32TX329R31PC32F832B0326632II32C62QF326T2YC32C531VS32BD32IE2L331PP32EU32JQ32QP32QL32I42KX2R827M2ER2KT32A232AU32A2329L2KF32WU2RG2E132WX32EC32AU311Q32DA2J432X432AA313S2KT32XE32AU32XE2ZP2KA31MZ2P732IX2JL27832J032NA31KM2S828N27W31GI2C232UC32LA317B2I42RE22Q31XK31NQ21Z2AY31RP2IX32Y62AY31NG2BM31RU31ZS31RX31Y331WT314Z27931ZO316O2BM315531NG2SV2P72352F32KO2VE2VG31OG31CD31NQ28X31GI2V5317H32VI2ET2282NT1J31V331XF31E81N22132L92PS2P731PL32LS31QD32XL2JF32O72PW2Y832ZN2Y832MI32OP2HK32BR31PB32H032BI31VM327K31PE31PS2L62Y8328U31JD2KK2JM2OU2K031DG32CO31DG330632RK21332N632JF31XC31I432TI313131W4314U32DM32IE32ZH32ZK312L32E02RF2KR32J12QT31WD32AA2N32HU31A032RM31WC32RN3118311531A632U9314H2LH32XZ31KQ2VW23I316V2K52P73187315522B2IC324A2751M1T2LS28431FI2CL2KF21Z2M52BC2KF31TF31GE2J427I31XK2812TR21S27H28T22922M2AT313O2DV2V02UW317Y21W1P22L21W316Z31792V032Y131G827U28632Y92L323H22S23C23D31NG28Q32YO2L322R22V2H321V323M2N12VT2AO2BA317F2EC2PE31LV323C32UF332P31XL332R2MI332T332Q2IX332W332Y2GI333131SE2792UD22B332B332D2VD2IS22S332H31HZ2M0332K332M22H31WX2JC3286326P31WY2PS31K732F431U12KC2QY32FX32AJ31WY334F31W7321X31XD32VT32BH31N32RY27V27X332U279333Q23D333S2WN31YC334V27Y28021I312R21J28527X28828A2LU332J320P2HD22728W2EK1O21T161O335E1O21I32VR21J1O31YE31KS1O22V31FJ2I318332M315G23C323V28O1A23A21W22C1H2CI22I28H1A16171721I32HX335T335V2M0335X335Z22C33612EC33642CK33673369336B2AG336E336G171H22C323M33621A330L2N12SZ2MR2IH323L31Z92CL2HU22H2AI22J32XR2LK2792J72J032XY279331M31TF31OB2AZ325131GI320327931ME2S82DI2BP315U2IX321732UH2KO2I92LY337V331W331Y3175322V332031NI2AT332331NR28O331S2LQ2HI31OV23B2P73312324Z2BA333Y27R332E334133432F631KS3346316Z338E3322337X338I315G33492OP24W31EQ31VI31WC3295334P2D1313632HK31AX31XD31U8339C32NA31R932KH3327332922A338T21I338V332G27Q332I33902DJ31N3332O32Y9334U333N333K333P332X332Z320F3352322G28H323S333B2EA2EC32Y931Y522R333C2EB315G2AP2LX2CC31NQ31NS320F31YC32UH32UQ31UN2LZ32S82JC22P339A2JF31VJ2PW339H31WD334I32E831WY330W31PL314G32TQ31P433BD2QK313632832PA339G31WW32E732FN2NT2KV31WR339K32IG33B327M33B532A231QY32A231R12QQ32ZW2CX319J279325X31K332PS31B731V92792ZS32T233132KG24M2PA31TZ31IA32WP330R32AV2RG32JC31MZ32BR311W32RK2OZ2RG314J31A8326632HE2Y732NW31VE2PU23733CG31VN33B732WE31PF329R32IP31IS326R32TL32HA31DE31WC311Q32QF32A331I432XR2Y1319T2PU32CW2P72AV2Y42K01U32GH27933DT32LS33DO326132MG33DS32XP328833DW2KG33DY310Z32LE33E132ND33E332MV33E631VV326I32J0330E2YP2JI32EV33DN31B42XC23832Q52RG2Y8311M2K631AI2Y131IE2AV2X32KT27827T32BF31WD2RL2Z1310Z31BE2Z53103310Z32IA2Z533F731AO27T31E032XQ2PW2CF2781B32MR328833FL32CO33ES32T22AV2QJ32N933FH29V311031R032882JU2JK32OY2K033EO32QN328833G4328832HZ2YB31JA279328Q2RA33FT31HB2R62KV21D23E2JL319R31AY2Y833GM2Y832FZ33ET32AI33GQ313I2R62ZP22431AW334F33GH32VZ31AW313031B733FT31E933GI31K831WI32M0328833HA328833GR32T22R6310M32RJ31P12QG32K5311B32K5311E33GG31WD1N22331WD32S325031102K232ZO319V33HY32LE29U22W32OZ2Y833I433FP31BC32FP2R025231102AV31W133FV31WX31PB310W313R2AV31CQ33DZ2K42Z2313T2JM2N332S532PZ33HM2CX32K5311833162CX32KD310I31JO21J31CQ31JD27832VT21J33J132TU33HW2KA1P32PV319V33JE331A31WO33AB31ZV337L331Y2L62P7319D333528033382DD31WC2YY325732NA32Z7314U327W2CX32LE32BW33HZ31ML31TU33JY328032PK31IQ32T231R921Y2RL2KK2JO310Z3303319V32BG33KC31IG32RJ32LV2K632K52D132KD31QT2Y82RO33KA326M2JC227325Y32I831R932IE31IK2R432EF33D8330T327Z325E33BP32B032A1339F31PV2S832RJ31KM32SK31XD31HB32JF33KG32RC33DU2752I632CO2KH2YB2AN2TR1N22Z32EG33KB32O431CG32F531AE32SS32AH31CI31WV312032SS31PF32SG2ER2IJ2782XN33DE33FH2KT32SG32TB32S52D132T632ZU2RL33LI33CI3314327U32U52CX33IZ32KA32VX2XZ31B32RE33MS31X82K632RN310B2I62AN32JB2JI33NA2CX32Z732ZV32PJ31XD2XY21131OP31I4339B32TN32AP32OB32WD321X33DK32HQ31I432JL33LA2RL32WE32MW31X82PR32EA31C131X633DI21J331832A433O032BU31JD27M2TR33O5329Y326D2PW2OW33OA32Q933OC33KB33OF31K533O833OJ32L833O131DH27M2RY33OO311E33OQ32P833OT33OM2WD33OO2LD313H2Q932ZJ32SJ33ME2R831J82RG31R42AN31R433F12LA31WI29U2L933P62PT33P832D333L932JB31PV33PE31V431CE32BV33O532U132S82K032SS33OK31BI33O3313O33OO314J33OZ32LS33OS310J33OM310M33OO311I33Q832MC31X82C433OM31E833OO326233QG33Q233QJ33O331CD33OO326533QO33QA2QM33OM31Y533OO31PQ33QV32SJ33QQ2QQ31XA31WI32IU333V33OI32MV31WO32IP27M33IM31WB32TX2K0312232JC32HM31IN33OJ31IN33RI312L2E132HV33RM32P82PE312B32KD32WE33JI21J")
    local a = (bit or bit32)
    local d = a and a.bxor or function(a, c)
		local b, d, e = 1, 0, 10
		while a > 0 and c > 0 do
			local f, e = a % 2, c % 2
			if f ~= e then
				d = d + b
			end
			a, c, b = (a - f) / 2, (c - e) / 2, b * 2
		end
		if a < c then
			a = c
		end
		while a > 0 do
			local c = a % 2
			if c > 0 then
				d = d + b
			end
			a, b = (a - c) / 2, b * 2
		end
		return d
	end
		
    local function c(b, a, c)
        if c then
            local a = (b / 2 ^ (a - 1)) % 2 ^ ((c - 1) - (a - 1) + 1)
            return a - a % 1
        else
            local a = 2 ^ (a - 1)
            return (b % (a + a) >= a) and 1 or 0
        end
    end
	
    local a = 1
    local function b()
        local f, c, e, b = h(j, a, a + 3)
        f = d(f, 55)
        c = d(c, 55)
        e = d(e, 55)
        b = d(b, 55)
        a = a + 4
        return (b * 16777216) + (e * 65536) + (c * 256) + f
    end
	
    local function i()
        local b = d(h(j, a, a), 55)
        a = a + 1
        return b
    end
	
    local function f()
        local c, b = h(j, a, a + 2)
        c = d(c, 55)
        b = d(b, 55)
        a = a + 2
        return (b * 256) + c
    end
	
    local function s()
        local a = b()
        local b = b()
        local e = 1
        local d = (c(b, 1, 20) * (2 ^ 32)) + a
        local a = c(b, 21, 31)
        local b = ((-1) ^ c(b, 32))
        if (a == 0) then
            if (d == 0) then
                return b * 0
            else
                a = 1
                e = 0
            end
        elseif (a == 2047) then
            return (d == 0) and (b * (1 / 0)) or (b * (0 / 0))
        end
        return n(b, a - 1023) * (e + (d / (2 ^ 52)))
    end
	
    local n = b
    local function t(b)
        local c
        if (not b) then
            b = n()
            if (b == 0) then
                return ""
            end
        end
        c = e(j, a, a + b - 1)
        a = a + b
        local b = {}
        for a = 1, #c do
            b[a] = k(d(h(e(c, a, a)), 55))
        end
        return o(b)
    end
	
    local a = b
    local function p(...)
        return {...}, l("#", ...)
    end
	
    local function k()
        local j = {}
        local d = {}
        local a = {}
        local h = {
            [#{{76, 78, 922, 749}, {288, 356, 564, 596}}] = d,
            [#{"1 + 1 = 111", "1 + 1 = 111", "1 + 1 = 111"}] = nil,
            [#{"1 + 1 = 111", "1 + 1 = 111", "1 + 1 = 111", {491, 167, 43, 765}}] = a,
            [#{{277, 803, 687, 54}}] = j
        }
        local a = b()
        local e = {}
        for c = 1, a do
            local b = i()
            local a
            if (b == 3) then
                a = (i() ~= 0)
            elseif (b == 0) then
                a = s()
            elseif (b == 1) then
                a = t()
            end
            e[c] = a
        end
        for a = 1, b() do
            d[a - 1] = k()
        end
        for h = 1, b() do
            local a = i()
            if (c(a, 1, 1) == 0) then
                local d = c(a, 2, 3)
                local g = c(a, 4, 6)
                local a = {f(), f(), nil, nil}
                if (d == 0) then
                    a[3] = f()
                    a[4] = f()
                elseif (d == 1) then
                    a[3] = b()
                elseif (d == 2) then
                    a[3] = b() - (2 ^ 16)
                elseif (d == 3) then
                    a[3] = b() - (2 ^ 16)
                    a[4] = f()
                end
                if (c(g, 1, 1) == 1) then
                    a[2] = e[a[2]]
                end
                if (c(g, 2, 2) == 1) then
                    a[3] = e[a[3]]
                end
                if (c(g, 3, 3) == 1) then
                    a[4] = e[a[4]]
                end
                j[h] = a
            end
        end
        h[3] = i()
        return h
    end
	
    local function n(a, h, f)
        a = (a == true and k()) or a
        return (function(...)
            local d = a[1]
            local e = a[3]
            local o = a[2]
            local j = p
            local b = 1
            local i = -1
            local r = {}
            local k = {...}
            local p = l("#", ...) - 1
            local l = {}
            local c = {}
            for a = 0, p do
                if (a >= e) then
                    r[a - e] = k[a + 1]
                else
                    c[a] = k[a + #{"1 + 1 = 111"}]
                end
            end
            local a = p - e + 1
            local a
            local e
            while true do
                a = d[b]
                e = a[1]
                if e <= 74 then
                    if e <= 36 then
                        if e <= 17 then
                            if e <= 8 then
                                if e <= 3 then
                                    if e <= 1 then
                                        if e > 0 then
                                            c[a[2]] = c[a[3]][c[a[4]]]
                                        else
                                            local a = a[2]
                                            local d, b = j(c[a](c[a + 1]))
                                            i = b + a - 1
                                            local b = 0
                                            for a = a, i do
                                                b = b + 1
                                                c[a] = d[b]
                                            end
                                        end
                                    elseif e > 2 then
                                        c[a[2]]()
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        if (c[a[2]] == a[4]) then
                                            b = b + 1
                                        else
                                            b = a[3]
                                        end
                                    else
                                        local e
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] * c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] * a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](g(c, e + 1, a[3]))
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] * c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] - c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] * c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        b = a[3]
                                    end
                                elseif e <= 5 then
                                    if e == 4 then
                                        local i
                                        local e
                                        e = a[2]
                                        i = c[a[3]]
                                        c[e + 1] = i
                                        c[e] = i[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](g(c, e + 1, a[3]))
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        i = c[a[3]]
                                        c[e + 1] = i
                                        c[e] = i[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](c[e + 1])
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + a[4]
                                        b = b + 1
                                        a = d[b]
                                        h[a[3]] = c[a[2]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = {}
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = {}
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                    else
                                        c[a[2]] = a[3]
                                    end
                                elseif e <= 6 then
                                    c[a[2]] = (not c[a[3]])
                                    b = b + 1
                                    a = d[b]
                                    h[a[3]] = c[a[2]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = h[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = h[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    if c[a[2]] then
                                        b = b + 1
                                    else
                                        b = a[3]
                                    end
                                elseif e == 7 then
                                    c[a[2]] = (a[3] ~= 0)
                                else
                                    local h
                                    local e
                                    c[a[2]] = (a[3] ~= 0)
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e]()
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](g(c, e + 1, a[3]))
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                end
                            elseif e <= 12 then
                                if e <= 10 then
                                    if e == 9 then
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        if (c[a[2]] == a[4]) then
                                            b = b + 1
                                        else
                                            b = a[3]
                                        end
                                    else
                                        c[a[2]] = #c[a[3]]
                                    end
                                elseif e == 11 then
                                    if (c[a[2]] < c[a[4]]) then
                                        b = a[3]
                                    else
                                        b = b + 1
                                    end
                                else
                                    local h
                                    local e
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e](c[e + 1])
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](g(c, e + 1, a[3]))
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][c[a[4]]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e](g(c, e + 1, a[3]))
                                end
                            elseif e <= 14 then
                                if e == 13 then
                                    local h
                                    local e
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](g(c, e + 1, a[3]))
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](c[e + 1])
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                else
                                    local f
                                    local e
                                    c[a[2]]()
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = {}
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    f = c[e]
                                    for a = e + 1, a[3] do
                                        m(f, c[a])
                                    end
                                end
                            elseif e <= 15 then
                                local h
                                local e
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                h = c[a[3]]
                                c[e + 1] = h
                                c[e] = h[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = (a[3] ~= 0)
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                f[a[3]] = c[a[2]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]][a[3]] = a[4]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                f[a[3]] = c[a[2]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]][a[3]] = a[4]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                f[a[3]] = c[a[2]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]][a[3]] = a[4]
                                b = b + 1
                                a = d[b]
                                do
                                    return
                                end
                            elseif e > 16 then
                                f[a[3]] = c[a[2]]
                            else
                                if (c[a[2]] ~= c[a[4]]) then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            end
                        elseif e <= 26 then
                            if e <= 21 then
                                if e <= 19 then
                                    if e > 18 then
                                        local a = a[2]
                                        c[a] = c[a](g(c, a + 1, i))
                                    else
                                        local e
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] * c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] * a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](g(c, e + 1, a[3]))
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] * c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] - c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] * c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = {}
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        h[a[3]] = c[a[2]]
                                        b = b + 1
                                        a = d[b]
                                        b = a[3]
                                    end
                                elseif e > 20 then
                                    local d = a[3]
                                    local b = c[d]
                                    for a = d + 1, a[4] do
                                        b = b .. c[a]
                                    end
                                    c[a[2]] = b
                                else
                                    local f
                                    local e
                                    c[a[2]]()
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = {}
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    f = c[e]
                                    for a = e + 1, a[3] do
                                        m(f, c[a])
                                    end
                                end
                            elseif e <= 23 then
                                if e == 22 then
                                    local f
                                    local e
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = {}
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    f = c[e]
                                    for a = e + 1, a[3] do
                                        m(f, c[a])
                                    end
                                else
                                    c[a[2]] = c[a[3]] + a[4]
                                end
                            elseif e <= 24 then
                                local b = a[2]
                                c[b](g(c, b + 1, a[3]))
                            elseif e == 25 then
                                local a = a[2]
                                c[a] = c[a](g(c, a + 1, i))
                            else
                                local k
                                local m, l
                                local h
                                local e
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                h = c[a[3]]
                                c[e + 1] = h
                                c[e] = h[a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](c[e + 1])
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                h = c[a[3]]
                                c[e + 1] = h
                                c[e] = h[a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](c[e + 1])
                                b = b + 1
                                a = d[b]
                                c[a[2]] = #c[a[3]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][c[a[4]]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                m, l = j(c[e](g(c, e + 1, a[3])))
                                i = l + e - 1
                                k = 0
                                for a = e, i do
                                    k = k + 1
                                    c[a] = m[k]
                                end
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, i))
                                b = b + 1
                                a = d[b]
                                c[a[2]][a[3]] = c[a[4]]
                                b = b + 1
                                a = d[b]
                                do
                                    return
                                end
                            end
                        elseif e <= 31 then
                            if e <= 28 then
                                if e == 27 then
                                    local h
                                    local e
                                    e = a[2]
                                    c[e](g(c, e + 1, a[3]))
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    f[a[3]] = c[a[2]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](c[e + 1])
                                    b = b + 1
                                    a = d[b]
                                    f[a[3]] = c[a[2]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    h = c[a[3]]
                                    c[e + 1] = h
                                    c[e] = h[a[4]]
                                else
                                    c[a[2]][a[3]] = c[a[4]]
                                end
                            elseif e <= 29 then
                                local f
                                local e
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][c[a[4]]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e](g(c, e + 1, a[3]))
                            elseif e == 30 then
                                do
                                    return
                                end
                            else
                                local f = a[2]
                                local e = {}
                                for a = 1, #l do
                                    local a = l[a]
                                    for b = 0, #a do
                                        local b = a[b]
                                        local d = b[1]
                                        local a = b[2]
                                        if d == c and a >= f then
                                            e[a] = d[a]
                                            b[1] = e
                                        end
                                    end
                                end
                            end
                        elseif e <= 33 then
                            if e == 32 then
                                local d = a[2]
                                local e = c[d]
                                local f = c[d + 2]
                                if (f > 0) then
                                    if (e > c[d + 1]) then
                                        b = a[3]
                                    else
                                        c[d + 3] = e
                                    end
                                elseif (e < c[d + 1]) then
                                    b = a[3]
                                else
                                    c[d + 3] = e
                                end
                            else
                                local f
                                local e
                                c[a[2]]()
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = {}
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                f = c[e]
                                for a = e + 1, a[3] do
                                    m(f, c[a])
                                end
                            end
                        elseif e <= 34 then
                            local i = o[a[3]]
                            local g
                            local e = {}
                            g =
                                q(
                                {},
                                {__index = function(b, a)
                                        local a = e[a]
                                        return a[1][a[2]]
                                    end, __newindex = function(c, a, b)
                                        local a = e[a]
                                        a[1][a[2]] = b
                                    end}
                            )
                            for f = 1, a[4] do
                                b = b + 1
                                local a = d[b]
                                if a[1] == 130 then
                                    e[f - 1] = {c, a[3]}
                                else
                                    e[f - 1] = {h, a[3]}
                                end
                                l[#l + 1] = e
                            end
                            c[a[2]] = n(i, g, f)
                        elseif e == 35 then
                            if (c[a[2]] == c[a[4]]) then
                                b = b + 1
                            else
                                b = a[3]
                            end
                        else
                            local d = a[2]
                            local e = c[d]
                            local f = c[d + 2]
                            if (f > 0) then
                                if (e > c[d + 1]) then
                                    b = a[3]
                                else
                                    c[d + 3] = e
                                end
                            elseif (e < c[d + 1]) then
                                b = a[3]
                            else
                                c[d + 3] = e
                            end
                        end
                    elseif e <= 55 then
                        if e <= 45 then
                            if e <= 40 then
                                if e <= 38 then
                                    if e > 37 then
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]] + c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        if (c[a[2]] == a[4]) then
                                            b = b + 1
                                        else
                                            b = a[3]
                                        end
                                    else
                                        h[a[3]] = c[a[2]]
                                    end
                                elseif e > 39 then
                                    local d = a[2]
                                    local f = a[4]
                                    local e = d + 2
                                    local d = {c[d](c[d + 1], c[e])}
                                    for a = 1, f do
                                        c[e + a] = d[a]
                                    end
                                    local d = d[1]
                                    if d then
                                        c[e] = d
                                        b = a[3]
                                    else
                                        b = b + 1
                                    end
                                else
                                    local e
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](c[e + 1])
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](c[e + 1])
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](c[e + 1])
                                    b = b + 1
                                    a = d[b]
                                    if (c[a[2]] < c[a[4]]) then
                                        b = a[3]
                                    else
                                        b = b + 1
                                    end
                                end
                            elseif e <= 42 then
                                if e > 41 then
                                    local f
                                    local e
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    h[a[3]] = c[a[2]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = {}
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    h[a[3]] = c[a[2]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    h[a[3]] = c[a[2]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = h[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    f = c[a[3]]
                                    c[e + 1] = f
                                    c[e] = f[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e](c[e + 1])
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = h[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    f = c[a[3]]
                                    c[e + 1] = f
                                    c[e] = f[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e](c[e + 1])
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = h[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = a[4]
                                    b = b + 1
                                    a = d[b]
                                    do
                                        return
                                    end
                                else
                                    if c[a[2]] then
                                        b = b + 1
                                    else
                                        b = a[3]
                                    end
                                end
                            elseif e <= 43 then
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = h[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]] + c[a[4]]
                                b = b + 1
                                a = d[b]
                                if (c[a[2]] == a[4]) then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            elseif e > 44 then
                                local h
                                local e
                                c[a[2]] = (a[3] ~= 0)
                                b = b + 1
                                a = d[b]
                                f[a[3]] = c[a[2]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                h = c[a[3]]
                                c[e + 1] = h
                                c[e] = h[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                h = c[a[3]]
                                c[e + 1] = h
                                c[e] = h[a[4]]
                            else
                                local d = a[3]
                                local b = c[d]
                                for a = d + 1, a[4] do
                                    b = b .. c[a]
                                end
                                c[a[2]] = b
                            end
                        elseif e <= 50 then
                            if e <= 47 then
                                if e == 46 then
                                    local f = a[2]
                                    local e = {}
                                    for a = 1, #l do
                                        local a = l[a]
                                        for b = 0, #a do
                                            local b = a[b]
                                            local d = b[1]
                                            local a = b[2]
                                            if d == c and a >= f then
                                                e[a] = d[a]
                                                b[1] = e
                                            end
                                        end
                                    end
                                else
                                    local e
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e] = c[e](g(c, e + 1, a[3]))
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = c[a[4]]
                                end
                            elseif e <= 48 then
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = h[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]] + c[a[4]]
                                b = b + 1
                                a = d[b]
                                if (c[a[2]] ~= a[4]) then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            elseif e > 49 then
                                if not c[a[2]] then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            else
                                local b = a[2]
                                c[b] = c[b](g(c, b + 1, a[3]))
                            end
                        elseif e <= 52 then
                            if e > 51 then
                                c[a[2]] = {}
                            else
                                c[a[2]][a[3]] = a[4]
                            end
                        elseif e <= 53 then
                            if (c[a[2]] < c[a[4]]) then
                                b = a[3]
                            else
                                b = b + 1
                            end
                        elseif e == 54 then
                            local e
                            e = a[2]
                            c[e](g(c, e + 1, a[3]))
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]]()
                            b = b + 1
                            a = d[b]
                            c[a[2]] = h[a[3]]
                            b = b + 1
                            a = d[b]
                            if (c[a[2]] == a[4]) then
                                b = b + 1
                            else
                                b = a[3]
                            end
                        else
                            c[a[2]] = c[a[3]] * a[4]
                        end
                    elseif e <= 64 then
                        if e <= 59 then
                            if e <= 57 then
                                if e == 56 then
                                    local f
                                    local e
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    f = c[a[3]]
                                    c[e + 1] = f
                                    c[e] = f[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    c[e](g(c, e + 1, a[3]))
                                else
                                    b = a[3]
                                end
                            elseif e == 58 then
                                local b = a[2]
                                c[b] = c[b](g(c, b + 1, a[3]))
                            else
                                local l
                                local m, n
                                local k
                                local e
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                k = c[a[3]]
                                c[e + 1] = k
                                c[e] = k[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                k = c[a[3]]
                                c[e + 1] = k
                                c[e] = k[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                m, n = j(c[e](c[e + 1]))
                                i = n + e - 1
                                l = 0
                                for a = e, i do
                                    l = l + 1
                                    c[a] = m[l]
                                end
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, i))
                                b = b + 1
                                a = d[b]
                                h[a[3]] = c[a[2]]
                                b = b + 1
                                a = d[b]
                                do
                                    return
                                end
                            end
                        elseif e <= 61 then
                            if e > 60 then
                                local f
                                local e
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][c[a[4]]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e](g(c, e + 1, a[3]))
                            else
                                local d = a[2]
                                local e = {c[d](c[d + 1])}
                                local b = 0
                                for a = d, a[4] do
                                    b = b + 1
                                    c[a] = e[b]
                                end
                            end
                        elseif e <= 62 then
                            c[a[2]] = c[a[3]][c[a[4]]]
                        elseif e > 63 then
                            local k
                            local m, l
                            local h
                            local e
                            c[a[2]]()
                            b = b + 1
                            a = d[b]
                            c[a[2]] = {}
                            b = b + 1
                            a = d[b]
                            c[a[2]][a[3]] = a[4]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            h = c[a[3]]
                            c[e + 1] = h
                            c[e] = h[a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e] = c[e](g(c, e + 1, a[3]))
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            h = c[a[3]]
                            c[e + 1] = h
                            c[e] = h[a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            m, l = j(c[e](c[e + 1]))
                            i = l + e - 1
                            k = 0
                            for a = e, i do
                                k = k + 1
                                c[a] = m[k]
                            end
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e](g(c, e + 1, i))
                            b = b + 1
                            a = d[b]
                            b = a[3]
                        else
                            c[a[2]] = c[a[3]] * a[4]
                        end
                    elseif e <= 69 then
                        if e <= 66 then
                            if e > 65 then
                                c[a[2]] = c[a[3]] * c[a[4]]
                            else
                                c[a[2]] = a[3]
                            end
                        elseif e <= 67 then
                            local b = a[2]
                            local e = {c[b](c[b + 1])}
                            local d = 0
                            for a = b, a[4] do
                                d = d + 1
                                c[a] = e[d]
                            end
                        elseif e > 68 then
                            local b = a[2]
                            local d = c[a[3]]
                            c[b + 1] = d
                            c[b] = d[a[4]]
                        else
                            local l
                            local n, o
                            local m
                            local k
                            local e
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            k = c[a[3]]
                            c[e + 1] = k
                            c[e] = k[a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            k = c[a[3]]
                            c[e + 1] = k
                            c[e] = k[a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = h[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = h[a[3]]
                            b = b + 1
                            a = d[b]
                            k = a[3]
                            m = c[k]
                            for a = k + 1, a[4] do
                                m = m .. c[a]
                            end
                            c[a[2]] = m
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            n, o = j(c[e](g(c, e + 1, a[3])))
                            i = o + e - 1
                            l = 0
                            for a = e, i do
                                l = l + 1
                                c[a] = n[l]
                            end
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e] = c[e](g(c, e + 1, i))
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]]
                        end
                    elseif e <= 71 then
                        if e == 70 then
                            local h
                            local e
                            c[a[2]] = (not c[a[3]])
                            b = b + 1
                            a = d[b]
                            f[a[3]] = c[a[2]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            h = c[a[3]]
                            c[e + 1] = h
                            c[e] = h[a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e](g(c, e + 1, a[3]))
                        else
                            if c[a[2]] then
                                b = b + 1
                            else
                                b = a[3]
                            end
                        end
                    elseif e <= 72 then
                        local b = a[2]
                        local d, a = j(c[b](g(c, b + 1, a[3])))
                        i = a + b - 1
                        local a = 0
                        for b = b, i do
                            a = a + 1
                            c[b] = d[a]
                        end
                    elseif e > 73 then
                        local b = a[2]
                        local d = c[b]
                        for a = b + 1, a[3] do
                            m(d, c[a])
                        end
                    else
                        if not c[a[2]] then
                            b = b + 1
                        else
                            b = a[3]
                        end
                    end
                elseif e <= 111 then
                    if e <= 92 then
                        if e <= 83 then
                            if e <= 78 then
                                if e <= 76 then
                                    if e > 75 then
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        do
                                            return
                                        end
                                    else
                                        local e
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](g(c, e + 1, a[3]))
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](g(c, e + 1, a[3]))
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = a[4]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](g(c, e + 1, a[3]))
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = h[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](g(c, e + 1, a[3]))
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = c[a[3]][a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = a[3]
                                        b = b + 1
                                        a = d[b]
                                        e = a[2]
                                        c[e] = c[e](g(c, e + 1, a[3]))
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]][a[3]] = c[a[4]]
                                        b = b + 1
                                        a = d[b]
                                        c[a[2]] = f[a[3]]
                                    end
                                elseif e > 77 then
                                    local f
                                    local e
                                    e = a[2]
                                    c[e](g(c, e + 1, a[3]))
                                    b = b + 1
                                    a = d[b]
                                    e = a[2]
                                    f = c[a[3]]
                                    c[e + 1] = f
                                    c[e] = f[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = a[3]
                                else
                                    if (c[a[2]] ~= c[a[4]]) then
                                        b = b + 1
                                    else
                                        b = a[3]
                                    end
                                end
                            elseif e <= 80 then
                                if e > 79 then
                                    do
                                        return
                                    end
                                else
                                    local a = a[2]
                                    c[a](c[a + 1])
                                end
                            elseif e <= 81 then
                                if (c[a[2]] ~= a[4]) then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            elseif e == 82 then
                                local a = a[2]
                                c[a](g(c, a + 1, i))
                            else
                                local a = a[2]
                                local d, b = j(c[a](c[a + 1]))
                                i = b + a - 1
                                local b = 0
                                for a = a, i do
                                    b = b + 1
                                    c[a] = d[b]
                                end
                            end
                        elseif e <= 87 then
                            if e <= 85 then
                                if e == 84 then
                                    c[a[2]] = n(o[a[3]], nil, f)
                                else
                                    local a = a[2]
                                    c[a] = c[a]()
                                end
                            elseif e == 86 then
                                local l
                                local n, m
                                local k
                                local e
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                k = c[a[3]]
                                c[e + 1] = k
                                c[e] = k[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                k = c[a[3]]
                                c[e + 1] = k
                                c[e] = k[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = h[a[3]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                n, m = j(c[e](g(c, e + 1, a[3])))
                                i = m + e - 1
                                l = 0
                                for a = e, i do
                                    l = l + 1
                                    c[a] = n[l]
                                end
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e](g(c, e + 1, i))
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]]()
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                k = c[a[3]]
                                c[e + 1] = k
                                c[e] = k[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                k = c[a[3]]
                                c[e + 1] = k
                                c[e] = k[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = h[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = h[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                do
                                    return
                                end
                            else
                                c[a[2]]()
                            end
                        elseif e <= 89 then
                            if e == 88 then
                                if (c[a[2]] == a[4]) then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            else
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]][a[3]] = c[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                if c[a[2]] then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            end
                        elseif e <= 90 then
                            b = a[3]
                        elseif e == 91 then
                            c[a[2]][a[3]] = c[a[4]]
                        else
                            local k
                            local l, m
                            local h
                            local e
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e](g(c, e + 1, a[3]))
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            h = c[a[3]]
                            c[e + 1] = h
                            c[e] = h[a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e] = c[e](g(c, e + 1, a[3]))
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            h = c[a[3]]
                            c[e + 1] = h
                            c[e] = h[a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            l, m = j(c[e](g(c, e + 1, a[3])))
                            i = m + e - 1
                            k = 0
                            for a = e, i do
                                k = k + 1
                                c[a] = l[k]
                            end
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e](g(c, e + 1, i))
                        end
                    elseif e <= 101 then
                        if e <= 96 then
                            if e <= 94 then
                                if e == 93 then
                                    c[a[2]] = f[a[3]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]] = c[a[3]][a[4]]
                                    b = b + 1
                                    a = d[b]
                                    c[a[2]][a[3]] = c[a[4]]
                                    b = b + 1
                                    a = d[b]
                                    do
                                        return
                                    end
                                else
                                    local a = a[2]
                                    c[a](g(c, a + 1, i))
                                end
                            elseif e > 95 then
                                c[a[2]] = (a[3] ~= 0)
                            else
                                c[a[2]] = n(o[a[3]], nil, f)
                            end
                        elseif e <= 98 then
                            if e > 97 then
                                local k
                                local m, l
                                local h
                                local e
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = f[a[3]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                h = c[a[3]]
                                c[e + 1] = h
                                c[e] = h[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                m, l = j(c[e](g(c, e + 1, a[3])))
                                i = l + e - 1
                                k = 0
                                for a = e, i do
                                    k = k + 1
                                    c[a] = m[k]
                                end
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, i))
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e]()
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                h = c[a[3]]
                                c[e + 1] = h
                                c[e] = h[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                            else
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = h[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]] + c[a[4]]
                                b = b + 1
                                a = d[b]
                                if (c[a[2]] ~= a[4]) then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            end
                        elseif e <= 99 then
                            c[a[2]] = c[a[3]] + c[a[4]]
                        elseif e == 100 then
                            c[a[2]] = (not c[a[3]])
                        else
                            c[a[2]] = c[a[3]] - c[a[4]]
                        end
                    elseif e <= 106 then
                        if e <= 103 then
                            if e > 102 then
                                c[a[2]]()
                            else
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = h[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]] + c[a[4]]
                                b = b + 1
                                a = d[b]
                                if (c[a[2]] == a[4]) then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            end
                        elseif e <= 104 then
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = h[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]] + c[a[4]]
                            b = b + 1
                            a = d[b]
                            if (c[a[2]] == a[4]) then
                                b = b + 1
                            else
                                b = a[3]
                            end
                        elseif e > 105 then
                            local b = a[2]
                            local d = c[a[3]]
                            c[b + 1] = d
                            c[b] = d[a[4]]
                        else
                            local f
                            local e
                            e = a[2]
                            c[e](g(c, e + 1, a[3]))
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            f = c[a[3]]
                            c[e + 1] = f
                            c[e] = f[a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                        end
                    elseif e <= 108 then
                        if e > 107 then
                            local f
                            local e
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = {}
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            f = c[e]
                            for a = e + 1, a[3] do
                                m(f, c[a])
                            end
                        else
                            if (c[a[2]] == a[4]) then
                                b = b + 1
                            else
                                b = a[3]
                            end
                        end
                    elseif e <= 109 then
                        c[a[2]] = h[a[3]]
                    elseif e > 110 then
                        local d = a[2]
                        local f = c[d + 2]
                        local e = c[d] + f
                        c[d] = e
                        if (f > 0) then
                            if (e <= c[d + 1]) then
                                b = a[3]
                                c[d + 3] = e
                            end
                        elseif (e >= c[d + 1]) then
                            b = a[3]
                            c[d + 3] = e
                        end
                    else
                        local d = a[2]
                        local f = c[d + 2]
                        local e = c[d] + f
                        c[d] = e
                        if (f > 0) then
                            if (e <= c[d + 1]) then
                                b = a[3]
                                c[d + 3] = e
                            end
                        elseif (e >= c[d + 1]) then
                            b = a[3]
                            c[d + 3] = e
                        end
                    end
                elseif e <= 130 then
                    if e <= 120 then
                        if e <= 115 then
                            if e <= 113 then
                                if e > 112 then
                                    local a = a[2]
                                    c[a] = c[a]()
                                else
                                    c[a[2]] = f[a[3]]
                                end
                            elseif e > 114 then
                                local a = a[2]
                                c[a] = c[a](c[a + 1])
                            else
                                local f
                                local e
                                e = a[2]
                                c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e](g(c, e + 1, a[3]))
                            end
                        elseif e <= 117 then
                            if e > 116 then
                                c[a[2]] = c[a[3]]
                            else
                                if (c[a[2]] ~= a[4]) then
                                    b = b + 1
                                else
                                    b = a[3]
                                end
                            end
                        elseif e <= 118 then
                            local b = a[2]
                            c[b](g(c, b + 1, a[3]))
                        elseif e > 119 then
                            local e
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = {}
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e] = c[e](c[e + 1])
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = (a[3] ~= 0)
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                        else
                            local i = o[a[3]]
                            local g
                            local e = {}
                            g =
                                q(
                                {},
                                {__index = function(b, a)
                                        local a = e[a]
                                        return a[1][a[2]]
                                    end, __newindex = function(c, a, b)
                                        local a = e[a]
                                        a[1][a[2]] = b
                                    end}
                            )
                            for f = 1, a[4] do
                                b = b + 1
                                local a = d[b]
                                if a[1] == 130 then
                                    e[f - 1] = {c, a[3]}
                                else
                                    e[f - 1] = {h, a[3]}
                                end
                                l[#l + 1] = e
                            end
                            c[a[2]] = n(i, g, f)
                        end
                    elseif e <= 125 then
                        if e <= 122 then
                            if e > 121 then
                                local f
                                local e
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = a[3]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e] = c[e](g(c, e + 1, a[3]))
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][a[4]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                f = c[a[3]]
                                c[e + 1] = f
                                c[e] = f[a[4]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]]
                                b = b + 1
                                a = d[b]
                                c[a[2]] = c[a[3]][c[a[4]]]
                                b = b + 1
                                a = d[b]
                                e = a[2]
                                c[e](g(c, e + 1, a[3]))
                            else
                                c[a[2]] = c[a[3]] * c[a[4]]
                            end
                        elseif e <= 123 then
                            local e
                            c[a[2]] = h[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e] = c[e](c[e + 1])
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e] = c[e](c[e + 1])
                            b = b + 1
                            a = d[b]
                            if (c[a[2]] == c[a[4]]) then
                                b = b + 1
                            else
                                b = a[3]
                            end
                        elseif e > 124 then
                            c[a[2]] = {}
                        else
                            c[a[2]] = c[a[3]] + a[4]
                        end
                    elseif e <= 127 then
                        if e > 126 then
                            if (c[a[2]] == c[a[4]]) then
                                b = b + 1
                            else
                                b = a[3]
                            end
                        else
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            if (c[a[2]] ~= c[a[4]]) then
                                b = b + 1
                            else
                                b = a[3]
                            end
                        end
                    elseif e <= 128 then
                        c[a[2]] = h[a[3]]
                    elseif e == 129 then
                        local e
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = h[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        c[e](g(c, e + 1, a[3]))
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]]()
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                    else
                        c[a[2]] = c[a[3]]
                    end
                elseif e <= 139 then
                    if e <= 134 then
                        if e <= 132 then
                            if e == 131 then
                                local d = a[2]
                                local f = a[4]
                                local e = d + 2
                                local d = {c[d](c[d + 1], c[e])}
                                for a = 1, f do
                                    c[e + a] = d[a]
                                end
                                local d = d[1]
                                if d then
                                    c[e] = d
                                    b = a[3]
                                else
                                    b = b + 1
                                end
                            else
                                c[a[2]] = c[a[3]][a[4]]
                            end
                        elseif e > 133 then
                            c[a[2]] = c[a[3]] - c[a[4]]
                        else
                            c[a[2]] = #c[a[3]]
                        end
                    elseif e <= 136 then
                        if e == 135 then
                            local e
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = a[3]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e](c[e + 1])
                            b = b + 1
                            a = d[b]
                            c[a[2]] = {}
                            b = b + 1
                            a = d[b]
                            h[a[3]] = c[a[2]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = f[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = c[a[3]][a[4]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = h[a[3]]
                            b = b + 1
                            a = d[b]
                            c[a[2]] = h[a[3]]
                            b = b + 1
                            a = d[b]
                            e = a[2]
                            c[e](g(c, e + 1, a[3]))
                            b = b + 1
                            a = d[b]
                            do
                                return
                            end
                        else
                            c[a[2]] = c[a[3]][a[4]]
                        end
                    elseif e <= 137 then
                        local b = a[2]
                        local d, a = j(c[b](g(c, b + 1, a[3])))
                        i = a + b - 1
                        local a = 0
                        for b = b, i do
                            a = a + 1
                            c[b] = d[a]
                        end
                    elseif e == 138 then
                        local a = a[2]
                        c[a] = c[a](c[a + 1])
                    else
                        local e
                        c[a[2]]()
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        c[e] = c[e](g(c, e + 1, a[3]))
                        b = b + 1
                        a = d[b]
                        c[a[2]][a[3]] = c[a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        c[e](c[e + 1])
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        c[e] = c[e](g(c, e + 1, a[3]))
                        b = b + 1
                        a = d[b]
                        c[a[2]][a[3]] = c[a[4]]
                        b = b + 1
                        a = d[b]
                        b = a[3]
                    end
                elseif e <= 144 then
                    if e <= 141 then
                        if e == 140 then
                            c[a[2]][a[3]] = a[4]
                        else
                            c[a[2]] = f[a[3]]
                        end
                    elseif e <= 142 then
                        local b = a[2]
                        local d = c[b]
                        for a = b + 1, a[3] do
                            m(d, c[a])
                        end
                    elseif e > 143 then
                        local a = a[2]
                        c[a](c[a + 1])
                    else
                        f[a[3]] = c[a[2]]
                    end
                elseif e <= 146 then
                    if e > 145 then
                        local h
                        local e
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        c[e](c[e + 1])
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        h = c[a[3]]
                        c[e + 1] = h
                        c[e] = h[a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        c[e] = c[e](g(c, e + 1, a[3]))
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        h = c[a[3]]
                        c[e + 1] = h
                        c[e] = h[a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]][c[a[4]]]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        c[e](g(c, e + 1, a[3]))
                    else
                        local m
                        local n, o
                        local l
                        local k
                        local e
                        c[a[2]] = c[a[3]][a[4]]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        k = c[a[3]]
                        c[e + 1] = k
                        c[e] = k[a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = f[a[3]]
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        k = c[a[3]]
                        c[e + 1] = k
                        c[e] = k[a[4]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = h[a[3]]
                        b = b + 1
                        a = d[b]
                        c[a[2]] = a[3]
                        b = b + 1
                        a = d[b]
                        k = a[3]
                        l = c[k]
                        for a = k + 1, a[4] do
                            l = l .. c[a]
                        end
                        c[a[2]] = l
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        n, o = j(c[e](g(c, e + 1, a[3])))
                        i = o + e - 1
                        m = 0
                        for a = e, i do
                            m = m + 1
                            c[a] = n[m]
                        end
                        b = b + 1
                        a = d[b]
                        e = a[2]
                        c[e] = c[e](g(c, e + 1, i))
                        b = b + 1
                        a = d[b]
                        c[a[2]] = c[a[3]]
                        b = b + 1
                        a = d[b]
                        b = a[3]
                    end
                elseif e <= 147 then
                    c[a[2]] = (not c[a[3]])
                elseif e > 148 then
                    c[a[2]] = c[a[3]] + c[a[4]]
                else
                    h[a[3]] = c[a[2]]
                end
                b = b + 1
            end
        end)
    end
    return n(true, {}, r())()
end)(string.byte, table.insert, setmetatable)
