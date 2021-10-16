
miu = 0.7;
P_1 = zeros(1,8);
P_2 = zeros(1,8);
P_3 = zeros(1,8);

x=1;
for landa = 0.1:0.1:0.8
    P_1(1,x) = miu * (1-landa);
    P_2(1,x) = landa * (1-miu);
    P_3(1,x) = (1-landa)*(1-miu)+ landa*miu;
    x = x+1;
end

choose = zeros(8,360);
for x=1:8
    for i=1:360
        choose(x,i) = randsample([-1 1 0],1,true,[P_1(1,x) P_2(1,x) P_3(1,x)]);
    end
end


X_t = zeros(8,361);


for x=1:8
    X_t(x,1) = 0;     %X(0) = 0
    for i=1:360
        if X_t(x,i) == 0
            new_P1_1 = 0;
            new_P1_2 = landa;
            new_P1_3 = (1-landa);
            choose(x,i) = randsample([-1 1 0],1,true,[new_P1_1 new_P1_2 new_P1_3]);
        end
        X_t(x,i+1) = X_t(x,i) + choose(x,i);
    end
end

sum = zeros(8,1);
time_average_queue_size = zeros(8,1);
for x=1:8
    sum(x,1)=0;
    for j=1:360
        sum(x,1) = sum(x,1) + X_t(x,j);
    end
    time_average_queue_size(x,1) = sum(x,1)/360;
end

l = 0.1:0.1:0.8;
plot(l,time_average_queue_size,'-*b','LineWidth',1)
% Plot section
xlabel('landa')
ylabel('time average queue size')
title('P1-PartC')
legend('time-average queue size vs. demand landa');


