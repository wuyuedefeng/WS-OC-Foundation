//
//  SelectGroupCell.m
//  doctorApp
//
//  Created by wangsen on 14-7-10.
//  Copyright (c) 2014年 richardYang. All rights reserved.
//

#import "AddressbookListCell.h"

@implementation AddressbookListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 50, 50)];
        [self.contentView addSubview:imgView];
        _headImgView = imgView;
        _headImgView.layer.masksToBounds=YES;
        _headImgView.layer.cornerRadius=5.0;
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 150, 50)];
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
