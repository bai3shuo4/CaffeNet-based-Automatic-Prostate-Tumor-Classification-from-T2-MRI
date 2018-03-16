clear all
% load the images
image_list = ['Prostatex0000_1',
'Prostatex0002_1',
'Prostatex0014_1',
'Prostatex0015_1']; 
for ilist = 1:4
im_labelname = image_list(ilist,:);
im_name = [im_labelname,'.png'];
filename = [im_labelname,'.mat'];
im = imread(im_name);

% get original image
im_orig = im(:,:,1);
im_size = size(im_orig);
image_aug = uint8(zeros(im_size(1),im_size(2),56));

% pick out the processing methods and apply to the original image sequentially
for image_num = 1:56
    combinations = randi([1 21],[1 3]);
    labels = randi([0 1],[1 3]);
    selections = combinations.*labels;
    im_after_aug = im_orig;
    for i = 1:3
        if selections(i) == 0
            im_after_aug = im_orig;
        else
            im_after_aug = image_augmentation(im_after_aug,selections(i),im_size);
        end
    end
    image_aug(:,:,image_num) = im_after_aug;
end

save(filename)

end

exit
