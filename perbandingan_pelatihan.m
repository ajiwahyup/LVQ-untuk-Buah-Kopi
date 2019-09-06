clc; clear; close all; warning off all;
% Data latih dan target latih
data_latih = [0.4353,	0.4135,	0.4196,	0.4028,	0.4146,	0.4098,	0.3950,	0.4116, 0.4031,	0.3985, 0.3514,	0.3528,	0.3588,	0.3809,	0.3914,	0.4070,	0.3852,	0.3877, 0.3968,	0.3919;...
0.2524,	0.2771,	0.2637,	0.2743,	0.2847,	0.2874,	0.2794,	0.2869, 0.2715,	0.2834, 0.3869,	0.3763,	0.3811,	0.3530,	0.3213,	0.3107,	0.3314,	0.3129, 0.2935,	0.3095;...
0.3123,	0.3094,	0.3167,	0.3229,	0.3007,	0.3029,	0.3256,	0.3015, 0.3254,	0.3181, 0.2616,	0.2709,	0.2600,	0.2661,	0.2872,	0.2823,	0.2834,	0.2994, 0.3098,	0.2985];

target_latih = [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2]; % 1 (matang), 2 (mentah)

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

% Proses Pengujian
%data_uji = [0.391429296,0.408357036;...
%0.321340373,0.277029772;...
%0.287230331,0.314613193];
%hasil_uji = round(sim(net,data_uji))

% Merubah Hasil Uji dari Vector ke Nilai Sesungguhnya
%hasil_ujic = vec2ind(hasil_uji)
