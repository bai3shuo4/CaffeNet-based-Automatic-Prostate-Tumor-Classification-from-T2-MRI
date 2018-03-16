function im_after_aug = image_augmentation(im_orig,n,im_size)

switch n
    case 1
        % salt and pepper noise
        d = rand(1)/20;
        im_saltpepper = imnoise(im_orig,'salt & pepper',d);
        im_after_aug = im_saltpepper;
        
    case 2
        % speckle noise
        d = rand(1)/20;
        im_speckle = imnoise(im_orig,'speckle',d);
        im_after_aug = im_speckle;
        
    case 3
        % Poisson noise
        im_poisson = imnoise(im_orig,'poisson');
        im_after_aug = im_poisson;
        
    case 4
        % Gaussian noise
        d = rand(1)/50;
        im_gauss = imnoise(im_orig,'gaussian',0,d);
        im_after_aug = im_gauss;

    case 5
        % Gaussian blur
        sigma = randi([1,5],1)*2+1;
        im_gaussfilt = imgaussfilt(im_orig,sigma);
        im_after_aug = im_gaussfilt;

    case 6
        % 7. average blur
        hsize = randi([1,3],1)*2+1;
        h = fspecial('average',hsize);
        im_average = imfilter(im_orig,h);
        im_after_aug = im_average;

    case 7
        % median filter
        im_median = medfilt2(im_orig);
        im_after_aug = im_median;
        
    case 8
        % flip (left & right)
        im_fliplr = fliplr(im_orig);
        im_after_aug = im_fliplr;
        
    case 9
        % flip (up & down)
        im_flipud = flipud(im_orig);
        im_after_aug = im_flipud;

    case 10
        % Rotate each image by a value between -45 and 45 degrees (angle)
        ang = randi([-45,45],1);
        im_rotate0 = imrotate(im_orig,ang,'crop');
        im_after_aug = im_rotate0;
        
    case 11
        % Rotate each image by a value between 135 and 225 degrees (angle)
        ang = randi([135,225],1);
        im_rotate180 = imrotate(im_orig,ang,'crop');
        im_after_aug = im_rotate180;

    case 12
        % crop (size)
        im_crop = zeros(im_size);
        crop_min = randi([1,34],[1,2]);
        crop_size = randi([150,190],[1,2]);
        im_crop((im_size-crop_min(1)-crop_size(1)):(im_size-crop_min(1)),(im_size-crop_min(2)-crop_size(2)):(im_size-crop_min(2))) = im_orig(crop_min(1):(crop_min(1)+crop_size(1)),crop_min(2):(crop_min(2)+crop_size(2)));
        im_after_aug = uint8(im_crop);
        
    case 13
        % re-size (size)
        magnitude = 0.5+0.5*rand(1);
        im_resize = imresize(im_orig, magnitude, 'nearest');
        im_resize_size = size(im_resize);
        if mod(im_resize_size,2) == 0
            im_after_padresize = padarray(im_resize,(im_size(1)-im_resize_size)/2,0);
            im_after_aug = im_after_padresize;
        else
            im_padresize = padarray(im_resize,floor((im_size(1)-im_resize_size)/2),0);
            im_after_padresize = padarray(im_padresize,[1 1],0,'post');
            im_after_aug = im_after_padresize;
        end
        
    case 14
        % translation
        shifting = randi([-40,40],[1 2]);
        im_trans = imtranslate(im_orig,shifting);
        im_after_aug = im_trans;
        
    case 15
        % add brightness (coefficient)
        coef_add = randi([0,40],1);
        im_add = im_orig + coef_add;
        im_after_aug = im_add;
        
    case 16
        % multiply (coefficient)
        coef_multiply = 0.5 + rand(1);
        im_multiply = im_orig.*coef_multiply;
        im_after_aug = im_multiply;
        
    case 17
        % sharpen
        im_sharpen = imsharpen (im_orig);
        im_after_aug = im_sharpen;
        
    case 18
        % contrast adjust
        im_adjust = imadjust(im_orig);
        im_after_aug = im_adjust;

    case 19
        % shear 
        coef_shear1 = 0.5*rand(1);
        coef_shear2 = 0.5*rand(1);
        tform = affine2d([1 coef_shear1 0; coef_shear2 1 0; 0 0 1]);
        im_shear = imwarp(im_orig,tform);
        im_shear_size = size(im_shear);
        im_shear_centerx = floor(im_shear_size(1)/2);
        im_shear_centery = floor(im_shear_size(2)/2);
        im_after_shear = im_shear((im_shear_centerx-im_size(1)/2+1):(im_shear_centerx+im_size(1)/2),(im_shear_centery-im_size(2)/2+1):(im_shear_centery+im_size(2)/2));
        im_after_aug = im_after_shear;
        
    case 20
        % salt only noise
        d = rand(1)/20;
        salt_size = round(im_size(1)*im_size(2)*d);
        salt_loc = randi([1 im_size(1)],[salt_size 2]);
        im_salt = im_orig;
        for i = 1:salt_size
            im_salt(salt_loc(i,1),salt_loc(i,2))=0;
        end
        im_after_aug = im_salt;

    case 21
        % pepper only noise 
        d = rand(1)/20;
        pepper_size = round(im_size(1)*im_size(2)*d);
        pepper_loc = randi([1 im_size(1)],[pepper_size 2]);
        im_pepper = im_orig;
        for i = 1:pepper_size
            im_pepper(pepper_loc(i,1),pepper_loc(i,2))=255;
        end
        im_after_aug = im_pepper;
end









