%x1 = [91 72 54 42 24];
%x2 = [97 80 61 30 18];

s0 = zeros(360,1);
for i=1:180
    s0(i,1) = 200;
end
for i=181:360
    s0(i,1) = 10;
end

S1 = zeros(1,180) +1; %to construct H
S2 = zeros(1,360); %to construct H
sH = diag(S2);
sH(181:360, 181:360) = diag(S1);
S3 = zeros(190,360); %Aeq
s4 = zeros(190,1); %beq
%initial values of x
for i=1:1:10
    S3(i,i) = 1;
end
s4(1,1) = 91;
s4(2,1) = 72;
s4(3,1) = 54;
s4(4,1) = 42;
s4(5,1) = 24;
s4(6,1) = 97;
s4(7,1) = 80;
s4(8,1) = 61;
s4(9,1) = 30;
s4(10,1) = 18;

%initial values of v
for i=11:1:20
    S3(i, i+170) = 1;
end

%linking v(t) to x(t)
for i=21:1:190
    S3(i,i-20) = 1;
    S3(i, i-10) = -1;
    S3(i, i+160) = 1;
end

s5 = zeros(620,360); %A
s6 = zeros(620,1); %b
%x_(i+1)^k (t)- x_i^k (t)≤-6
for i=1:1:180
    if mod(i,5) == 0
        continue;
    end
    s5(i, i) = -1;
    s5(i,i+1) = 1;
end
for i=1:180
    if mod(i,5) == 0
        continue;
    end
    s6(i,1) = -6;
end
%v_i^k (t-1)- v_i^k (t)≤5
for i=181:350
    s5(i,i) = 1;
    s5(i,i+10) = -1;
    s6(i,1) = 5;
end
%v_i^k (t)- v_i^k (t-1)≤5
for i =351:520
    s5(i,i-170) = -1;
    s5(i,i-160) = 1;
    s6(i,1) = 5;
end
%-x(T) < -100
for i=521:530
    s5(i, i-350) = -1;
    s6(i,1) = -100;
end
%x_i^1 (t)+ x_j^2 (t)  ≤194
for i = 531:620
    s5(i,i-530) = 1;
    s5(i,i-525) = 1;
    s6(i,1) = 194;
end



H = 2*sH;
f = zeros(360,1);
Aeq = S3;
beq = s4;
A = s5;
b = s6;
lb = zeros(360,1);
ub = s0;

[x,fval] = quadprog(H,f,A,b,Aeq,beq,lb,ub);


