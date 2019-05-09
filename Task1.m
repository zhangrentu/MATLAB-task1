%% The code for matlab task 1 and task 2
clc
clear
close all
%% Impz solve Unit impulse response
a=[1,-0.4,0.75];
b=[2.2321,2.4908,2.2403];
N=input('请输入序列长度：');
n=0:N-1;
figure(1);
h= impz(b,a,N);
stem(n,h,'LineWidth',1,'Marker','p','Color','b');
title('Impulse Response(Impz)');
xlabel('n');ylabel('h(n)')

%% Filter solve Unit impulse response
figure(2);
x1=[1 zeros(1,N-1)]; %单位脉冲信号 
y1filter=filter(b,a,x1);
stem(n,y1filter,'LineWidth',1,'Marker','p','Color','r');
title('Impulse Response(Filter)');
xlabel('n');ylabel('h(n)')

%% Conv solve Step response
figure(3)
x2=ones(1,N);%单位阶跃信号
[h]=impz(b,a,N);
y1=conv(h,x2);%其序列长度为h+x-1
y1conv=y1(1:N);%统一长度，画图美观                         
stem(n,y1conv,'LineWidth',1,'Marker','h','Color','b');
title('Step response(Conv)');
xlabel('n');ylabel('h(n)')

%% Filter solve Step response
figure(4)
x4=ones(1,N);%单位阶跃信号
y4filter=filter(b,a,x4);
stem(n,y4filter,'LineWidth',1,'Marker','h','Color','r');
title('Step response(Filter)');
xlabel('n');ylabel('h(n)')

%% ========================================end of task 1============================================= %%
%% The code for task 2 
clc
clear
close all
B=[1 -1.8 -1.44 0.64];
A=[1 -1.63304 -1.03882 0.2321];
N=1024;
%% Plot the pole-zero plot
zplane(B, A)
grid on
title('The pole-zero plot')


%% Draw the frequency response of the system
[H,w] = freqz(B,A,N,'whole');
figure(5)
plot(w,abs(H),'LineWidth',2, 'MarkerSize',10, 'MarkerEdgeColor','b');
title('Amplitude response');
xlabel('Frequency');ylabel('Amplitude');
grid on;
figure(6)
plot(w,angle(H),'LineWidth',2, 'MarkerSize',10, 'MarkerEdgeColor','b');
title('Phase response');
xlabel('Frequency');ylabel('Phase');
grid on;

%% Root 
B=[1 -1.8 -1.44 0.64];
b=roots(B);% Zero point
A=[1 -1.63304 -1.03882 0.2321];
a=roots(A);% pole
%% compare pole-zero 
A1=poly(a);
B1=poly(b);
