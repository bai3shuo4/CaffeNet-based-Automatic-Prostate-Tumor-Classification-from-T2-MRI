clear all
image_list = ['Prostatex0000_1',
'Prostatex0002_1',
'Prostatex0014_1',
'Prostatex0015_1',
'Prostatex0018_1',
'Prostatex0026_1',
'Prostatex0028_1',
'Prostatex0031_1',
'Prostatex0035_1',
'Prostatex0040_1',
'Prostatex0041_1',
'Prostatex0046_1',
'Prostatex0055_1',
'Prostatex0067_1',
'Prostatex0071_1',
'Prostatex0077_1',
'Prostatex0078_1',
'Prostatex0082_1',
'Prostatex0092_1',
'Prostatex0094_1',
'Prostatex0095_1',
'Prostatex0097_1',
'Prostatex0099_1',
'Prostatex0102_1',
'Prostatex0104_1',
'Prostatex0105_1',
'Prostatex0106_2',
'Prostatex0111_1',
'Prostatex0114_1',
'Prostatex0115_1',
'Prostatex0117_1',
'Prostatex0118_1',
'Prostatex0119_1',
'Prostatex0121_2',
'Prostatex0123_1',
'Prostatex0125_1',
'Prostatex0126_2',
'Prostatex0127_1',
'Prostatex0128_1',
'Prostatex0129_1',
'Prostatex0131_1',
'Prostatex0139_1',
'Prostatex0143_1',
'Prostatex0148_1',
'Prostatex0164_1',
'Prostatex0169_1',
'Prostatex0179_1',
'Prostatex0179_2',
'Prostatex0181_1',
'Prostatex0183_1',
'Prostatex0184_2',
'Prostatex0186_1',
'Prostatex0187_1',
'Prostatex0190_1',
'Prostatex0192_1',
'Prostatex0193_4',
'Prostatex0194_1',
'Prostatex0195_1',
'Prostatex0196_1',
'Prostatex0196_2',
'Prostatex0196_3',
'Prostatex0197_1',
'Prostatex0198_1',
'Prostatex0199_1',
'Prostatex0199_2',
'Prostatex0200_1',
'Prostatex0201_1',
'Prostatex0202_1',
'Prostatex0203_1',
'Prostatex0203_2'];
for ilist = 1:70
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
