%--------------------------------------------------------------------------
% CART-Cell Logical Model
% Created by: Viren Shah, Justin Womack
% Last Updated: 12/22/2022
% 
% Model Description:
% Logic network simulation of CAR-T cell signaling in response to tumor
% cells
%------------------------------------------------------------------------%%

close all;
clear all; %#ok<*CLALL> 
clc;
rng("shuffle");

%% Simulation Setup

simnum = 10000;              % number of simulations
timesteps= 1000;             % number of timesteps
pa = 0.5;                    % activation probability
pd = 0.05;                   % degradation probability   
upr = 1;                     % base update rate

%CAR ligation

    %ta_ex (tumor antigen expression)
    node_num_inc = 1;       % incrementer
    ta_ex_node = 1;         % node id
    
    %ta (tumor antigen)
    node_num_inc = node_num_inc + 1;
    ta_node = node_num_inc; % node id
    
    %is (immune synapse)
    node_num_inc = node_num_inc + 1;
    is_node = node_num_inc; % node id

    %scFv (single chain variable fragment)
    node_num_inc = node_num_inc + 1;
    scFv_node = node_num_inc;   % node id

    % CD28 domain (CAR)
    node_num_inc = node_num_inc + 1;
    cd28_node = node_num_inc;   % node id

    % CD3 zeta (CAR)
    node_num_inc = node_num_inc + 1;
    cd3_zeta_node = node_num_inc;   % node id

    % lck
    node_num_inc = node_num_inc + 1;
    lck_node = node_num_inc;   % node id

    % ZAP70
    node_num_inc = node_num_inc + 1;
    zap70_node = node_num_inc;   % node id
    
%IL-2 ligation

    % IL-2 exogenous (interleukin 2)
    node_num_inc = node_num_inc + 1;
    il2_ex_node = node_num_inc;   % node id

    % IL-2 (interleukin 2)
    node_num_inc = node_num_inc + 1;
    il2_node = node_num_inc;   % node id

    % IL-2 receptor alpha
    node_num_inc = node_num_inc + 1;
    il2r_node = node_num_inc;   % node id

    %jak13
    node_num_inc = node_num_inc + 1;
    jak13_node = node_num_inc;   % node id

 %Inhibitory Pathways
 
    % PD-L1_ex (programmed cell death receptor ligand 1 expression)
    node_num_inc = node_num_inc + 1;
    pdl1_ex_node = node_num_inc;   % node id
    
    % PD-L1 (programmed cell death receptor ligand 1)
    node_num_inc = node_num_inc + 1;
    pdl1_node = node_num_inc;   % node id

    % PD-1 (programmed cell death receptor 1)
    node_num_inc = node_num_inc + 1;
    pd1_node = node_num_inc;   % node id

    % PD-1 expression (programmed cell death receptor 1 expression)
    node_num_inc = node_num_inc + 1;
    pd1_ex_node = node_num_inc;   % node id
    
    %cd8086_ex
    node_num_inc = node_num_inc + 1;
    cd8086_ex_node = node_num_inc;   % node id
    
    %cd8086
    node_num_inc = node_num_inc + 1;
    cd8086_node = node_num_inc;   % node id

    %ctla4
    node_num_inc = node_num_inc + 1;
    ctla4_ex_node = node_num_inc;   % node id
    
    %ctla4
    node_num_inc = node_num_inc + 1;
    ctla4_node = node_num_inc;   % node id

    % SHP-2 (SH2-domain containing tyrosine phosphatase 2)
    node_num_inc = node_num_inc + 1;
    shp2_node = node_num_inc;   % node id

    % SHP-1 (SH2-domain containing tyrosine phosphatase 1)
    node_num_inc = node_num_inc + 1;
    shp1_node = node_num_inc;   % node id
    
%Signaling Intermediates

    %lat
    node_num_inc = node_num_inc + 1;
    lat_node = node_num_inc;   % node id
    
    %slp76
    node_num_inc = node_num_inc + 1;
    slp76_node = node_num_inc;   % node id
    
    %plc_gamma1
    node_num_inc = node_num_inc + 1;
    plc_gamma1_node = node_num_inc;   % node id
    
    %dag
    node_num_inc = node_num_inc + 1;
    dag_node = node_num_inc;   % node id
    
    %ip3
    node_num_inc = node_num_inc + 1;
    ip3_node = node_num_inc;   % node id
    
    %wasp_cdc42
    node_num_inc = node_num_inc + 1;
    wasp_cdc42_node = node_num_inc;   % node id
    
    %p38
    node_num_inc = node_num_inc + 1;
    p38_node = node_num_inc;   % node id
    
    %pkc_theta
    node_num_inc = node_num_inc + 1;
    pkc_theta_node = node_num_inc;   % node id
    
%PI3K-AKT

    %pi3k
    node_num_inc = node_num_inc + 1;
    pi3k_node = node_num_inc;   % node id
    
    %pdpk1
    node_num_inc = node_num_inc + 1;
    pdpk1_node = node_num_inc;   % node id
    
    %akt
    node_num_inc = node_num_inc + 1;
    akt_node = node_num_inc;   % node id
    
    %mtorc1
    node_num_inc = node_num_inc + 1;
    mtorc1_node = node_num_inc;   % node id
    
%MAPK
    
    %rasgrp
    node_num_inc = node_num_inc + 1;
    rasgrp_node = node_num_inc;   % node id
    
    %grb2_sos
    node_num_inc = node_num_inc + 1;
    grb2_sos_node = node_num_inc;   % node id
    
    %erk
    node_num_inc = node_num_inc + 1;
    erk_node = node_num_inc;   % node id
    
%Calcium
    
    %calcium
    node_num_inc = node_num_inc + 1;
    calcium_node = node_num_inc;   % node id

    %calmodulin
    node_num_inc = node_num_inc + 1;
    calmodulin_node = node_num_inc;   % node id
    
    %calcineurin
    node_num_inc = node_num_inc + 1;
    calcineurin_node = node_num_inc;   % node id
    

%Transcription factors

    %cfos
    node_num_inc = node_num_inc + 1;
    cfos_node = node_num_inc;   % node id
    
    %cjun
    node_num_inc = node_num_inc + 1;
    cjun_node = node_num_inc;   % node id 
    
    %ap1
    node_num_inc = node_num_inc + 1;
    ap1_node = node_num_inc;   % node id
    
    %nfkb
    node_num_inc = node_num_inc + 1;
    nfkb_node = node_num_inc;   % node id
    
    %nfat
    node_num_inc = node_num_inc + 1;
    nfat_node = node_num_inc;   % node id
    
    %nfat_dimer
    node_num_inc = node_num_inc + 1;
    nfat_dimer_node = node_num_inc;   % node id

    %creb
    node_num_inc = node_num_inc + 1;
    creb_node = node_num_inc;   % node id    
    
    %batf
    node_num_inc = node_num_inc + 1;
    batf_node = node_num_inc;   % node id

    %stat5
    node_num_inc = node_num_inc + 1;
    stat5_node = node_num_inc;   % node id
    
%Gene expression

    %il2_ge
    node_num_inc = node_num_inc + 1;
    il2_ge_node = node_num_inc;   % node id
    
    %pdcd1_ge
    node_num_inc = node_num_inc + 1;
    pdcd1_ge_node = node_num_inc;   % node id
    
%Cytotoxic

    %fasl
    node_num_inc = node_num_inc + 1;
    fasl_node = node_num_inc;   % node id
    
    %per_gzmb
    node_num_inc = node_num_inc + 1;
    per_gzmb_node = node_num_inc;   % node id
    
    %fas
    node_num_inc = node_num_inc + 1;
    fas_node = node_num_inc;   % node id
    
    %casp3_7
    node_num_inc = node_num_inc + 1;
    casp3_7_node = node_num_inc;   % node id
    
% Cellular Response

    %cart_ct
    node_num_inc = node_num_inc + 1;
    cart_ct_node = node_num_inc;   % node id
    
    %cart_func
    node_num_inc = node_num_inc + 1;
    cart_func_node = node_num_inc;   % node id
    
    %cart_dys
    node_num_inc = node_num_inc + 1;
    cart_dys_node = node_num_inc;   % node id
    
    %tumor_apoptosis
    node_num_inc = node_num_inc + 1;
    tumor_apop_node = node_num_inc;   % node id
    

%% Parameter Values

varnum = node_num_inc;  % number of variables

% standard parameters
for i = 1:varnum
param(i,1) = i;
param(i,2) = 0;
param(i,3) = 1;
param(i,4) = 1;
param(i,5) = pa;
param(i,6) = pd;
end

% I.C.

%lck
param(lck_node,2) = 1;

%% Recptor ON

% %tumor antigen
% param(ta_ex_node,2) = 1;
% param(ta_ex_node,5) = 1;
% param(ta_ex_node,6) = 0;
 
% %il2
% param(il2_ex_node,2) = 1;
% param(il2_ex_node,5) = 1;
% param(il2_ex_node,6) = 0;
 
% %pdl1
% param(pdl1_ex_node,2) = 1;
% param(pdl1_ex_node,5) = 1;
% param(pdl1_ex_node,6) = 0;
 
% %cd8086
% param(cd8086_ex_node,2) = 1;
% param(cd8086_ex_node,5) = 1;
% param(cd8086_ex_node,6) = 0;

%% Recptor OFF

% %tumor antigen
% param(ta_ex_node,2) = 0;
% param(ta_ex_node,5) = 0;
% param(ta_ex_node,6) = 0;

% %il2
% param(il2_ex_node,2) = 0;
% param(il2_ex_node,5) = 0;
% param(il2_ex_node,6) = 0;

% %pdl1
% param(pdl1_ex_node,2) = 0;
% param(pdl1_ex_node,5) = 0;
% param(pdl1_ex_node,6) = 0;

% %cd8086
% param(cd8086_ex_node,2) = 0;
% param(cd8086_ex_node,5) = 0;
% param(cd8086_ex_node,6) = 0;

%% Asynchronous Boolean Simulation

% simulations

parfor i = 1:simnum

disp(i);

% initial conditions

% car

    % ta_ex
    ta_ex_cur = param(ta_ex_node,2);          % I.C.
    ta_ex_on_rt = param(ta_ex_node,3);        % update ON rate
    ta_ex_off_rt = param(ta_ex_node,4);       % update OFF rate
    ta_ex_on_p = param(ta_ex_node,5);         % update ON probability
    ta_ex_off_p = param(ta_ex_node,6);        % update ON probability
    if (rand < ta_ex_on_p) ta_ex_cur = 1; else ta_ex_cur = 0; end    % random I.C.
    count_ta_ex = 0;                        % step count

    % ta
    ta_cur = param(ta_node,2);          % I.C.
    ta_on_rt = param(ta_node,3);        % update ON rate
    ta_off_rt = param(ta_node,4);       % update OFF rate
    ta_on_p = param(ta_node,5);         % update ON probability
    ta_off_p = param(ta_node,6);        % update ON probability
    %if (rand < ta_on_p) ta_cur = 1; else ta_cur = 0; end    % random I.C.
    count_ta = 0;                       % step count
    
    % is
    is_cur = param(is_node,2);          % I.C.
    is_on_rt = param(is_node,3);        % update ON rate
    is_off_rt = param(is_node,4);       % update OFF rate
    is_on_p = param(is_node,5);         % update ON probability
    is_off_p = param(is_node,6);        % update ON probability
	%if (rand < is_on_p) is_cur = 1; else is_cur = 0; end    % random I.C.
    count_is = 0;                         % step count

    % scFv
    scFv_cur = param(scFv_node,2);          % I.C.
    scFv_on_rt = param(scFv_node,3);        % update ON rate
    scFv_off_rt = param(scFv_node,4);       % update OFF rate
    scFv_on_p = param(scFv_node,5);         % update ON probability
    scFv_off_p = param(scFv_node,6);        % update ON probability
    %if (rand < scFv_on_p) scFv_cur = 1; else scFv_cur = 0; end    % random I.C.
    count_scFv = 0;                         % step count

    % cd28
    cd28_cur = param(cd28_node,2);          % I.C.
    cd28_on_rt = param(cd28_node,3);        % update ON rate
    cd28_off_rt = param(cd28_node,4);       % update OFF rate
    cd28_on_p = param(cd28_node,5);         % update ON probability
    cd28_off_p = param(cd28_node,6);        % update ON probability
    %if (rand < cd28_on_p) cd28_cur = 1; else cd28_cur = 0; end    % random I.C.
    count_cd28 = 0;                         % step count

    % cd3_zeta
    cd3_zeta_cur = param(cd3_zeta_node,2);          % I.C.
    cd3_zeta_on_rt = param(cd3_zeta_node,3);        % update ON rate
    cd3_zeta_off_rt = param(cd3_zeta_node,4);       % update OFF rate
    cd3_zeta_on_p = param(cd3_zeta_node,5);         % update ON probability
    cd3_zeta_off_p = param(cd3_zeta_node,6);        % update ON probability
    %if (rand < cd3_zeta_on_p) cd3_zeta_cur = 1; else cd3_zeta_cur = 0; end    % random I.C.
    count_cd3_zeta = 0;                             % step count

    % lck
    lck_cur = param(lck_node,2);            % I.C.
    lck_on_rt = param(lck_node,3);          % update ON rate
    lck_off_rt = param(lck_node,4);         % update OFF rate
    lck_on_p = param(lck_node,5);           % update ON probability
    lck_off_p = param(lck_node,6);          % update ON probability
    %if (rand < lck_on_p) lck_cur = 1; else lck_cur = 0; end    % random I.C.
    count_lck = 0;                          % step count

    % zap70
    zap70_cur = param(zap70_node,2);        % I.C.
    zap70_on_rt = param(zap70_node,3);      % update ON rate
    zap70_off_rt = param(zap70_node,4);     % update OFF rate
    zap70_on_p = param(zap70_node,5);       % update ON probability
    zap70_off_p = param(zap70_node,6);      % update ON probability
    %if (rand < zap70_on_p) zap70_cur = 1; else zap70_cur = 0; end    % random I.C.
    count_zap70 = 0;                        % step count

% il2

    % il2_ex
	il2_ex_cur = param(il2_ex_node,2);        % I.C.
    il2_ex_on_rt = param(il2_ex_node,3);      % update ON rate
    il2_ex_off_rt = param(il2_ex_node,4);     % update OFF rate
    il2_ex_on_p = param(il2_ex_node,5);       % update ON probability
    il2_ex_off_p = param(il2_ex_node,6);      % update ON probability
    if (rand < il2_ex_on_p) il2_ex_cur = 1; else il2_ex_cur = 0; end    % random I.C.
    count_il2_ex = 0;                         % step count
	
	% il2
	il2_cur = param(il2_node,2);        % I.C.
    il2_on_rt = param(il2_node,3);      % update ON rate
    il2_off_rt = param(il2_node,4);     % update OFF rate
    il2_on_p = param(il2_node,5);       % update ON probability
    il2_off_p = param(il2_node,6);      % update ON probability
    %if (rand < il2_on_p) il2_cur = 1; else il2_cur = 0; end    % random I.C.
    count_il2 = 0;                      % step count
	
	% il2_r
	il2_r_cur = param(il2r_node,2);          % I.C.
    il2_r_on_rt = param(il2r_node,3);        % update ON rate
    il2_r_off_rt = param(il2r_node,4);       % update OFF rate
    il2_r_on_p = param(il2r_node,5);         % update ON probability
    il2_r_off_p = param(il2r_node,6);        % update ON probability
    %if (rand < il2_r_on_p) il2_r_cur = 1; else il2_r_cur = 0; end    % random I.C.
    count_il2_r = 0;                         % step count

	%jak1
	jak13_cur = param(jak13_node,2);      	% I.C.
    jak13_on_rt = param(jak13_node,3);    	% update ON rate
    jak13_off_rt = param(jak13_node,4);   	% update OFF rate
    jak13_on_p = param(jak13_node,5);     	% update ON probability
    jak13_off_p = param(jak13_node,6);    	% update ON probability
    %if (rand < jak13_on_p) jak13_cur = 1; else jak13_cur = 0; end    % random I.C.
    count_jak13 = 0;                     	% step count

% inhibitory pathways

    % pdl1_ex
    pdl1_ex_cur = param(pdl1_ex_node,2);          % I.C.
    pdl1_ex_on_rt = param(pdl1_ex_node,3);        % update ON rate
    pdl1_ex_off_rt = param(pdl1_ex_node,4);       % update OFF rate
    pdl1_ex_on_p = param(pdl1_ex_node,5);         % update ON probability
    pdl1_ex_off_p = param(pdl1_ex_node,6);        % update ON probability
	if (rand < pdl1_ex_on_p) pdl1_ex_cur = 1; else pdl1_ex_cur = 0; end    % random I.C.
    count_pdl1_ex = 0;                         % step count

    % pdl1
    pdl1_cur = param(pdl1_node,2);          % I.C.
    pdl1_on_rt = param(pdl1_node,3);        % update ON rate
    pdl1_off_rt = param(pdl1_node,4);       % update OFF rate
    pdl1_on_p = param(pdl1_node,5);         % update ON probability
    pdl1_off_p = param(pdl1_node,6);        % update ON probability
    %if (rand < pdl1_on_p) pdl1_cur = 1; else pdl1_cur = 0; end    % random I.C.
    count_pdl1 = 0;                         % step count

    % pd1
    pd1_cur = param(pd1_node,2);            % I.C.
    pd1_on_rt = param(pd1_node,3);          % update ON rate
    pd1_off_rt = param(pd1_node,4);         % update OFF rate
    pd1_on_p = param(pd1_node,5);           % update ON probability
    pd1_off_p = param(pd1_node,6);          % update ON probability
    count_pd1 = 0;                          % step count

    % pd1_ex
    pd1_ex_cur = param(pd1_ex_node,2);          % I.C.
    pd1_ex_on_rt = param(pd1_ex_node,3);        % update ON rate
    pd1_ex_off_rt = param(pd1_ex_node,4);       % update OFF rate
    pd1_ex_on_p = param(pd1_ex_node,5);         % update ON probability
    pd1_ex_off_p = param(pd1_ex_node,6);        % update ON probability
    count_pd1_ex = 0;                           % step count

    % cd8086_ex
    cd8086_ex_cur = param(cd8086_ex_node,2);          % I.C.
    cd8086_ex_on_rt = param(cd8086_ex_node,3);        % update ON rate
    cd8086_ex_off_rt = param(cd8086_ex_node,4);       % update OFF rate
    cd8086_ex_on_p = param(cd8086_ex_node,5);         % update ON probability
    cd8086_ex_off_p = param(cd8086_ex_node,6);        % update ON probability
	if (rand < cd8086_ex_on_p) cd8086_ex_cur = 1; else cd8086_ex_cur = 0; end    % random I.C.
    count_cd8086_ex = 0;                         % step count

    % cd8086
    cd8086_cur = param(cd8086_node,2);          % I.C.
    cd8086_on_rt = param(cd8086_node,3);        % update ON rate
    cd8086_off_rt = param(cd8086_node,4);       % update OFF rate
    cd8086_on_p = param(cd8086_node,5);         % update ON probability
    cd8086_off_p = param(cd8086_node,6);        % update ON probability
	%if (rand < cd8086_on_p) cd8086_cur = 1; else cd8086_cur = 0; end    % random I.C.
    count_cd8086 = 0;                         % step count

    % ctla4_ex
    ctla4_ex_cur = param(ctla4_ex_node,2);          % I.C.
    ctla4_ex_on_rt = param(ctla4_ex_node,3);        % update ON rate
    ctla4_ex_off_rt = param(ctla4_ex_node,4);       % update OFF rate
    ctla4_ex_on_p = param(ctla4_ex_node,5);         % update ON probability
    ctla4_ex_off_p = param(ctla4_ex_node,6);        % update ON probability
	%if (rand < ctla4_ex_on_p) ctla4_ex_cur = 1; else ctla4_ex_cur = 0; end    % random I.C.
    count_ctla4_ex = 0;                         % step count

    % ctla4
    ctla4_cur = param(ctla4_node,2);          % I.C.
    ctla4_on_rt = param(ctla4_node,3);        % update ON rate
    ctla4_off_rt = param(ctla4_node,4);       % update OFF rate
    ctla4_on_p = param(ctla4_node,5);         % update ON probability
    ctla4_off_p = param(ctla4_node,6);        % update ON probability
	%if (rand < ctla4_on_p) ctla4_cur = 1; else ctla4_cur = 0; end    % random I.C.
    count_ctla4 = 0;                         % step count

    % shp1
    shp1_cur = param(shp1_node,2);          % I.C.
    shp1_on_rt = param(shp1_node,3);        % update ON rate
    shp1_off_rt = param(shp1_node,4);       % update OFF rate
    shp1_on_p = param(shp1_node,5);         % update ON probability
    shp1_off_p = param(shp1_node,6);        % update ON probability
    count_shp1 = 0;                         % step count

    % shp2
    shp2_cur = param(shp2_node,2);          % I.C.
    shp2_on_rt = param(shp2_node,3);        % update ON rate
    shp2_off_rt = param(shp2_node,4);       % update OFF rate
    shp2_on_p = param(shp2_node,5);         % update ON probability
    shp2_off_p = param(shp2_node,6);        % update ON probability
    count_shp2 = 0;                         % step count

%signaling intermediates

    % lat
    lat_cur = param(lat_node,2);          % I.C.
    lat_on_rt = param(lat_node,3);        % update ON rate
    lat_off_rt = param(lat_node,4);       % update OFF rate
    lat_on_p = param(lat_node,5);         % update ON probability
    lat_off_p = param(lat_node,6);        % update ON probability
	%if (rand < lat_on_p) lat_cur = 1; else lat_cur = 0; end    % random I.C.
    count_lat = 0;                         % step count

    % slp76
    slp76_cur = param(slp76_node,2);          % I.C.
    slp76_on_rt = param(slp76_node,3);        % update ON rate
    slp76_off_rt = param(slp76_node,4);       % update OFF rate
    slp76_on_p = param(slp76_node,5);         % update ON probability
    slp76_off_p = param(slp76_node,6);        % update ON probability
	%if (rand < slp76_on_p) slp76_cur = 1; else slp76_cur = 0; end    % random I.C.
    count_slp76 = 0;                         % step count

    % plc_gamma1
    plc_gamma1_cur = param(plc_gamma1_node,2);          % I.C.
    plc_gamma1_on_rt = param(plc_gamma1_node,3);        % update ON rate
    plc_gamma1_off_rt = param(plc_gamma1_node,4);       % update OFF rate
    plc_gamma1_on_p = param(plc_gamma1_node,5);         % update ON probability
    plc_gamma1_off_p = param(plc_gamma1_node,6);        % update ON probability
	%if (rand < plc_gamma1_on_p) plc_gamma1_cur = 1; else plc_gamma1_cur = 0; end    % random I.C.
    count_plc_gamma1 = 0;                         % step count

    % dag
    dag_cur = param(dag_node,2);          % I.C.
    dag_on_rt = param(dag_node,3);        % update ON rate
    dag_off_rt = param(dag_node,4);       % update OFF rate
    dag_on_p = param(dag_node,5);         % update ON probability
    dag_off_p = param(dag_node,6);        % update ON probability
	%if (rand < dag_on_p) dag_cur = 1; else dag_cur = 0; end    % random I.C.
    count_dag = 0;                         % step count

    % ip3
    ip3_cur = param(ip3_node,2);          % I.C.
    ip3_on_rt = param(ip3_node,3);        % update ON rate
    ip3_off_rt = param(ip3_node,4);       % update OFF rate
    ip3_on_p = param(ip3_node,5);         % update ON probability
    ip3_off_p = param(ip3_node,6);        % update ON probability
	%if (rand < ip3_on_p) ip3_cur = 1; else ip3_cur = 0; end    % random I.C.
    count_ip3 = 0;                         % step count

    % wasp_cdc42
    wasp_cdc42_cur = param(wasp_cdc42_node,2);          % I.C.
    wasp_cdc42_on_rt = param(wasp_cdc42_node,3);        % update ON rate
    wasp_cdc42_off_rt = param(wasp_cdc42_node,4);       % update OFF rate
    wasp_cdc42_on_p = param(wasp_cdc42_node,5);         % update ON probability
    wasp_cdc42_off_p = param(wasp_cdc42_node,6);        % update ON probability
	%if (rand < wasp_cdc42_on_p) wasp_cdc42_cur = 1; else wasp_cdc42_cur = 0; end    % random I.C.
    count_wasp_cdc42 = 0;                         % step count

    % p38
    p38_cur = param(p38_node,2);          % I.C.
    p38_on_rt = param(p38_node,3);        % update ON rate
    p38_off_rt = param(p38_node,4);       % update OFF rate
    p38_on_p = param(p38_node,5);         % update ON probability
    p38_off_p = param(p38_node,6);        % update ON probability
	%if (rand < p38_on_p) p38_cur = 1; else p38_cur = 0; end    % random I.C.
    count_p38 = 0;                         % step count

    % pkc_theta
    pkc_theta_cur = param(pkc_theta_node,2);          % I.C.
    pkc_theta_on_rt = param(pkc_theta_node,3);        % update ON rate
    pkc_theta_off_rt = param(pkc_theta_node,4);       % update OFF rate
    pkc_theta_on_p = param(pkc_theta_node,5);         % update ON probability
    pkc_theta_off_p = param(pkc_theta_node,6);        % update ON probability
	%if (rand < pkc_theta_on_p) pkc_theta_cur = 1; else pkc_theta_cur = 0; end    % random I.C.
    count_pkc_theta = 0;                         % step count

%pi3k-akt

    % pi3k
    pi3k_cur = param(pi3k_node,2);          % I.C.
    pi3k_on_rt = param(pi3k_node,3);        % update ON rate
    pi3k_off_rt = param(pi3k_node,4);       % update OFF rate
    pi3k_on_p = param(pi3k_node,5);         % update ON probability
    pi3k_off_p = param(pi3k_node,6);        % update ON probability
	%if (rand < pi3k_on_p) pi3k_cur = 1; else pi3k_cur = 0; end    % random I.C.
    count_pi3k = 0;                         % step count

    % pdpk1
    pdpk1_cur = param(pdpk1_node,2);          % I.C.
    pdpk1_on_rt = param(pdpk1_node,3);        % update ON rate
    pdpk1_off_rt = param(pdpk1_node,4);       % update OFF rate
    pdpk1_on_p = param(pdpk1_node,5);         % update ON probability
    pdpk1_off_p = param(pdpk1_node,6);        % update ON probability
	%if (rand < pdpk1_on_p) pdpk1_cur = 1; else pdpk1_cur = 0; end    % random I.C.
    count_pdpk1 = 0;                         % step count

    % akt
    akt_cur = param(akt_node,2);          % I.C.
    akt_on_rt = param(akt_node,3);        % update ON rate
    akt_off_rt = param(akt_node,4);       % update OFF rate
    akt_on_p = param(akt_node,5);         % update ON probability
    akt_off_p = param(akt_node,6);        % update ON probability
	%if (rand < akt_on_p) akt_cur = 1; else akt_cur = 0; end    % random I.C.
    count_akt = 0;                         % step count

    % mtorc1
    mtorc1_cur = param(mtorc1_node,2);          % I.C.
    mtorc1_on_rt = param(mtorc1_node,3);        % update ON rate
    mtorc1_off_rt = param(mtorc1_node,4);       % update OFF rate
    mtorc1_on_p = param(mtorc1_node,5);         % update ON probability
    mtorc1_off_p = param(mtorc1_node,6);        % update ON probability
	%if (rand < mtorc1_on_p) mtorc1_cur = 1; else mtorc1_cur = 0; end    % random I.C.
    count_mtorc1 = 0;                         % step count
	
%mapk

    % rasgrp
    rasgrp_cur = param(rasgrp_node,2);          % I.C.
    rasgrp_on_rt = param(rasgrp_node,3);        % update ON rate
    rasgrp_off_rt = param(rasgrp_node,4);       % update OFF rate
    rasgrp_on_p = param(rasgrp_node,5);         % update ON probability
    rasgrp_off_p = param(rasgrp_node,6);        % update ON probability
	%if (rand < rasgrp_on_p) rasgrp_cur = 1; else rasgrp_cur = 0; end    % random I.C.
    count_rasgrp = 0;                         % step count

    % grb2_sos
    grb2_sos_cur = param(grb2_sos_node,2);          % I.C.
    grb2_sos_on_rt = param(grb2_sos_node,3);        % update ON rate
    grb2_sos_off_rt = param(grb2_sos_node,4);       % update OFF rate
    grb2_sos_on_p = param(grb2_sos_node,5);         % update ON probability
    grb2_sos_off_p = param(grb2_sos_node,6);        % update ON probability
	%if (rand < grb2_sos_on_p) grb2_sos_cur = 1; else grb2_sos_cur = 0; end    % random I.C.
    count_grb2_sos = 0;                         % step count

    % erk
    erk_cur = param(erk_node,2);          % I.C.
    erk_on_rt = param(erk_node,3);        % update ON rate
    erk_off_rt = param(erk_node,4);       % update OFF rate
    erk_on_p = param(erk_node,5);         % update ON probability
    erk_off_p = param(erk_node,6);        % update ON probability
	%if (rand < erk_on_p) erk_cur = 1; else erk_cur = 0; end    % random I.C.
    count_erk = 0;                         % step count

%calcium

    % calcium
    calcium_cur = param(calcium_node,2);          % I.C.
    calcium_on_rt = param(calcium_node,3);        % update ON rate
    calcium_off_rt = param(calcium_node,4);       % update OFF rate
    calcium_on_p = param(calcium_node,5);         % update ON probability
    calcium_off_p = param(calcium_node,6);        % update ON probability
	%if (rand < calcium_on_p) calcium_cur = 1; else calcium_cur = 0; end    % random I.C.
    count_calcium = 0;                         % step count

    % calmodulin
    calmodulin_cur = param(calmodulin_node,2);          % I.C.
    calmodulin_on_rt = param(calmodulin_node,3);        % update ON rate
    calmodulin_off_rt = param(calmodulin_node,4);       % update OFF rate
    calmodulin_on_p = param(calmodulin_node,5);         % update ON probability
    calmodulin_off_p = param(calmodulin_node,6);        % update ON probability
	%if (rand < calmodulin_on_p) calmodulin_cur = 1; else calmodulin_cur = 0; end    % random I.C.
    count_calmodulin = 0;                         % step count

    % calcineurin
    calcineurin_cur = param(calcineurin_node,2);          % I.C.
    calcineurin_on_rt = param(calcineurin_node,3);        % update ON rate
    calcineurin_off_rt = param(calcineurin_node,4);       % update OFF rate
    calcineurin_on_p = param(calcineurin_node,5);         % update ON probability
    calcineurin_off_p = param(calcineurin_node,6);        % update ON probability
	%if (rand < calcineurin_on_p) calcineurin_cur = 1; else calcineurin_cur = 0; end    % random I.C.
    count_calcineurin = 0;                         % step count

%cytotoxic

    % fasl
    fasl_cur = param(fasl_node,2);          % I.C.
    fasl_on_rt = param(fasl_node,3);        % update ON rate
    fasl_off_rt = param(fasl_node,4);       % update OFF rate
    fasl_on_p = param(fasl_node,5);         % update ON probability
    fasl_off_p = param(fasl_node,6);        % update ON probability
	%if (rand < fasl_on_p) fasl_cur = 1; else fasl_cur = 0; end    % random I.C.
    count_fasl = 0;                         % step count

    % per_gzmb
    per_gzmb_cur = param(per_gzmb_node,2);          % I.C.
    per_gzmb_on_rt = param(per_gzmb_node,3);        % update ON rate
    per_gzmb_off_rt = param(per_gzmb_node,4);       % update OFF rate
    per_gzmb_on_p = param(per_gzmb_node,5);         % update ON probability
    per_gzmb_off_p = param(per_gzmb_node,6);        % update ON probability
	%if (rand < per_gzmb_on_p) per_gzmb_cur = 1; else per_gzmb_cur = 0; end    % random I.C.
    count_per_gzmb = 0;                         % step count

    % fas
    fas_cur = param(fas_node,2);          % I.C.
    fas_on_rt = param(fas_node,3);        % update ON rate
    fas_off_rt = param(fas_node,4);       % update OFF rate
    fas_on_p = param(fas_node,5);         % update ON probability
    fas_off_p = param(fas_node,6);        % update ON probability
	%if (rand < fas_on_p) fas_cur = 1; else fas_cur = 0; end    % random I.C.
    count_fas = 0;                         % step count

    % casp3_7
    casp3_7_cur = param(casp3_7_node,2);          % I.C.
    casp3_7_on_rt = param(casp3_7_node,3);        % update ON rate
    casp3_7_off_rt = param(casp3_7_node,4);       % update OFF rate
    casp3_7_on_p = param(casp3_7_node,5);         % update ON probability
    casp3_7_off_p = param(casp3_7_node,6);        % update ON probability
	%if (rand < casp3_7_on_p) casp3_7_cur = 1; else casp3_7_cur = 0; end    % random I.C.
    count_casp3_7 = 0;                         % step count

%transcription factors

    % cfos
    cfos_cur = param(cfos_node,2);          % I.C.
    cfos_on_rt = param(cfos_node,3);        % update ON rate
    cfos_off_rt = param(cfos_node,4);       % update OFF rate
    cfos_on_p = param(cfos_node,5);         % update ON probability
    cfos_off_p = param(cfos_node,6);        % update ON probability
	%if (rand < cfos_on_p) cfos_cur = 1; else cfos_cur = 0; end    % random I.C.
    count_cfos = 0;                         % step count

    % cjun
    cjun_cur = param(cjun_node,2);          % I.C.
    cjun_on_rt = param(cjun_node,3);        % update ON rate
    cjun_off_rt = param(cjun_node,4);       % update OFF rate
    cjun_on_p = param(cjun_node,5);         % update ON probability
    cjun_off_p = param(cjun_node,6);        % update ON probability
	%if (rand < cjun_on_p) cjun_cur = 1; else cjun_cur = 0; end    % random I.C.
    count_cjun = 0;                         % step count

    % nfkb
    nfkb_cur = param(nfkb_node,2);          % I.C.
    nfkb_on_rt = param(nfkb_node,3);        % update ON rate
    nfkb_off_rt = param(nfkb_node,4);       % update OFF rate
    nfkb_on_p = param(nfkb_node,5);         % update ON probability
    nfkb_off_p = param(nfkb_node,6);        % update ON probability
	%if (rand < nfkb_on_p) nfkb_cur = 1; else nfkb_cur = 0; end    % random I.C.
    count_nfkb = 0;                         % step count

    % nfat
    nfat_cur = param(nfat_node,2);          % I.C.
    nfat_on_rt = param(nfat_node,3);        % update ON rate
    nfat_off_rt = param(nfat_node,4);       % update OFF rate
    nfat_on_p = param(nfat_node,5);         % update ON probability
    nfat_off_p = param(nfat_node,6);        % update ON probability
	%if (rand < nfat_on_p) nfat_cur = 1; else nfat_cur = 0; end    % random I.C.
    count_nfat = 0;                         % step count

    % nfat_dimer
    nfat_dimer_cur = param(nfat_dimer_node,2);          % I.C.
    nfat_dimer_on_rt = param(nfat_dimer_node,3);        % update ON rate
    nfat_dimer_off_rt = param(nfat_dimer_node,4);       % update OFF rate
    nfat_dimer_on_p = param(nfat_dimer_node,5);         % update ON probability
    nfat_dimer_off_p = param(nfat_dimer_node,6);        % update ON probability
	%if (rand < nfat_dimer_on_p) nfat_dimer_cur = 1; else nfat_dimer_cur = 0; end    % random I.C.
    count_nfat_dimer = 0;                         % step count

    % creb
    creb_cur = param(creb_node,2);          % I.C.
    creb_on_rt = param(creb_node,3);        % update ON rate
    creb_off_rt = param(creb_node,4);       % update OFF rate
    creb_on_p = param(creb_node,5);         % update ON probability
    creb_off_p = param(creb_node,6);        % update ON probability
	%if (rand < creb_on_p) creb_cur = 1; else creb_cur = 0; end    % random I.C.
    count_creb = 0;                         % step count

    % ap1
    ap1_cur = param(ap1_node,2);          % I.C.
    ap1_on_rt = param(ap1_node,3);        % update ON rate
    ap1_off_rt = param(ap1_node,4);       % update OFF rate
    ap1_on_p = param(ap1_node,5);         % update ON probability
    ap1_off_p = param(ap1_node,6);        % update ON probability
	%if (rand < ap1_on_p) ap1_cur = 1; else ap1_cur = 0; end    % random I.C.
    count_ap1 = 0;                         % step count

	%batf
	batf_cur = param(batf_node,2);      	% I.C.
    batf_on_rt = param(batf_node,3);    	% update ON rate
    batf_off_rt = param(batf_node,4);   	% update OFF rate
    batf_on_p = param(batf_node,5);     	% update ON probability
    batf_off_p = param(batf_node,6);    	% update ON probability
    count_batf = 0;                     	% step count

	%stat5
	stat5_cur = param(stat5_node,2);      	% I.C.
    stat5_on_rt = param(stat5_node,3);    	% update ON rate
    stat5_off_rt = param(stat5_node,4);   	% update OFF rate
    stat5_on_p = param(stat5_node,5);     	% update ON probability
    stat5_off_p = param(stat5_node,6);    	% update ON probability
    count_stat5 = 0;                     	% step count
    
%ge

    % il2_ge
    il2_ge_cur = param(il2_ge_node,2);          % I.C.
    il2_ge_on_rt = param(il2_ge_node,3);        % update ON rate
    il2_ge_off_rt = param(il2_ge_node,4);       % update OFF rate
    il2_ge_on_p = param(il2_ge_node,5);         % update ON probability
    il2_ge_off_p = param(il2_ge_node,6);        % update ON probability
	%if (rand < il2_ge_on_p) il2_ge_cur = 1; else il2_ge_cur = 0; end    % random I.C.
    count_il2_ge = 0;                         % step count
    
    % pdcd1_ge
    pdcd1_ge_cur = param(pdcd1_ge_node,2);          % I.C.
    pdcd1_ge_on_rt = param(pdcd1_ge_node,3);        % update ON rate
    pdcd1_ge_off_rt = param(pdcd1_ge_node,4);       % update OFF rate
    pdcd1_ge_on_p = param(pdcd1_ge_node,5);         % update ON probability
    pdcd1_ge_off_p = param(pdcd1_ge_node,6);        % update ON probability
	%if (rand < pdcd1_ge_on_p) pdcd1_ge_cur = 1; else pdcd1_ge_cur = 0; end    % random I.C.
    count_pdcd1_ge = 0;                         % step count

%cellular response

    % cart_ct
    cart_ct_cur = param(cart_ct_node,2);          % I.C.
    cart_ct_on_rt = param(cart_ct_node,3);        % update ON rate
    cart_ct_off_rt = param(cart_ct_node,4);       % update OFF rate
    cart_ct_on_p = param(cart_ct_node,5);         % update ON probability
    cart_ct_off_p = param(cart_ct_node,6);        % update ON probability
	%if (rand < cart_ct_on_p) cart_ct_cur = 1; else cart_ct_cur = 0; end    % random I.C.
    count_cart_ct = 0;                         % step count

    % cart_func
    cart_func_cur = param(cart_func_node,2);          % I.C.
    cart_func_on_rt = param(cart_func_node,3);        % update ON rate
    cart_func_off_rt = param(cart_func_node,4);       % update OFF rate
    cart_func_on_p = param(cart_func_node,5);         % update ON probability
    cart_func_off_p = param(cart_func_node,6);        % update ON probability
	%if (rand < cart_func_on_p) cart_func_cur = 1; else cart_func_cur = 0; end    % random I.C.
    count_cart_func = 0;                         % step count

    % cart_dys
    cart_dys_cur = param(cart_dys_node,2);          % I.C.
    cart_dys_on_rt = param(cart_dys_node,3);        % update ON rate
    cart_dys_off_rt = param(cart_dys_node,4);       % update OFF rate
    cart_dys_on_p = param(cart_dys_node,5);         % update ON probability
    cart_dys_off_p = param(cart_dys_node,6);        % update ON probability
	%if (rand < cart_dys_on_p) cart_dys_cur = 1; else cart_dys_cur = 0; end    % random I.C.
    count_cart_dys = 0;                         % step count

    % tumor_apop
    tumor_apop_cur = param(tumor_apop_node,2);          % I.C.
    tumor_apop_on_rt = param(tumor_apop_node,3);        % update ON rate
    tumor_apop_off_rt = param(tumor_apop_node,4);       % update OFF rate
    tumor_apop_on_p = param(tumor_apop_node,5);         % update ON probability
    tumor_apop_off_p = param(tumor_apop_node,6);        % update ON probability
	%if (rand < tumor_apop_on_p) tumor_apop_cur = 1; else tumor_apop_cur = 0; end    % random I.C.
    count_tumor_apop = 0;                         % step count

% timesteps

for j = 1:timesteps

    async_seq = randperm(varnum,varnum);

    for k = 1:varnum

        rulenum = async_seq(k);

        switch rulenum
            
            %% CAR
            
            %% ta_ex ruleset
            
            case ta_ex_node            

                count_ta_ex = count_ta_ex + 1;
            
                switch ta_ex_cur
            
                    case 0
                        switch (rand < ta_ex_on_p) && (count_ta_ex > ta_ex_on_rt)
                            case 0
                                %ta_ex_cur = ta_ex_cur;
                            case 1
                                ta_ex_cur = 1;
                                count_ta_ex = 0;
                        end
            
                    case 1
                        switch (rand < ta_ex_off_p) && (count_ta_ex > ta_ex_off_rt)
                            case 0
                                %ta_ex_cur = ta_ex_cur;
                            case 1
                                ta_ex_cur = 0;
                                count_ta_ex = 0;
                        end  
                
                end
            
            %% ta ruleset
            
            case ta_node

                count_ta = count_ta + 1;
            
                switch ta_cur
            
                    case 0
                        switch (rand < ta_on_p) && (count_ta > ta_on_rt)
                            case 0
                                %ta_cur = ta_cur;
                            case 1
                                ta_cur = ta_ex_cur;
                                count_ta = 0;
                        end
            
                    case 1
                        switch (rand < ta_off_p) && (count_ta > ta_off_rt)
                            case 0
                                %ta_cur = ta_cur;
                            case 1
                                ta_cur = ta_ex_cur;
                                count_ta = 0;
                        end  
                
                end
                
            %% is ruleset
	
            case is_node            

                count_is = count_is + 1;
            
                switch is_cur
            
                    case 0
                        switch (rand < is_on_p) && (count_is > is_on_rt)
                            case 0
                                %is_cur = is_cur;
                            case 1
                                is_cur = ~is_cur && ~casp3_7_cur;
                                %is_cur = 1;
                                count_is = 0;
                        end
            
                    case 1
                        switch (rand < is_off_p) && (count_is > is_off_rt)
                            case 0
                                %is_cur = is_cur;
                            case 1
                                is_cur = ~is_cur && ~casp3_7_cur;
                                %is_cur = 0;
                                %disp('is off')
                                count_is = 0;
                        end  
                
                end

            %% scFv ruleset
            
            case scFv_node            

                count_scFv = count_scFv + 1;
            
                switch scFv_cur
            
                    case 0
                        switch (rand < scFv_on_p) && (count_scFv > scFv_on_rt)
                            case 0
                                %scFv_cur = scFv_cur;
                            case 1
                                scFv_cur = ta_cur & is_cur;
                                count_scFv = 0;
                        end
            
                    case 1
                        switch (rand < scFv_off_p) && (count_scFv > scFv_off_rt)
                            case 0
                                %scFv_cur = scFv_cur;
                            case 1
                                scFv_cur = ta_cur & is_cur;
                                count_scFv = 0;
                        end  
                
                end

            %% cd28 ruleset

            case cd28_node           

                count_cd28 = count_cd28 + 1;
            
                switch cd28_cur
            
                    case 0
                        switch (rand < cd28_on_p) && (count_cd28 > cd28_on_rt)
                            case 0
                                %cd28_cur = cd28_cur;
                            case 1
                                cd28_cur = scFv_cur;
                                count_cd28 = 0;
                        end
            
                    case 1
                        switch (rand < cd28_off_p) && (count_cd28 > cd28_off_rt)
                            case 0
                                %cd28_cur = cd28_cur;
                            case 1
                                cd28_cur = scFv_cur;
                                count_cd28 = 0;
                        end  
                
                end


            %% cd3 zeta ruleset
              
            case cd3_zeta_node            
            
                count_cd3_zeta = count_cd3_zeta + 1;
            
                switch cd3_zeta_cur
            
                    case 0
                        switch (rand < cd3_zeta_on_p) && (count_cd3_zeta > cd3_zeta_on_rt)
                            case 0
                                %cd3_zeta_cur = cd3_zeta_cur;
                            case 1
                                cd3_zeta_cur = cd28_cur && lck_cur;
                                count_cd3_zeta = 0;
                        end
            
                    case 1
                        switch (rand < cd3_zeta_off_p) && (count_cd3_zeta > cd3_zeta_off_rt)
                            case 0
                                %cd3_zeta_cur = cd3_zeta_cur;
                            case 1
                                cd3_zeta_cur = cd28_cur && lck_cur;
                                count_cd3_zeta = 0;
                        end  
                
                end

            %% lck ruleset

            case lck_node            
            
                count_lck = count_lck + 1;
            
                switch lck_cur
            
                    case 0
                        switch (rand < lck_on_p) && (count_lck > lck_on_rt)
                            case 0
                                %lck_cur = lck_cur;
                            case 1
                                %lck_cur = 1;
                                lck_cur = ~lck_cur && ((~shp1_cur || (shp1_cur && erk_cur)) &&...
                                            (~shp2_cur || (shp2_cur && erk_cur)));
                                %lck_cur = ~lck_cur && ~(shp1_cur || shp2_cur);
                                count_lck = 0;
                        end
            
                    case 1
                        switch (rand < lck_off_p) && (count_lck > lck_off_rt)
                            case 0
                                %lck_cur = lck_cur;
                            case 1
                                %lck_cur = 0;
                                lck_cur = ~lck_cur && ((~shp1_cur || (shp1_cur && erk_cur)) &&...
                                            (~shp2_cur || (shp2_cur && erk_cur)));
                                %lck_cur = ~lck_cur && ~(shp1_cur || shp2_cur);
                                count_lck = 0;
                        end  
                
                end

            %% zap70 ruleset

            case zap70_node            
            
                count_zap70 = count_zap70 + 1;
            
                switch zap70_cur
            
                    case 0
                        switch (rand < zap70_on_p) && (count_zap70 > zap70_on_rt)
                            case 0
                                %zap70_cur = zap70_cur;
                            case 1
                                zap70_cur = cd3_zeta_cur && lck_cur && ~(shp1_cur || shp2_cur);
                                count_zap70 = 0;
                        end
            
                    case 1
                        switch (rand < zap70_off_p) && (count_zap70 > zap70_off_rt)
                            case 0
                                %zap70_cur = zap70_cur;
                            case 1
                                zap70_cur = cd3_zeta_cur && lck_cur && ~(shp1_cur || shp2_cur);
                                count_zap70 = 0;
                        end  
                
                end
                
            %% il2
                
            %% il2 ex ruleset
            
            case il2_ex_node   

                count_il2_ex = count_il2_ex + 1;
            
                switch il2_ex_cur
            
                    case 0
                        switch (rand < il2_ex_on_p) && (count_il2_ex > il2_ex_on_rt)
                            case 0
                                %il2_ex_cur = il2_ex_cur;
                            case 1
                                il2_ex_cur = 1;
                                count_il2_ex = 0;
                        end
            
                    case 1
                        switch (rand < il2_ex_off_p) && (count_il2_ex > il2_ex_off_rt)
                            case 0
                                %il2_ex_cur = il2_ex_cur;
                            case 1
                                il2_ex_cur = 0;
                                count_il2_ex = 0;
                        end  
                
                end

            %% il2 input ruleset
            
            case il2_node           

                count_il2 = count_il2 + 1;
            
                switch il2_cur
            
                    case 0
                        switch (rand < il2_on_p) && (count_il2 > il2_on_rt)
                            case 0
                                %il2_input_cur = il2_input_cur;
                            case 1
                                il2_cur = il2_ex_cur;
                                count_il2 = 0;
                        end
            
                    case 1
                        switch (rand < il2_off_p) && (count_il2 > il2_off_rt)
                            case 0
                                %il2_input_cur = il2_input_cur;
                            case 1
                                il2_cur = il2_ex_cur;
                                count_il2 = 0;
                        end  
                
                end

            %% il2 receptor alpha ruleset
            
            case il2r_node      

                count_il2_r = count_il2_r + 1;
            
                switch il2_r_cur
            
                    case 0
                        switch (rand < il2_r_on_p) && (count_il2_r > il2_r_on_rt)
                            case 0
                                %il2_ra_cur = il2_ra_cur;
                            case 1
                                il2_r_cur = il2_cur;
                                count_il2_r = 0;
                        end
            
                    case 1
                        switch (rand < il2_r_off_p) && (count_il2_r > il2_r_off_rt)
                            case 0
                                %il2_ra_cur = il2_ra_cur;
                            case 1
                                il2_r_cur = il2_cur;
                                count_il2_r = 0;
                        end  
                
                end
           
            %% jak13 ruleset
            
            case jak13_node  

                count_jak13 = count_jak13 + 1;
            
                switch jak13_cur
            
                    case 0
                        switch (rand < jak13_on_p) && (count_jak13 > jak13_on_rt)
                            case 0
                                %jak1_cur = jak1_cur;
                            case 1
                                jak13_cur = (il2_r_cur)...
                                            && ~(shp1_cur || shp2_cur);
                                count_jak13 = 0;
                        end
            
                    case 1
                        switch (rand < jak13_off_p) && (count_jak13 > jak13_off_rt)
                            case 0
                                %jak1_cur = jak1_cur;
                            case 1
                                jak13_cur = (il2_r_cur)...
                                            && ~(shp1_cur || shp2_cur);
                                count_jak13 = 0;
                        end  
                
                end   
                
            %% Inhibitory Pathways
            
            %% pdl1_ex ruleset
	
            case pdl1_ex_node            

                count_pdl1_ex = count_pdl1_ex + 1;
            
                switch pdl1_ex_cur
            
                    case 0
                        switch (rand < pdl1_ex_on_p) && (count_pdl1_ex > pdl1_ex_on_rt)
                            case 0
                                %pdl1_ex_cur = pdl1_ex_cur;
                            case 1
                                pdl1_ex_cur = 1;
                                count_pdl1_ex = 0;
                        end
            
                    case 1
                        switch (rand < pdl1_ex_off_p) && (count_pdl1_ex > pdl1_ex_off_rt)
                            case 0
                                %pdl1_ex_cur = pdl1_ex_cur;
                            case 1
                                pdl1_ex_cur = 0;
                                count_pdl1_ex = 0;
                        end  
                
                end

            %% pdl1 ruleset

            case pdl1_node            
            
                count_pdl1 = count_pdl1 + 1;
            
                switch pdl1_cur
            
                    case 0
                        switch (rand < pdl1_on_p) && (count_pdl1 > pdl1_on_rt)
                            case 0
                                %pdl1_cur = pdl1_cur;
                            case 1
                                pdl1_cur = pdl1_ex_cur;
                                count_pdl1 = 0;
                        end
            
                    case 1
                        switch (rand < pdl1_off_p) && (count_pdl1 > pdl1_off_rt)
                            case 0
                                %pdl1_cur = pdl1_cur;
                            case 1
                                pdl1_cur = pdl1_ex_cur;
                                count_pdl1 = 0;
                        end  
                
                end

             %% pd1

             case pd1_node            
            
                count_pd1 = count_pd1 + 1;
            
                switch pd1_cur
            
                    case 0
                        switch (rand < pd1_on_p) && (count_pd1 > pd1_on_rt)
                            case 0
                                %pd1_cur = pd1_cur;
                            case 1
                                pd1_cur = is_cur && pdl1_cur && pd1_ex_cur;
                                count_pd1 = 0;
                        end
            
                    case 1
                        switch (rand < pd1_off_p) && (count_pd1 > pd1_off_rt)
                            case 0
                                %pd1_cur = pd1_cur;
                            case 1
                                pd1_cur = is_cur && pdl1_cur && pd1_ex_cur;
                                count_pd1 = 0;
                        end  
                
                end

            %% pd1ex

            case pd1_ex_node            
            
                count_pd1_ex = count_pd1_ex + 1;
            
                switch pd1_ex_cur
            
                    case 0
                        switch (rand < pd1_ex_on_p) && (count_pd1_ex > pd1_ex_on_rt)
                            case 0
                                %pd1_ex_cur = pd1_ex_cur;
                            case 1
                                pd1_ex_cur = pdcd1_ge_cur;
                                count_pd1_ex = 0;
                        end
            
                    case 1
                        switch (rand < pd1_ex_off_p) && (count_pd1_ex > pd1_ex_off_rt)
                            case 0
                                %pd1_ex_cur = pd1_ex_cur;
                            case 1
                                pd1_ex_cur = pdcd1_ge_cur;
                                count_pd1_ex = 0;
                        end  
                
                end

        	%% cd8086_ex ruleset
	
	        case cd8086_ex_node            

                count_cd8086_ex = count_cd8086_ex + 1;
            
                switch cd8086_ex_cur
            
                    case 0
                        switch (rand < cd8086_ex_on_p) && (count_cd8086_ex > cd8086_ex_on_rt)
                            case 0
                                %cd8086_ex_cur = cd8086_ex_cur;
                            case 1
                                cd8086_ex_cur = 1;
                                count_cd8086_ex = 0;
                        end
            
                    case 1
                        switch (rand < cd8086_ex_off_p) && (count_cd8086_ex > cd8086_ex_off_rt)
                            case 0
                                %cd8086_ex_cur = cd8086_ex_cur;
                            case 1
                                cd8086_ex_cur = 0;
                                count_cd8086_ex = 0;
                        end  
                
                end

    	    %% cd8086 ruleset
	    
	        case cd8086_node            
    
                    count_cd8086 = count_cd8086 + 1;
                
                    switch cd8086_cur
                
                        case 0
                            switch (rand < cd8086_on_p) && (count_cd8086 > cd8086_on_rt)
                                case 0
                                    %cd8086_cur = cd8086_cur;
                                case 1
                                    cd8086_cur = cd8086_ex_cur;
                                    count_cd8086 = 0;
                            end
                
                        case 1
                            switch (rand < cd8086_off_p) && (count_cd8086 > cd8086_off_rt)
                                case 0
                                    %cd8086_cur = cd8086_cur;
                                case 1
                                    cd8086_cur = cd8086_ex_cur;
                                    count_cd8086 = 0;
                            end  
                    
                    end

		    %% ctla4ex ruleset
	    
	        case ctla4_ex_node            
    
                    count_ctla4_ex = count_ctla4_ex + 1;
                
                    switch ctla4_ex_cur
                
                        case 0
                            switch (rand < ctla4_ex_on_p) && (count_ctla4_ex > ctla4_ex_on_rt)
                                case 0
                                    %ctla4_ex_cur = ctla4_ex_cur;
                                case 1
                                    ctla4_ex_cur = calcium_cur;
                                    count_ctla4_ex = 0;
                            end
                
                        case 1
                            switch (rand < ctla4_ex_off_p) && (count_ctla4_ex > ctla4_ex_off_rt)
                                case 0
                                    %ctla4_ex_cur = ctla4_ex_cur;
                                case 1
                                    ctla4_ex_cur = calcium_cur;
                                    count_ctla4_ex = 0;
                            end  
                    
                    end
        
            %% ctla4 ruleset
	    
            case ctla4_node            
    
                    count_ctla4 = count_ctla4 + 1;
                
                    switch ctla4_cur
                
                        case 0
                            switch (rand < ctla4_on_p) && (count_ctla4 > ctla4_on_rt)
                                case 0
                                    %ctla4_cur = ctla4_cur;
                                case 1
                                    ctla4_cur = is_cur && cd8086_cur && ctla4_ex_cur;
                                    count_ctla4 = 0;
                            end
                
                        case 1
                            switch (rand < ctla4_off_p) && (count_ctla4 > ctla4_off_rt)
                                case 0
                                    %ctla4_cur = ctla4_cur;
                                case 1
                                    ctla4_cur = is_cur && cd8086_cur && ctla4_ex_cur;
                                    count_ctla4 = 0;
                            end  
                    
                    end


            %% shp2

            case shp2_node            
            
                count_shp2 = count_shp2 + 1;
            
                switch shp2_cur
            
                    case 0
                        switch (rand < shp2_on_p) && (count_shp2 > shp2_on_rt)
                            case 0
                                %shp2_cur = shp2_cur;
                            case 1
                                shp2_cur = pd1_cur || ctla4_cur;
                                count_shp2 = 0;
                        end
            
                    case 1
                        switch (rand < shp2_off_p) && (count_shp2 > shp2_off_rt)
                            case 0
                                %shp2_cur = shp2_cur;
                            case 1
                                shp2_cur = pd1_cur || ctla4_cur;
                                count_shp2 = 0;
                        end  
                
                end

            %% shp1
    
            case shp1_node            
            
                count_shp1 = count_shp1 + 1;
            
                switch shp1_cur
            
                    case 0
                        switch (rand < shp1_on_p) && (count_shp1 > shp1_on_rt)
                            case 0
                                %shp1_cur = shp1_cur;
                            case 1
                                %shp1_cur = (pd1_cur && ~shp2_cur)
                                shp1_cur = (pd1_cur && ~shp2_cur) ||...
									        (lck_cur && cd3_zeta_cur && ~erk_cur);
                                count_shp1 = 0;
                        end
            
                    case 1
                        switch (rand < shp1_off_p) && (count_shp1 > shp1_off_rt)
                            case 0
                                %shp1_cur = shp1_cur;
                            case 1
                                %shp1_cur = (pd1_cur && ~shp2_cur)
                                shp1_cur = (pd1_cur && ~shp2_cur) ||...
									        (lck_cur && cd3_zeta_cur && ~erk_cur);
                                count_shp1 = 0;
                        end  
                
                end

            %% signaling intermediates
            
            %% lat ruleset
	
	        case lat_node            

                count_lat = count_lat + 1;
            
                switch lat_cur
            
                    case 0
                        switch (rand < lat_on_p) && (count_lat > lat_on_rt)
                            case 0
                                %lat_cur = lat_cur;
                            case 1
                                lat_cur = zap70_cur;
                                count_lat = 0;
                        end
            
                    case 1
                        switch (rand < lat_off_p) && (count_lat > lat_off_rt)
                            case 0
                                %lat_cur = lat_cur;
                            case 1
                                lat_cur = zap70_cur;
                                count_lat = 0;
                        end  
                
                end

	        %% slp76 ruleset
	
	        case slp76_node            

                count_slp76 = count_slp76 + 1;
            
                switch slp76_cur
            
                    case 0
                        switch (rand < slp76_on_p) && (count_slp76 > slp76_on_rt)
                            case 0
                                %slp76_cur = slp76_cur;
                            case 1
                                slp76_cur = zap70_cur || lat_cur;
                                count_slp76 = 0;
                        end
            
                    case 1
                        switch (rand < slp76_off_p) && (count_slp76 > slp76_off_rt)
                            case 0
                                %slp76_cur = slp76_cur;
                            case 1
                                slp76_cur = zap70_cur || lat_cur;
                                count_slp76 = 0;
                        end  
                
                end

    	    %% plc_gamma1 ruleset
	
            case plc_gamma1_node            

                count_plc_gamma1 = count_plc_gamma1 + 1;
            
                switch plc_gamma1_cur
            
                    case 0
                        switch (rand < plc_gamma1_on_p) && (count_plc_gamma1 > plc_gamma1_on_rt)
                            case 0
                                %plc_gamma1_cur = plc_gamma1_cur;
                            case 1
                                plc_gamma1_cur = slp76_cur;
                                count_plc_gamma1 = 0;
                        end
            
                    case 1
                        switch (rand < plc_gamma1_off_p) && (count_plc_gamma1 > plc_gamma1_off_rt)
                            case 0
                                %plc_gamma1_cur = plc_gamma1_cur;
                            case 1
                                plc_gamma1_cur = slp76_cur;
                                count_plc_gamma1 = 0;
                        end  
                
                end

    	    %% dag ruleset
	
	        case dag_node            

                count_dag = count_dag + 1;
            
                switch dag_cur
            
                    case 0
                        switch (rand < dag_on_p) && (count_dag > dag_on_rt)
                            case 0
                                %dag_cur = dag_cur;
                            case 1
                                dag_cur = plc_gamma1_cur;
                                count_dag = 0;
                        end
            
                    case 1
                        switch (rand < dag_off_p) && (count_dag > dag_off_rt)
                            case 0
                                %dag_cur = dag_cur;
                            case 1
                                dag_cur = plc_gamma1_cur;
                                count_dag = 0;
                        end  
                
                end

    	    %% ip3 ruleset
	
            case ip3_node            

                count_ip3 = count_ip3 + 1;
            
                switch ip3_cur
            
                    case 0
                        switch (rand < ip3_on_p) && (count_ip3 > ip3_on_rt)
                            case 0
                                %ip3_cur = ip3_cur;
                            case 1
                                ip3_cur = plc_gamma1_cur;
                                count_ip3 = 0;
                        end
            
                    case 1
                        switch (rand < ip3_off_p) && (count_ip3 > ip3_off_rt)
                            case 0
                                %ip3_cur = ip3_cur;
                            case 1
                                ip3_cur = plc_gamma1_cur;
                                count_ip3 = 0;
                        end  
                
                end

    	    %% wasp_cdc42 ruleset
	
	        case wasp_cdc42_node            

                count_wasp_cdc42 = count_wasp_cdc42 + 1;
            
                switch wasp_cdc42_cur
            
                    case 0
                        switch (rand < wasp_cdc42_on_p) && (count_wasp_cdc42 > wasp_cdc42_on_rt)
                            case 0
                                %wasp_cdc42_cur = wasp_cdc42_cur;
                            case 1
                                wasp_cdc42_cur = slp76_cur;
                                count_wasp_cdc42 = 0;
                        end
            
                    case 1
                        switch (rand < wasp_cdc42_off_p) && (count_wasp_cdc42 > wasp_cdc42_off_rt)
                            case 0
                                %wasp_cdc42_cur = wasp_cdc42_cur;
                            case 1
                                wasp_cdc42_cur = slp76_cur;
                                count_wasp_cdc42 = 0;
                        end  
                
                end

            %% p38 ruleset
	
	        case p38_node            

                count_p38 = count_p38 + 1;
            
                switch p38_cur
            
                    case 0
                        switch (rand < p38_on_p) && (count_p38 > p38_on_rt)
                            case 0
                                %p38_cur = p38_cur;
                            case 1
                                p38_cur = zap70_cur;
                                count_p38 = 0;
                        end
            
                    case 1
                        switch (rand < p38_off_p) && (count_p38 > p38_off_rt)
                            case 0
                                %p38_cur = p38_cur;
                            case 1
                                p38_cur = zap70_cur;
                                count_p38 = 0;
                        end  
                
                end

    	    %% pkc_theta ruleset
	
	        case pkc_theta_node            

                count_pkc_theta = count_pkc_theta + 1;
            
                switch pkc_theta_cur
            
                    case 0
                        switch (rand < pkc_theta_on_p) && (count_pkc_theta > pkc_theta_on_rt)
                            case 0
                                %pkc_theta_cur = pkc_theta_cur;
                            case 1
                                pkc_theta_cur = (dag_cur || pdpk1_cur) ...
                                                && ~(shp1_cur || shp2_cur);
                                count_pkc_theta = 0;
                        end
            
                    case 1
                        switch (rand < pkc_theta_off_p) && (count_pkc_theta > pkc_theta_off_rt)
                            case 0
                                %pkc_theta_cur = pkc_theta_cur;
                            case 1
                                pkc_theta_cur = (dag_cur || pdpk1_cur) ...
                                                && ~(shp1_cur || shp2_cur);
                                count_pkc_theta = 0;
                        end  
                
                end

            %% pi3k - akt

        	%% pi3k ruleset
	
	        case pi3k_node            

                count_pi3k = count_pi3k + 1;
            
                switch pi3k_cur
            
                    case 0
                        switch (rand < pi3k_on_p) && (count_pi3k > pi3k_on_rt)
                            case 0
                                %pi3k_cur = pi3k_cur;
                            case 1
                                pi3k_cur = ((cd28_cur && lck_cur) || ctla4_cur || jak13_cur) ...
                                            && ~(shp1_cur || shp2_cur);
                                count_pi3k = 0;
                        end
            
                    case 1
                        switch (rand < pi3k_off_p) && (count_pi3k > pi3k_off_rt)
                            case 0
                                %pi3k_cur = pi3k_cur;
                            case 1
                                pi3k_cur = ((cd28_cur && lck_cur) || ctla4_cur || jak13_cur) ...
                                            && ~(shp1_cur || shp2_cur);
                                count_pi3k = 0;
                        end  
                
                end

        	%% pdpk1 ruleset
	
            case pdpk1_node            

                count_pdpk1 = count_pdpk1 + 1;
            
                switch pdpk1_cur
            
                    case 0
                        switch (rand < pdpk1_on_p) && (count_pdpk1 > pdpk1_on_rt)
                            case 0
                                %pdpk1_cur = pdpk1_cur;
                            case 1
                                pdpk1_cur = pi3k_cur;
                                count_pdpk1 = 0;
                        end
            
                    case 1
                        switch (rand < pdpk1_off_p) && (count_pdpk1 > pdpk1_off_rt)
                            case 0
                                %pdpk1_cur = pdpk1_cur;
                            case 1
                                pdpk1_cur = pi3k_cur;
                                count_pdpk1 = 0;
                        end  
                
                end

        	%% akt ruleset
	
	        case akt_node            

                count_akt = count_akt + 1;
            
                switch akt_cur
            
                    case 0
                        switch (rand < akt_on_p) && (count_akt > akt_on_rt)
                            case 0
                                %akt_cur = akt_cur;
                            case 1
                                akt_cur = pi3k_cur || pdpk1_cur;
                                count_akt = 0;
                        end
            
                    case 1
                        switch (rand < akt_off_p) && (count_akt > akt_off_rt)
                            case 0
                                %akt_cur = akt_cur;
                            case 1
                                akt_cur = pi3k_cur || pdpk1_cur;
                                count_akt = 0;
                        end  
                
                end
	
            %% mtorc1 ruleset
	
            case mtorc1_node            

                count_mtorc1 = count_mtorc1 + 1;
            
                switch mtorc1_cur
            
                    case 0
                        switch (rand < mtorc1_on_p) && (count_mtorc1 > mtorc1_on_rt)
                            case 0
                                %mtorc1_cur = mtorc1_cur;
                            case 1
                                mtorc1_cur = akt_cur;
                                count_mtorc1 = 0;
                        end
            
                    case 1
                        switch (rand < mtorc1_off_p) && (count_mtorc1 > mtorc1_off_rt)
                            case 0
                                %mtorc1_cur = mtorc1_cur;
                            case 1
                                mtorc1_cur = akt_cur;
                                count_mtorc1 = 0;
                        end  
                
                end

            %% mapk

            %% rasgrp ruleset
	
	        case rasgrp_node            

                count_rasgrp = count_rasgrp + 1;
            
                switch rasgrp_cur
            
                    case 0
                        switch (rand < rasgrp_on_p) && (count_rasgrp > rasgrp_on_rt)
                            case 0
                                %rasgrp_cur = rasgrp_cur;
                            case 1
                                rasgrp_cur = dag_cur;
                                count_rasgrp = 0;
                        end
            
                    case 1
                        switch (rand < rasgrp_off_p) && (count_rasgrp > rasgrp_off_rt)
                            case 0
                                %rasgrp_cur = rasgrp_cur;
                            case 1
                                rasgrp_cur = dag_cur;
                                count_rasgrp = 0;
                        end  
                
                end

        	%% grb2_sos ruleset
	
	        case grb2_sos_node            

                count_grb2_sos = count_grb2_sos + 1;
            
                switch grb2_sos_cur
            
                    case 0
                        switch (rand < grb2_sos_on_p) && (count_grb2_sos > grb2_sos_on_rt)
                            case 0
                                %grb2_sos_cur = grb2_sos_cur;
                            case 1
                                grb2_sos_cur = jak13_cur || lat_cur;
                                count_grb2_sos = 0;
                        end
            
                    case 1
                        switch (rand < grb2_sos_off_p) && (count_grb2_sos > grb2_sos_off_rt)
                            case 0
                                %grb2_sos_cur = grb2_sos_cur;
                            case 1
                                grb2_sos_cur = jak13_cur || lat_cur;
                                count_grb2_sos = 0;
                        end  
                
                end

        	%% erk ruleset
	
	        case erk_node            

                count_erk = count_erk + 1;
            
                switch erk_cur
            
                    case 0
                        switch (rand < erk_on_p) && (count_erk > erk_on_rt)
                            case 0
                                %erk_cur = erk_cur;
                            case 1
                                erk_cur = (rasgrp_cur || grb2_sos_cur)...
                                            && ~(shp1_cur || shp2_cur);
                                count_erk = 0;
                        end
            
                    case 1
                        switch (rand < erk_off_p) && (count_erk > erk_off_rt)
                            case 0
                                %erk_cur = erk_cur;
                            case 1
                                erk_cur = (rasgrp_cur || grb2_sos_cur)...
                                            && ~(shp1_cur || shp2_cur);
                                count_erk = 0;
                        end  
                
                end
            
            %% calcium

        	%% calcium ruleset
	
	        case calcium_node            

                count_calcium = count_calcium + 1;
            
                switch calcium_cur
            
                    case 0
                        switch (rand < calcium_on_p) && (count_calcium > calcium_on_rt)
                            case 0
                                %calcium_cur = calcium_cur;
                            case 1
                                calcium_cur = ip3_cur;
                                count_calcium = 0;
                        end
            
                    case 1
                        switch (rand < calcium_off_p) && (count_calcium > calcium_off_rt)
                            case 0
                                %calcium_cur = calcium_cur;
                            case 1
                                calcium_cur = ip3_cur;
                                count_calcium = 0;
                        end  
                
                end

        	%% calmodulin ruleset
	
	        case calmodulin_node            

                count_calmodulin = count_calmodulin + 1;
            
                switch calmodulin_cur
            
                    case 0
                        switch (rand < calmodulin_on_p) && (count_calmodulin > calmodulin_on_rt)
                            case 0
                                %calmodulin_cur = calmodulin_cur;
                            case 1
                                calmodulin_cur = calcium_cur;
                                count_calmodulin = 0;
                        end
            
                    case 1
                        switch (rand < calmodulin_off_p) && (count_calmodulin > calmodulin_off_rt)
                            case 0
                                %calmodulin_cur = calmodulin_cur;
                            case 1
                                calmodulin_cur = calcium_cur;
                                count_calmodulin = 0;
                        end  
                
                end
             

        	%% calcineurin ruleset
	
	        case calcineurin_node            

                count_calcineurin = count_calcineurin + 1;
            
                switch calcineurin_cur
            
                    case 0
                        switch (rand < calcineurin_on_p) && (count_calcineurin > calcineurin_on_rt)
                            case 0
                                %calcineurin_cur = calcineurin_cur;
                            case 1
                                calcineurin_cur = calcium_cur && calmodulin_cur;
                                count_calcineurin = 0;
                        end
            
                    case 1
                        switch (rand < calcineurin_off_p) && (count_calcineurin > calcineurin_off_rt)
                            case 0
                                %calcineurin_cur = calcineurin_cur;
                            case 1
                                calcineurin_cur = calcium_cur && calmodulin_cur;
                                count_calcineurin = 0;
                        end  
                
                end  

            %% cytotoxicity
            
    	    %% fasl ruleset
	
	        case fasl_node            

                count_fasl = count_fasl + 1;
            
                switch fasl_cur
            
                    case 0
                        switch (rand < fasl_on_p) && (count_fasl > fasl_on_rt)
                            case 0
                                %fasl_cur = fasl_cur;
                            case 1
                                fasl_cur = cart_ct_cur;
                                count_fasl = 0;
                        end
            
                    case 1
                        switch (rand < fasl_off_p) && (count_fasl > fasl_off_rt)
                            case 0
                                %fasl_cur = fasl_cur;
                            case 1
                                fasl_cur = cart_ct_cur;
                                count_fasl = 0;
                        end  
                
                end

        	%% per_gzmb ruleset
	
	        case per_gzmb_node            

                count_per_gzmb = count_per_gzmb + 1;
            
                switch per_gzmb_cur
            
                    case 0
                        switch (rand < per_gzmb_on_p) && (count_per_gzmb > per_gzmb_on_rt)
                            case 0
                                %per_gzmb_cur = per_gzmb_cur;
                            case 1
                                per_gzmb_cur = cart_ct_cur & is_cur;
                                count_per_gzmb = 0;
                        end
            
                    case 1
                        switch (rand < per_gzmb_off_p) && (count_per_gzmb > per_gzmb_off_rt)
                            case 0
                                %per_gzmb_cur = per_gzmb_cur;
                            case 1
                                per_gzmb_cur = cart_ct_cur & is_cur;
                                count_per_gzmb = 0;
                        end  
                
                end

        	%% fas ruleset
	
	        case fas_node            

                count_fas = count_fas + 1;
            
                switch fas_cur
            
                    case 0
                        switch (rand < fas_on_p) && (count_fas > fas_on_rt)
                            case 0
                                %fas_cur = fas_cur;
                            case 1
                                fas_cur = fasl_cur & is_cur;
                                count_fas = 0;
                        end
            
                    case 1
                        switch (rand < fas_off_p) && (count_fas > fas_off_rt)
                            case 0
                                %fas_cur = fas_cur;
                            case 1
                                fas_cur = fasl_cur & is_cur;
                                count_fas = 0;
                        end  
                
                end

        	%% casp3_7 ruleset
	
	        case casp3_7_node            

                count_casp3_7 = count_casp3_7 + 1;
            
                switch casp3_7_cur
            
                    case 0
                        switch (rand < casp3_7_on_p) && (count_casp3_7 > casp3_7_on_rt)
                            case 0
                                %casp3_7_cur = casp3_7_cur;
                            case 1
                                casp3_7_cur = (fas_cur && is_cur) || per_gzmb_cur;
                                count_casp3_7 = 0;
                        end
            
                    case 1
                        switch (rand < casp3_7_off_p) && (count_casp3_7 > casp3_7_off_rt)
                            case 0
                                %casp3_7_cur = casp3_7_cur;
                            case 1
                                casp3_7_cur = (fas_cur && is_cur) || per_gzmb_cur;
                                count_casp3_7 = 0;
                        end  
                
                end

            %% tf

        	%% cfos ruleset
	
	        case cfos_node            

                count_cfos = count_cfos + 1;
            
                switch cfos_cur
            
                    case 0
                        switch (rand < cfos_on_p) && (count_cfos > cfos_on_rt)
                            case 0
                                %cfos_cur = cfos_cur;
                            case 1
                                cfos_cur = erk_cur || creb_cur;
                                count_cfos = 0;
                        end
            
                    case 1
                        switch (rand < cfos_off_p) && (count_cfos > cfos_off_rt)
                            case 0
                                %cfos_cur = cfos_cur;
                            case 1
                                cfos_cur = erk_cur || creb_cur;
                                count_cfos = 0;
                        end  
                
                end
    
        	%% cjun ruleset
	
	        case cjun_node            

                count_cjun = count_cjun + 1;
            
                switch cjun_cur
            
                    case 0
                        switch (rand < cjun_on_p) && (count_cjun > cjun_on_rt)
                            case 0
                                %cjun_cur = cjun_cur;
                            case 1
                                cjun_cur = pkc_theta_cur || wasp_cdc42_cur;
                                count_cjun = 0;
                        end
            
                    case 1
                        switch (rand < cjun_off_p) && (count_cjun > cjun_off_rt)
                            case 0
                                %cjun_cur = cjun_cur;
                            case 1
                                cjun_cur = pkc_theta_cur || wasp_cdc42_cur;
                                count_cjun = 0;
                        end  
                
                end

        	%% ap1 ruleset
	
	        case ap1_node            

                count_ap1 = count_ap1 + 1;
            
                switch ap1_cur
            
                    case 0
                        switch (rand < ap1_on_p) && (count_ap1 > ap1_on_rt)
                            case 0
                                %ap1_cur = ap1_cur;
                            case 1
                                ap1_cur = cfos_cur && cjun_cur && ~nfat_dimer_cur;
                                count_ap1 = 0;
                        end
            
                    case 1
                        switch (rand < ap1_off_p) && (count_ap1 > ap1_off_rt)
                            case 0
                                %ap1_cur = ap1_cur;
                            case 1
                                ap1_cur = cfos_cur && cjun_cur && ~nfat_dimer_cur;
                                count_ap1 = 0;
                        end  
                
                end
                
        	%% nfkb ruleset
	
	        case nfkb_node            

                count_nfkb = count_nfkb + 1;
            
                switch nfkb_cur
            
                    case 0
                        switch (rand < nfkb_on_p) && (count_nfkb > nfkb_on_rt)
                            case 0
                                %nfkb_cur = nfkb_cur;
                            case 1
                                nfkb_cur = pkc_theta_cur;
                                count_nfkb = 0;
                        end
            
                    case 1
                        switch (rand < nfkb_off_p) && (count_nfkb > nfkb_off_rt)
                            case 0
                                %nfkb_cur = nfkb_cur;
                            case 1
                                nfkb_cur = pkc_theta_cur;
                                count_nfkb = 0;
                        end  
                
                end
                
        	%% nfat ruleset
	
	        case nfat_node            

                count_nfat = count_nfat + 1;
            
                switch nfat_cur
            
                    case 0
                        switch (rand < nfat_on_p) && (count_nfat > nfat_on_rt)
                            case 0
                                %nfat_cur = nfat_cur;
                            case 1
                                nfat_cur = calcineurin_cur;
                                count_nfat = 0;
                        end
            
                    case 1
                        switch (rand < nfat_off_p) && (count_nfat > nfat_off_rt)
                            case 0
                                %nfat_cur = nfat_cur;
                            case 1
                                nfat_cur = calcineurin_cur;
                                count_nfat = 0;
                        end  
                
                end
                
        	%% nfat_dimer ruleset
	
	        case nfat_dimer_node            

                count_nfat_dimer = count_nfat_dimer + 1;
            
                switch nfat_dimer_cur
            
                    case 0
                        switch (rand < nfat_dimer_on_p) && (count_nfat_dimer > nfat_dimer_on_rt)
                            case 0
                                %nfat_dimer_cur = nfat_dimer_cur;
                            case 1
                                nfat_dimer_cur = calcineurin_cur && nfat_cur && ~ap1_cur;
                                count_nfat_dimer = 0;
                        end
            
                    case 1
                        switch (rand < nfat_dimer_off_p) && (count_nfat_dimer > nfat_dimer_off_rt)
                            case 0
                                %nfat_dimer_cur = nfat_dimer_cur;
                            case 1
                                nfat_dimer_cur = calcineurin_cur && nfat_cur && ~ap1_cur;
                                count_nfat_dimer = 0;
                        end  
                
                end
                
        	%% creb ruleset
	
	        case creb_node            

                count_creb = count_creb + 1;
            
                switch creb_cur
            
                    case 0
                        switch (rand < creb_on_p) && (count_creb > creb_on_rt)
                            case 0
                                %creb_cur = creb_cur;
                            case 1
                                creb_cur = calmodulin_cur || p38_cur;
                                count_creb = 0;
                        end
            
                    case 1
                        switch (rand < creb_off_p) && (count_creb > creb_off_rt)
                            case 0
                                %creb_cur = creb_cur;
                            case 1
                                creb_cur = calmodulin_cur || p38_cur;
                                count_creb = 0;
                        end  
                
                end
                
            %% batf ruleset
                
            case batf_node  
    
                count_batf = count_batf + 1;
            
                switch batf_cur
            
                    case 0
                        switch (rand < batf_on_p) && (count_batf > batf_on_rt)
                            case 0
                                %batf_cur = batf_cur;
                            case 1
                                batf_cur = pd1_cur;
                                count_batf = 0;
                        end
            
                    case 1
                        switch (rand < batf_off_p) && (count_batf > batf_off_rt)
                            case 0
                                %batf_cur = batf_cur;
                            case 1
                                batf_cur = pd1_cur;
                                count_batf = 0;
                        end  
                
                end

            %% stat5 ruleset
            
            case stat5_node  

                count_stat5 = count_stat5 + 1;
            
                switch stat5_cur
            
                    case 0
                        switch (rand < stat5_on_p) && (count_stat5 > stat5_on_rt)
                            case 0
                                %stat5_cur = stat5_cur;
                            case 1
                                stat5_cur = jak13_cur && il2_r_cur;
                                count_stat5 = 0;
                        end
            
                    case 1
                        switch (rand < stat5_off_p) && (count_stat5 > stat5_off_rt)
                            case 0
                                %stat5_cur = stat5_cur;
                            case 1
                                stat5_cur = jak13_cur && il2_r_cur;
                                count_stat5 = 0;
                        end  
                
                end

            %% gene expression
            
            %% il2_ge ruleset
    
            case il2_ge_node            

                count_il2_ge = count_il2_ge + 1;

                switch il2_ge_cur

                    case 0
                        switch (rand < il2_ge_on_p) && (count_il2_ge > il2_ge_on_rt)
                            case 0
                                %il2_ge_cur = il2_ge_cur;
                            case 1
                                il2_ge_cur = ap1_cur && nfat_cur && nfkb_cur;
                                count_il2_ge = 0;
                        end

                    case 1
                        switch (rand < il2_ge_off_p) && (count_il2_ge > il2_ge_off_rt)
                            case 0
                                %il2_ge_cur = il2_ge_cur;
                            case 1
                                il2_ge_cur = ap1_cur && nfat_cur && nfkb_cur;
                                count_il2_ge = 0;
                        end  

                end
                
            %% pdcd1_ge ruleset
    
            case pdcd1_ge_node            

                count_pdcd1_ge = count_pdcd1_ge + 1;
            
                switch pdcd1_ge_cur
            
                    case 0
                        switch (rand < pdcd1_ge_on_p) && (count_pdcd1_ge > pdcd1_ge_on_rt)
                            case 0
                                %pdcd1_ge_cur = pdcd1_ge_cur;
                            case 1
                                pdcd1_ge_cur = (ap1_cur && nfat_cur) || (stat5_cur && nfat_cur);
                                count_pdcd1_ge = 0;
                        end
            
                    case 1
                        switch (rand < pdcd1_ge_off_p) && (count_pdcd1_ge > pdcd1_ge_off_rt)
                            case 0
                                %pdcd1_ge_cur = pdcd1_ge_cur;
                            case 1
                                pdcd1_ge_cur = (ap1_cur && nfat_cur) || (stat5_cur && nfat_cur);
                                count_pdcd1_ge = 0;
                        end  
                
                end

            %% cellular response

        	%% cart_ct ruleset
	
	        case cart_ct_node            

                count_cart_ct = count_cart_ct + 1;
            
                switch cart_ct_cur
            
                    case 0
                        switch (rand < cart_ct_on_p) && (count_cart_ct > cart_ct_on_rt)
                            case 0
                                %cart_ct_cur = cart_ct_cur;
                            case 1
                                cart_ct_cur = wasp_cdc42_cur && pkc_theta_cur && ...
                                                calcium_cur && pi3k_cur;
                                count_cart_ct = 0;
                        end
            
                    case 1
                        switch (rand < cart_ct_off_p) && (count_cart_ct > cart_ct_off_rt)
                            case 0
                                %cart_ct_cur = cart_ct_cur;
                            case 1
                                cart_ct_cur = wasp_cdc42_cur && pkc_theta_cur && ...
                                                calcium_cur && pi3k_cur;
                                count_cart_ct = 0;
                        end  
                
                end

        	%% cart_func ruleset
	
	        case cart_func_node            

                count_cart_func = count_cart_func + 1;
            
                switch cart_func_cur
            
                    case 0
                        switch (rand < cart_func_on_p) && (count_cart_func > cart_func_on_rt)
                            case 0
                                %cart_func_cur = cart_func_cur;
                            case 1
                                cart_func_cur = (ap1_cur && nfat_cur && mtorc1_cur)...
                                                && ~(batf_cur || nfat_dimer_cur);
                                count_cart_func = 0;
                        end
            
                    case 1
                        switch (rand < cart_func_off_p) && (count_cart_func > cart_func_off_rt)
                            case 0
                                %cart_func_cur = cart_func_cur;
                            case 1
                                cart_func_cur = (ap1_cur && nfat_cur && mtorc1_cur)...
                                                &&  ~(batf_cur || nfat_dimer_cur);
                                count_cart_func = 0;
                        end  
                
                end
	        
            %% cart_dys ruleset
	
	        case cart_dys_node            

                count_cart_dys = count_cart_dys + 1;
            
                switch cart_dys_cur
            
                    case 0
                        switch (rand < cart_dys_on_p) && (count_cart_dys > cart_dys_on_rt)
                            case 0
                                %cart_dys_cur = cart_dys_cur;
                            case 1
                                cart_dys_cur = (batf_cur || nfat_dimer_cur);
                                count_cart_dys = 0;
                        end
            
                    case 1
                        switch (rand < cart_dys_off_p) && (count_cart_dys > cart_dys_off_rt)
                            case 0
                                %cart_dys_cur = cart_dys_cur;
                            case 1
                                cart_dys_cur = (batf_cur || nfat_dimer_cur);            
                                count_cart_dys = 0;
                        end  
                
                end
	        
            %% tumor_apop ruleset
	
	        case tumor_apop_node            

                count_tumor_apop = count_tumor_apop + 1;
            
                switch tumor_apop_cur
            
                    case 0
                        switch (rand < tumor_apop_on_p) && (count_tumor_apop > tumor_apop_on_rt)
                            case 0
                                %tumor_apop_cur = tumor_apop_cur;
                            case 1
                                tumor_apop_cur = casp3_7_cur;
                                %disp('apoptosis')
                                count_tumor_apop = 0;
                        end
            
                    case 1
                        switch (rand < tumor_apop_off_p) && (count_tumor_apop > tumor_apop_off_rt)
                            case 0
                                %tumor_apop_cur = tumor_apop_cur;
                            case 1
                                tumor_apop_cur = casp3_7_cur;
                                count_tumor_apop = 0;
                        end  
                
                end
        
        end

    end

    % record results of asynchrounous update

    %car ligation
    ta_ex_mat(i,j) = ta_ex_cur; %#ok<*SAGROW> 
    ta_mat(i,j) = ta_cur;
    is_mat(i,j) = is_cur;
    scFv_mat(i,j) = scFv_cur;
    cd28_mat(i,j) = cd28_cur;
    cd3_zeta_mat(i,j) = cd3_zeta_cur;
    lck_mat(i,j) = lck_cur;
    zap70_mat(i,j) = zap70_cur;
    
    %il2 signaling
    il2_ex_mat(i,j) = il2_ex_cur;
    il2_input_mat(i,j) = il2_cur;  
    il2_r_mat(i,j) = il2_r_cur;
    jak13_mat(i,j) = jak13_cur;

    %pd1 ligation
    pdl1_ex_mat(i,j) = pdl1_ex_cur;
    pdl1_mat(i,j) = pdl1_cur;
    pd1_mat(i,j) = pd1_cur;
    pd1_ex_mat(i,j) = pd1_ex_cur;
    cd8086_ex_mat(i,j) = cd8086_ex_cur;
    cd8086_mat(i,j) = cd8086_cur;
    ctla4_ex_mat(i,j) = ctla4_ex_cur;
    ctla4_mat(i,j) = ctla4_cur;
    shp2_mat(i,j) = shp2_cur;
    shp1_mat(i,j) = shp1_cur;

    %signaling intermediates
    lat_mat(i,j) = lat_cur;
    slp76_mat(i,j) = slp76_cur;
    plc_gamma1_mat(i,j) = plc_gamma1_cur;
    dag_mat(i,j) = dag_cur;
    ip3_mat(i,j) = ip3_cur;
    wasp_cdc42_mat(i,j) = wasp_cdc42_cur;
    p38_mat(i,j) = p38_cur;
    pkc_theta_mat(i,j) = pkc_theta_cur;

    %pi3k-akt
    pi3k_mat(i,j) = pi3k_cur;
    pdpk1_mat(i,j) = pdpk1_cur;
    akt_mat(i,j) = akt_cur;
    mtorc1_mat(i,j) = mtorc1_cur;

    %mapk
    rasgrp_mat(i,j) = rasgrp_cur;
    grb2_sos_mat(i,j) = grb2_sos_cur;
    erk_mat(i,j) = erk_cur;

    %cytotoxic
    fasl_mat(i,j) = fasl_cur;
    per_gzmb_mat(i,j) = per_gzmb_cur;
    fas_mat(i,j) = fas_cur;
    casp3_7_mat(i,j) = casp3_7_cur;

    %calcium
    calcium_mat(i,j) = calcium_cur;
    calmodulin_mat(i,j) = calmodulin_cur;
    calcineurin_mat(i,j) = calcineurin_cur;

    %transcription factors
    cfos_mat(i,j) = cfos_cur;
    cjun_mat(i,j) = cjun_cur;
    ap1_mat(i,j) = ap1_cur;
    nfkb_mat(i,j) = nfkb_cur;
    nfat_mat(i,j) = nfat_cur;
    nfat_dimer_mat(i,j) = nfat_dimer_cur;
    creb_mat(i,j) = creb_cur;
    batf_mat(i,j) = batf_cur;
    stat5_mat(i,j) = stat5_cur;
    
    %ge
    il2_ge_mat(i,j) = il2_ge_cur;
    pdcd1_ge_mat(i,j) = pdcd1_ge_cur;

    %cellular response
    cart_ct_mat(i,j) = cart_ct_cur;
    cart_func_mat(i,j) = cart_func_cur;
    cart_dys_mat(i,j) = cart_dys_cur;
    tumor_apop_mat(i,j) = tumor_apop_cur;

end    

end

%% Run Analysis

%car ligation
[ta_ex_mat_std, ta_ex_mat_mean] = std(ta_ex_mat,1);
[ta_mat_std, ta_mat_mean] = std(ta_mat,1);
[is_mat_std, is_mat_mean] = std(is_mat);
[scFv_mat_std, scFv_mat_mean] = std(scFv_mat);
[cd28_mat_std, cd28_mat_mean] = std(cd28_mat);
[cd3_zeta_mat_std, cd3_zeta_mat_mean] = std(cd3_zeta_mat);
[lck_mat_std, lck_mat_mean] = std(lck_mat);
[zap70_mat_std, zap70_mat_mean] = std(zap70_mat);

%il2 ligation
[il2_ex_mat_std, il2_ex_mat_mean] = std(il2_ex_mat);
[il2_input_mat_std, il2_input_mat_mean] = std(il2_input_mat);
[il2_r_mat_std, il2_r_mat_mean] = std(il2_r_mat);
[jak13_mat_std, jak13_mat_mean] = std(jak13_mat);

%inhibitory pathways
[pdl1_ex_mat_std, pdl1_ex_mat_mean] = std(pdl1_ex_mat);
[pdl1_mat_std, pdl1_mat_mean] = std(pdl1_mat);
[pd1_mat_std, pd1_mat_mean] = std(pd1_mat);
[pd1_ex_mat_std, pd1_ex_mat_mean] = std(pd1_ex_mat);
[cd8086_ex_mat_std, cd8086_ex_mat_mean] = std(cd8086_ex_mat);
[cd8086_mat_std, cd8086_mat_mean] = std(cd8086_mat);
[ctla4_ex_mat_std, ctla4_ex_mat_mean] = std(ctla4_ex_mat);
[ctla4_mat_std, ctla4_mat_mean] = std(ctla4_mat);
[shp2_mat_std, shp2_mat_mean] = std(shp2_mat);
[shp1_mat_std, shp1_mat_mean] = std(shp1_mat);

%signaling intermediates
[lat_mat_std, lat_mat_mean] = std(lat_mat);
[slp76_mat_std, slp76_mat_mean] = std(slp76_mat);
[plc_gamma1_mat_std, plc_gamma1_mat_mean] = std(plc_gamma1_mat);
[dag_mat_std, dag_mat_mean] = std(dag_mat);
[ip3_mat_std, ip3_mat_mean] = std(ip3_mat);
[wasp_cdc42_mat_std, wasp_cdc42_mat_mean] = std(wasp_cdc42_mat);
[p38_mat_std, p38_mat_mean] = std(p38_mat);
[pkc_theta_mat_std, pkc_theta_mat_mean] = std(pkc_theta_mat);

%pi3k-akt
[pi3k_mat_std, pi3k_mat_mean] = std(pi3k_mat);
[pdpk1_mat_std, pdpk1_mat_mean] = std(pdpk1_mat);
[akt_mat_std, akt_mat_mean] = std(akt_mat);
[mtorc1_mat_std, mtorc1_mat_mean] = std(mtorc1_mat);

%mapk
[rasgrp_mat_std, rasgrp_mat_mean] = std(rasgrp_mat);
[grb2_sos_mat_std, grb2_sos_mat_mean] = std(grb2_sos_mat);
[erk_mat_std, erk_mat_mean] = std(erk_mat);

%calcium
[calcium_mat_std, calcium_mat_mean] = std(calcium_mat);
[calmodulin_mat_std, calmodulin_mat_mean] = std(calmodulin_mat);
[calcineurin_mat_std, calcineurin_mat_mean] = std(calcineurin_mat);

%cytotoxic
[fasl_mat_std, fasl_mat_mean] = std(fasl_mat);
[per_gzmb_mat_std, per_gzmb_mat_mean] = std(per_gzmb_mat);
[fas_mat_std, fas_mat_mean] = std(fas_mat);
[casp3_7_mat_std, casp3_7_mat_mean] = std(casp3_7_mat);

%transcription factors
[cfos_mat_std, cfos_mat_mean] = std(cfos_mat);
[cjun_mat_std, cjun_mat_mean] = std(cjun_mat);
[ap1_mat_std, ap1_mat_mean] = std(ap1_mat);
[nfkb_mat_std, nfkb_mat_mean] = std(nfkb_mat);
[nfat_mat_std, nfat_mat_mean] = std(nfat_mat);
[nfat_dimer_mat_std, nfat_dimer_mat_mean] = std(nfat_dimer_mat);
[creb_mat_std, creb_mat_mean] = std(creb_mat);
[batf_mat_std, batf_mat_mean] = std(batf_mat);
[stat5_mat_std, stat5_mat_mean] = std(stat5_mat);

%gene expression
[il2_ge_mat_std, il2_ge_mat_mean] = std(il2_ge_mat,1);
[pdcd1_ge_mat_std, pdcd1_ge_mat_mean] = std(pdcd1_ge_mat,1);

%cellular responses
[cart_ct_mat_std, cart_ct_mat_mean] = std(cart_ct_mat,1);
[cart_func_mat_std, cart_func_mat_mean] = std(cart_func_mat,1);
[cart_dys_mat_std, cart_dys_mat_mean] = std(cart_dys_mat,1);
[tumor_apop_mat_std, tumor_apop_mat_mean] = std(tumor_apop_mat,1);

%sort steady states
[~,sort_func] = sort(sum(cart_func_mat,2));
cart_func_mat = cart_func_mat(sort_func,:);
[~,sort_dys] = sort(sum(cart_dys_mat,2));
cart_dys_mat = cart_dys_mat(sort_dys,:);
[~,sort_tum] = sort(sum(tumor_apop_mat,2));
tumor_apop_mat = tumor_apop_mat(sort_tum,:);

%% additional scripts
% run("network_plots.m");
% run("IEEE_figure2.m");
% run("IEEE_figure3.m");