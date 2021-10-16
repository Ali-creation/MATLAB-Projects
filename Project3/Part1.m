
miu = 0.7;
landa = 0.5;

P_1 = miu * (1-landa);
P_2 = landa * (1-miu);
P_3 = (1-landa)*(1-miu)+ landa*miu;

choose = zeros(1,360);
for i=1:360
    choose(1,i) = randsample([-1 1 0],1,true,[P_1 P_2 P_3]);
end

X_t = zeros(1,361);
X_t(1,1) = 0;     %X(0) = 0

for i=1:360
    if X_t(1,i) == 0
        new_P1_1 = 0;
        new_P1_2 = landa;
        new_P1_3 = (1-landa);
        choose(1,i) = randsample([-1 1 0],1,true,[new_P1_1 new_P1_2 new_P1_3]);
    end
    X_t(1,i+1) = X_t(1,i) + choose(1,i);
end

sum = 0;
for j=1:360
    sum = sum + X_t(1,j);
end

time_average_queue_size = sum/360;
