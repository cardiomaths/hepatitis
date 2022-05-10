function p=liver_finalModel_baselineParams()

% Parameters - Inflammatory component
p.nu=0.1;
p.gammaM=0.01;
p.gammaA=1;
p.gammaG=1;
p.phi=0.1;
p.kg=0.1;
p.kn=0.01;
p.betaA=0.1;
p.betaN=0.1;
p.betaC=0.12;
p.betaG=0.01;

p.km1=30;
p.km2=0.3;
p.phi2=10;
p.kh=0.1;
p.gammaM2=0.01;

% Parameters - hepatocytes, stellate cells and ECM
p.nu2=0.01;
p.chiH=1;
p.gammaH=0.1;
p.gammaE=0.1;
p.km=0.0001;
p.r1=1;
p.r2=1;

end