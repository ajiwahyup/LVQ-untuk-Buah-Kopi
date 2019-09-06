clc; clear; close all; warning off all;
% Data latih dan target latih
data_latih = [151.436, 125.626, 137.888, 142.886, 134.606, 127.808, 146.566, 136.047, 122.61,  129.617, 115.531, 116.46,  131.493, 125.158, 114.709, 129.893;...
87.7992, 84.2045, 86.6625, 97.3188, 92.4286, 89.6326, 103.691, 94.8274, 134.982, 138.273, 122.718, 107.925, 107.948, 95.5377, 98.685,  104.846;...
108.648, 93.9942, 104.052, 114.559, 97.6189, 94.4606, 120.838, 99.66, 91.2794, 99.5434, 83.7302, 81.3734, 96.4894, 86.829,  84.3805, 100.337];
    
target_latih = [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0;...
                0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1]; % 1 0 (matang), 0 1 (mentah)

% Membuat fungsi NN LVQ
net = newlvq(data_latih,2); % 2 adalah jumlah klasifikasi

% Memberikan nilai untuk memengaruhi proses pelatihan
net.performFcn = 'mse';         %Performansi jaringan & error goal dinyatakan dalam nilai MSE
net.trainParam.goal = 0.01;     %Besar nilai MSE
net.trainParam.epochs = 100;    %Jumlah Epoch (iterasi)
net.trainParam.lr = 0.05;        %Learning Rate

net.IW {1,1} = [0.4167, 0.2549, 0.3285;...
                0.3800, 0.3394, 0.1806];        % Bobot Awal

% Proses Training
net = train(net,data_latih,target_latih);

% Bobot Akhir
bobot_akhir = net.IW {1,1}
alpha = net.trainParam.lr