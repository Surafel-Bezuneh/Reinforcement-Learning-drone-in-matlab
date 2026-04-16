% Quadcopter project using Reinforcement Learning in MATLAB/Simulink
% Engr M Mudassir
% mrengineer294@gmail.com

clear;clc;
load("squaretrajectory.mat");
%Initialize Q first
%Q_lastiter = randi(5,[50,50,3,7,7,7]);
Q_lastiter = zeros(50,50,3,7,7,7);
%Q_lastiter = Q_matrix;
% Data Repositories
Rew_data = zeros(2,500);
avg_Reward = zeros(2,500);
early_Reward = zeros(2,500);
mid_Reward = zeros(2,500);
late_Reward = zeros(2,500);
cumulativeReward=avg_Reward+early_Reward+mid_Reward+late_Reward;
ep_r = 1;
%Run the iteration
for i= 1:500
display = ["Episode Number: ", i];
disp(display)
sim('model_RL_prev');
disp("Sim ended")
Q_lastiter = Q_matrix;
% Get Cumulative Reward
Rew_data(1,i) = cumulativeReward(1,i);
Rew_data(2,i) = ep_r;
% Get Running Average Reward per Episode
avgRew = 0;
for i = 1:i
    avgRew = avgRew + Rew_data(1,i);
end
avgRew = avgRew/i;
avg_Reward(1,i) = avgRew;
avg_Reward(2,i) = ep_r;
ep_r = ep_r +1;
% Get Reward For Episodes in Early Training Stage, Mid Training Stage, Late
% Training State
end
% plot(R)