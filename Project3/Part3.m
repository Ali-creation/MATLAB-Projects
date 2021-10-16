
miu1 = 0.5;
miu2 = 0.5;
landa = 0.5;
b1 = 0.2;
b2 = 0.8;

P1_1 = miu1 * ((1-landa)+(landa*(1-b1)));
P1_2 = landa * (1-miu1)* b1;
P1_3 = ((1-landa)+landa*(1-b1))*(1-miu1)+ b1*landa*miu1;

P2_1 = miu2 * ((1-landa)+(landa*(1-b2)));
P2_2 = landa * (1-miu2)* b2;
P2_3 = ((1-landa)+landa*(1-b2))*(1-miu2)+ b2*landa*miu2;

choose = zeros(2,360);
for i=1:360
    choose(1,i) = randsample([-1 1 0],1,true,[P1_1 P1_2 P1_3]);
    choose(2,i) = randsample([-1 1 0],1,true,[P2_1 P2_2 P2_3]);
end

X_t = zeros(2,361);
X_t(1,1) = 0;     %X(0) = 0
X_t(2,1) = 0;

for i=1:360
    if X_t(1,i) == 0
        new_P1_1 = 0;
        new_P1_2 = landa * b1;
        new_P1_3 = (1-landa) + landa * (1-b1);
        choose(1,i) = randsample([-1 1 0],1,true,[new_P1_1 new_P1_2 new_P1_3]);
    end
    if X_t(2,i) == 0
        new_P2_1 = 0;
        new_P2_2 = landa * b2;
        new_P2_3 = (1-landa) + landa *(1-b2);
        choose(2,i) = randsample([-1 1 0],1,true,[new_P2_1 new_P2_2 new_P2_3]);
    end
        
    X_t(1,i+1) = X_t(1,i) + choose(1,i);
    X_t(2,i+1) = X_t(2,i) + choose(2,i);
end

sum = 0;
for j=1:360
    sum = sum + X_t(1,j) + X_t(2,j);
end

time_average_queue_size = sum/360;