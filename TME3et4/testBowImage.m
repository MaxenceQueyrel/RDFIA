
%pathSav='/users/nfs/Etu4/3101314/M2/RDFIA/TME3et4/';
%patchmin='/users/nfs/Etu4/3101314/M2/RDFIA/TME3et4/patchmin';
%nomDico='/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/Descripteurs/dictionnaireVisuel';
%pathIm='/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/Scene/';
%pathDes='/users/nfs/Etu4/3101314/M2/RDFIA/TME1et2/Sifts/';

pathSav='C:\Users\Maxence\Documents\M2\RDFIA\TME3et4\';
patchmin='C:\Users\Maxence\Documents\M2\RDFIA\TME3et4\patchmin';
nomDico='C:\Users\Maxence\Documents\M2\RDFIA\TME1et2\Descripteurs\dictionnaireVisuel';
pathIm='C:\Users\Maxence\Documents\M2\RDFIA\TME1et2\Scene\';
pathDes='C:\Users\Maxence\Documents\M2\RDFIA\TME1et2\Sifts\';

load(nomDico);
% Ouverture d'une image aleatoire
[I, nomim, sifts]=randomImageDes(pathIm, pathDes);

% Calcul de matormClusters
matNormClusters=sum(bestCentres.^2,2);

% Calcul de patchmin
%patchmin = visuDico(nomDico, pathIm, pathDes);
%save(strcat(pathSav,'pathmin.mat'), 'patchmin');
load(patchmin);

% Calcul du BoW
[bow,nc]=computeBow(sifts, bestCentres, matNormClusters);
save(strcat(pathSav,'beau'),'bow')

visuBoW(I, patchmin, bow, nc, nomim);