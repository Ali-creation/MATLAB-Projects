
miu1 = 0.1;
miu2 = 0.9;
landa = 0.5;

P1_1 = zeros(1,11);
P1_2 = zeros(1,11);
P1_3 = zeros(1,11);
P2_1 = zeros(1,11);
P2_2 = zeros(1,11);
P2_3 = zeros(1,11);

x = 1;
for b1=0:0.1:1
    b2 = 1-b1;
    P1_1(1,x) = miu1 * ((1-landa)+(landa*(1-b1)));
    P1_2(1,x) = landa * (1-miu1)* b1;
    P1_3(1,x) = ((1-landa)+landa*(1-b1))*(1-miu1)+ b1*landa*miu1;

    P2_1(1,x) = miu2 * ((1-landa)+(landa*(1-b2)));
    P2_2(1,x) = landa * (1-miu2)* b2;
    P2_3(1,x) = ((1-landa)+landa*(1-b2))*(1-miu2)+ b2*landa*miu2;
    x = x+1;
end

choose1 = zeros(11,360);
choose2 = zeros(11,360);
for x=1:11
    for i=1:360
        choose1(x,i) = randsample([-1 1 0],1,true,[P1_1(1,x) P1_2(1,x) P1_3(1,x)]);
        choose2(x,i) = randsample([-1 1 0],1,true,[P2_1(1,x) P2_2(1,x) P2_3(1,x)]);
    end
end


X_t1 = zeros(11,361);
X_t2 = zeros(11,361);

for x=1:11
    X_t1(x,1) = 0;
    X_t2(x,1) = 0;
    b1 = (x-1)*0.1;
    b2 = 1-b1;
    for i=1:360
        if X_t1(x,i) == 0
            new_P1_1 = 0;
            new_P1_2 = landa*b1;
            new_P1_3 = (1-landa) + landa*(1-b1);
            choose1(x,i) = randsample([-1 1 0],1,true,[new_P1_1 new_P1_2 new_P1_3]);
        end
        if X_t2(x,i) == 0
            new_P2_1 = 0;
            new_P2_2 = landa*b2;
            new_P2_3 = (1-landa) + landa*(1-b2);
            choose2(x,i) = randsample([-1 1 0],1,true,[new_P2_1 new_P2_2 new_P2_3]);
        end
        X_t1(x,i+1) = X_t1(x,i) + choose1(x,i);
        X_t2(x,i+1) = X_t2(x,i) + choose2(x,i);
    end
end


sum = zeros(11,1);
time_average_queue_size = zeros(11,1);
for x=1:11
    for j=1:360
        sum(x,1) = sum(x,1) + X_t1(x,j) + X_t2(x,j);
    end
    time_average_queue_size(x,1) = sum(x,1)/360;
end
