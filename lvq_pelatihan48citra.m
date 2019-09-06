clc; clear; close all; warning off all;
% Data latih dan target latih
data_latih = [0.4353,	0.4135,	0.4196,	0.4028,	0.4146,	0.4098,	0.3950,	0.4116, 0.4301,	0.4122, 0.4166,	0.4025, 0.4108,	0.4100,	0.3953,	0.4103, 0.3514,	0.3528,	0.3588,	0.3809,	0.3914,	0.4070,	0.3852,	0.3877, 0.3516,	0.3520,	0.3588,	0.3801,	0.3911,	0.4060,	0.3859,	0.3857;...
0.2524,	0.2771,	0.2637,	0.2743,	0.2847,	0.2874,	0.2794,	0.2869, 0.2566,	0.2781,	0.2659,	0.2751,	0.2888,	0.2882,	0.2799, 0.2881, 0.3869,	0.3763,	0.3811,	0.3530,	0.3213,	0.3107,	0.3314,	0.3129, 0.3870,	0.3748,	0.3816,	0.3540,	0.3221,	0.3124,	0.3304,	0.3150;...
0.3123,	0.3094,	0.3167,	0.3229,	0.3007,	0.3029,	0.3256,	0.3015, 0.3133,	0.3097,	0.3175,	0.3224,	0.3004,	0.3018,	0.3248,	0.3015, 0.2616,	0.2709,	0.2600,	0.2661,	0.2872,	0.2823,	0.2834,	0.2994, 0.2614,	0.2732,	0.2596,	0.2659,	0.2868,	0.2816,	0.2837,	0.2992];

target_latih = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]; % 1 (matang), 2 (mentah)

% Merubah nilai target ke vector
T = ind2vec(target_latih);

% Membuat fungsi NN LVQ
net = newlvq(data_latih,2); % 2 adalah jumlah klasifikasi

% Memberikan nilai untuk memengaruhi proses pelatihan
net.performFcn = 'mse';         %Performansi jaringan & error goal dinyatakan dalam nilai MSE
net.trainParam.goal = 0.01;     %Besar nilai MSE
net.trainParam.epochs = 100;    %Jumlah Epoch (iterasi)
net.trainParam.lr = 0.05;        %Learning Rate

net.IW {1,1} = [0.4167,    0.2549,    0.3285;0.3800,    0.3394,0.1806];

% Proses Training
net = train(net,data_latih,T);

% Bobot Akhir
bobot_akhir = net.IW {1,1}