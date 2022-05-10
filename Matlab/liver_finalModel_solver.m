close all

plotsOn=1;

% Parameters
p=liver_finalModel_baselineParams();
p.phi=0.1;
p.nu2=0.5;
%p.phi=0.045;
% Initial conditions;
n0 = 0;
a0 = 0;
m10 = 0;
m20 = 0;
c0 = 1;
g0 = 0;
h0 = 1;
ha0 = 0;
e0 = 0;
s0 = 1;
sa0 = 0;

ICs=[n0,a0,m10,m20,c0,g0,h0,ha0,e0,s0,sa0];

% Integration range
tspan=[0 1000];

% Call ODE solver
sol = ode45(@(t,y)liver_finalModelODEs(t,y,p),tspan,ICs);
t=sol.x;
y=sol.y;

% Check for steady state
normRHS=norm(liver_finalModelODEs(0,sol.y(:,end),p));

% Check the norm of the solution (to check its between Norm Min and Norm
% Max in auto
normSol=norm(sol.y(:,end),2);

if(plotsOn)
    % Plot solution
    figure(1);

    subplot(2,4,1);
    plot(t,y(1,:),'c');
    hold on
    plot(t,y(2,:),'b');
    xlabel('t')
    ylabel('Neutrophils');

    subplot(2,4,2);
    plot(t,y(3,:),'r');
    hold on
    plot(t,y(4,:),'r--');
    xlabel('t')
    ylabel('Macrophages');

    subplot(2,4,3);
    plot(t,y(5,:),'b');
    xlabel('t')
    ylabel('Pro mediators');

    subplot(2,4,4);
    plot(t,y(6,:),'b');
    xlabel('t')
    ylabel('Anti mediators');

    subplot(2,4,5);
    plot(t,y(7,:),'g');
    hold on
    plot(t,y(8,:),'g--');
    xlabel('t')
    ylabel('Hepatocytes');

    subplot(2,4,6);
    plot(t,y(10,:),'k');
    hold on
    plot(t,y(11,:),'k--');
    xlabel('t')
    ylabel('Stellate cells');

    subplot(2,4,7);
    plot(t,y(9,:),'m');
    xlabel('t')
    ylabel('ECM');
end
