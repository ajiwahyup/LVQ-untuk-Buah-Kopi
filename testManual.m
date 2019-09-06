clc; clear; close all; warning off all;
% Data latih dan target latih
data_latih = [151.436, 125.626, 122.61,  129.617;...
87.7992, 84.2045, 134.982, 138.273;...
108.648, 93.9942, 91.2794, 99.5434];
    
target_latih = [1,1,0,0;...
                0,0,1,1]; % 1 0 (matang), 0 1 (mentah)

% Membuat fungsi NN LVQ
net = newlvq(data_latih,2); % 2 adalah jumlah klasifikasi

% Memberikan nilai untuk memengaruhi proses pelatihan
net.performFcn = 'mse';         %Performansi jaringan & error goal dinyatakan dalam nilai MSE
net.trainParam.goal = 0.01;     %Besar nilai MSE
net.trainParam.epochs = 1;    %Jumlah Epoch (iterasi)
net.trainParam.lr = 0.05;        %Learning Rate

net.IW {1,1} = [0.4167, 0.2549, 0.3285;...
                0.3800, 0.3394, 0.1806];        % Bobot Awal

% Proses Training
net = train(net,data_latih,target_latih);

% Bobot Akhir
bobot_akhir = net.IW {1,1}