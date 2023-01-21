clear
close all
clc 


tile = {};
dd = 'photos';
imgtype = 'jpg';
l = dir([dd '/*.' imgtype]);

n = size(l,1);
for i = 1:n
    imgname = l(i).name;
    tile{i} = imread([dd '/' imgname],imgtype);
end


% Part 1. Find the average RGB values for all tiles
tileAvg = zeros(length(tile),3);
for i=1:length(tile)
        c = tile{i};
        [tileAvg(i,1), tileAvg(i,2), tileAvg(i,3)] = AvgRGB(c);
end



% Part 2. Determine some basic information about the mosaic
[theight,twidth,tcol] = size(tile{1});

% Read target image
target = imread('https://courtauld.ac.uk/wp-content/uploads/2022/01/Vincent-van-Gogh-1853-1890-Self-Portrait-September-1889-National-Gallery-of-Art-Washington-DC-2.jpg');
numTiles = 60;
tic

gridImg = Grid(target,numTiles,theight,twidth);
gridAvg = GridAvgs(gridImg);


% Part 3. Find best tile (based on avgRGB)
[grow, gcol, gcolor] = size(gridAvg);
[trow, tcol, tcolor] = size(tileAvg);
mos = {}; 

for i = 1:grow
    for j = 1:gcol
        red = gridAvg(i,j,1);
        green = gridAvg(i,j,2);
        blue = gridAvg(i,j,3);
      
        for m = 1:trow
            r = abs(tileAvg(m,1)-red);
            g = abs(tileAvg(m,2)-green);
            b = abs(tileAvg(m,3)-blue);
            hold(m) = r+g+b;
        end

        %Find the 20 nearest neighbors in pixel average 
        %randomly select one of them and record its position
        indexs = zeros(1,20);
        for s = 1:20
            [placeholder, index] = min(hold);
            indexs(s) = index;
            hold(index) = 9999;
        end
        k = randsample(20,1);
        iii = indexs(k);
        selectTiles(i,j) = iii;
    end
end


% Part 4. Assembing - Put the mosaics pieces together
[r, c] = size(selectTiles);
mos = {};
for i = 1:r
    for j = 1:c
        mos{i,j} = tile{selectTiles(i,j)};
    end
end

mosaic = cell2mat(mos);

% Part 5. Display
figure; 
montage({target, mosaic}, 'Size', [1,2]);

%% Second Image (by Nora)

target = imread('https://drive.google.com/uc?id=1VbDhKmR99yVUvmfD26uYtPDbPFxknWOp', 'JPG');
numTiles = 60;
tic
gridImg = Grid(target,numTiles,theight,twidth);
gridAvg = GridAvgs(gridImg);
[grow, gcol, gcolor] = size(gridAvg);
[trow, tcol, tcolor] = size(tileAvg);

selectTiles = zeros(grow,gcol);
for i = 1:grow
    for j = 1:gcol
        red = gridAvg(i,j,1);
        green = gridAvg(i,j,2);
        blue = gridAvg(i,j,3);
        for m = 1:trow
            r = abs(tileAvg(m,1)-red);
            g = abs(tileAvg(m,2)-green);
            b = abs(tileAvg(m,3)-blue);
            hold(m) = r+g+b;
        end
        indexs = zeros(1,20);
        for s = 1:20
            [placeholder, index] = min(hold);
            indexs(s) = index;
            hold(index) = 9999;
        end
        k = randsample(20,1);
        iii = indexs(k);
        selectTiles(i,j) = iii;
    end
end
[r, c] = size(selectTiles);
mos = {};
for i = 1:r
    for j = 1:c
        mos{i,j} = tile{selectTiles(i,j)};
    end
end
mosaic = cell2mat(mos);
figure; 
montage({target, mosaic}, 'Size', [1,2]);

%% Third Image
target = imread('https://cdn.vox-cdn.com/thumbor/_uOGMmZS6g9DxTmS7KynYmyVj4c=/0x0:7808x5506/1400x1050/filters:focal(3246x2374:4494x3622):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/68672382/shutterstock_149489132.0.0.jpg');
numTiles = 60;
tic
gridImg = Grid(target,numTiles,theight,twidth);
gridAvg = GridAvgs(gridImg);
[grow, gcol, gcolor] = size(gridAvg);
[trow, tcol, tcolor] = size(tileAvg);
selectTiles = zeros(grow,gcol);
for i = 1:grow
    for j = 1:gcol
        red = gridAvg(i,j,1);
        green = gridAvg(i,j,2);
        blue = gridAvg(i,j,3);
        for m = 1:trow
            r = abs(tileAvg(m,1)-red);
            g = abs(tileAvg(m,2)-green);
            b = abs(tileAvg(m,3)-blue);
            hold(m) = r+g+b;
        end
        indexs = zeros(1,20);
        for s = 1:20
            [placeholder, index] = min(hold);
            indexs(s) = index;
            hold(index) = 9999;
        end
        k = randsample(20,1);
        iii = indexs(k);
        selectTiles(i,j) = iii;
    end
end
[r, c] = size(selectTiles);
mos = {};
for i = 1:r
    for j = 1:c
        mos{i,j} = tile{selectTiles(i,j)};
    end
end
mosaic = cell2mat(mos);
figure; 
montage({target, mosaic}, 'Size', [1,2]);

%% 4th Image
target = imread('https://www.unc.edu/wp-content/uploads/2021/07/020419_old_well_summer004-scaled-e1625573140177.jpg');
numTiles = 25;
tic
gridImg = Grid(target,numTiles,theight,twidth);
gridAvg = GridAvgs(gridImg);
[grow, gcol, gcolor] = size(gridAvg);
[trow, tcol, tcolor] = size(tileAvg);
selectTiles = zeros(grow,gcol);
for i = 1:grow
    for j = 1:gcol
        red = gridAvg(i,j,1);
        green = gridAvg(i,j,2);
        blue = gridAvg(i,j,3);
        for m = 1:trow
            r = abs(tileAvg(m,1)-red);
            g = abs(tileAvg(m,2)-green);
            b = abs(tileAvg(m,3)-blue);
            hold(m) = r+g+b;
        end
        indexs = zeros(1,20);
        for s = 1:20
            [placeholder, index] = min(hold);
            indexs(s) = index;
            hold(index) = 9999;
        end
        k = randsample(20,1);
        iii = indexs(k);
        selectTiles(i,j) = iii;
    end
end
[r, c] = size(selectTiles);
mos = {};
for i = 1:r
    for j = 1:c
        mos{i,j} = tile{selectTiles(i,j)};
    end
end
mosaic1 = cell2mat(mos);

numTiles = 60;
tic
gridImg = Grid(target,numTiles,theight,twidth);
gridAvg = GridAvgs(gridImg);
[grow, gcol, gcolor] = size(gridAvg);
[trow, tcol, tcolor] = size(tileAvg);
selectTiles = zeros(grow,gcol);
for i = 1:grow
    for j = 1:gcol
        red = gridAvg(i,j,1);
        green = gridAvg(i,j,2);
        blue = gridAvg(i,j,3);
        for m = 1:trow
            r = abs(tileAvg(m,1)-red);
            g = abs(tileAvg(m,2)-green);
            b = abs(tileAvg(m,3)-blue);
            hold(m) = r+g+b;
        end
        indexs = zeros(1,20);
        for s = 1:20
            [placeholder, index] = min(hold);
            indexs(s) = index;
            hold(index) = 9999;
        end
        k = randsample(20,1);
        iii = indexs(k);
        selectTiles(i,j) = iii;
    end
end
[r, c] = size(selectTiles);
mos = {};
for i = 1:r
    for j = 1:c
        mos{i,j} = tile{selectTiles(i,j)};
    end
end
mosaic2 = cell2mat(mos);


numTiles = 100;
tic
gridImg = Grid(target,numTiles,theight,twidth);
gridAvg = GridAvgs(gridImg);
[grow, gcol, gcolor] = size(gridAvg);
[trow, tcol, tcolor] = size(tileAvg);
selectTiles = zeros(grow,gcol);
for i = 1:grow
    for j = 1:gcol
        red = gridAvg(i,j,1);
        green = gridAvg(i,j,2);
        blue = gridAvg(i,j,3);
        for m = 1:trow
            r = abs(tileAvg(m,1)-red);
            g = abs(tileAvg(m,2)-green);
            b = abs(tileAvg(m,3)-blue);
            hold(m) = r+g+b;
        end
        indexs = zeros(1,20);
        for s = 1:20
            [placeholder, index] = min(hold);
            indexs(s) = index;
            hold(index) = 9999;
        end
        k = randsample(20,1);
        iii = indexs(k);
        selectTiles(i,j) = iii;
    end
end
[r, c] = size(selectTiles);
mos = {};
for i = 1:r
    for j = 1:c
        mos{i,j} = tile{selectTiles(i,j)};
    end
end
mosaic3 = cell2mat(mos);


numTiles = 500;
tic
gridImg = Grid(target,numTiles,theight,twidth);
gridAvg = GridAvgs(gridImg);
[grow, gcol, gcolor] = size(gridAvg);
[trow, tcol, tcolor] = size(tileAvg);
selectTiles = zeros(grow,gcol);
for i = 1:grow
    for j = 1:gcol
        red = gridAvg(i,j,1);
        green = gridAvg(i,j,2);
        blue = gridAvg(i,j,3);
        for m = 1:trow
            r = abs(tileAvg(m,1)-red);
            g = abs(tileAvg(m,2)-green);
            b = abs(tileAvg(m,3)-blue);
            hold(m) = r+g+b;
        end
        indexs = zeros(1,20);
        for s = 1:20
            [placeholder, index] = min(hold);
            indexs(s) = index;
            hold(index) = 9999;
        end
        k = randsample(20,1);
        iii = indexs(k);
        selectTiles(i,j) = iii;
    end
end
[r, c] = size(selectTiles);
mos = {};
for i = 1:r
    for j = 1:c
        mos{i,j} = tile{selectTiles(i,j)};
    end
end
mosaic4 = cell2mat(mos);

figure; montage({target, mosaic1, mosaic2, mosaic3, mosaic4}, 'Size', [1,5]);


%% 5th Image
target = imread('https://npg.si.edu/exhibit/feature/images/schoeller_full.jpg');
numTiles = 60;
tic
gridImg = Grid(target,numTiles,theight,twidth);
gridAvg = GridAvgs(gridImg);
[grow, gcol, gcolor] = size(gridAvg);
[trow, tcol, tcolor] = size(tileAvg);
selectTiles = zeros(grow,gcol);
for i = 1:grow
    for j = 1:gcol
        red = gridAvg(i,j,1);
        green = gridAvg(i,j,2);
        blue = gridAvg(i,j,3);
        for m = 1:trow
            r = abs(tileAvg(m,1)-red);
            g = abs(tileAvg(m,2)-green);
            b = abs(tileAvg(m,3)-blue);
            hold(m) = r+g+b;
        end
        indexs = zeros(1,20);
        for s = 1:20
            [placeholder, index] = min(hold);
            indexs(s) = index;
            hold(index) = 9999;
        end
        k = randsample(20,1);
        iii = indexs(k);
        selectTiles(i,j) = iii;
    end
end
[r, c] = size(selectTiles);
mos = {};
for i = 1:r
    for j = 1:c
        mos{i,j} = tile{selectTiles(i,j)};
    end
end
mosaic = cell2mat(mos);
figure; 
montage({target, mosaic}, 'Size', [1,2]);


%% Grid
function [imga] = Grid(img, cross, theight, twidth)
[h, w, c] = size(img);
cwidth = floor(w / cross);
cheight = round(cwidth * (theight / twidth));
td = floor(h / cheight);

for i=1:td
    for j=1:cross
        imga{i,j} = img((1+(i-1)*cheight):(i*cheight),(1+(j-1)*cwidth):(j*cwidth),1:3);
    end
end

end

%% AvgRGB

function [rgb g b] = AvgRGB(img)

[h, w, rgb] = size(img);
red = 0;
green = 0;
blue = 0;

for i = 1:h
    for j = 1:w
        red = red + double(img(i,j,1));
        green = green + double(img(i,j,2));
        blue = blue + double(img(i,j,3));
    end
end

rgb = round(red / (h*w));
b = round(blue / (h*w));
g = round(green / (h*w));

end

%% GridAvgs

function [arr] = GridAvgs(cell)

[r, c] = size(cell);
for i = 1:r
    for j = 1:c
        [arr(i,j,1),arr(i,j,2),arr(i,j,3)] = AvgRGB(cell...
            {i,j});
    end
end

end

