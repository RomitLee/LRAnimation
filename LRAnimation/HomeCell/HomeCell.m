//
//  HomeCell.m
//  LRAnimation
//
//  Created by RomitLee on 15/5/21.
//  Copyright (c) 2015年 RomitLee. All rights reserved.
//

#import "HomeCell.h"
#define TonyColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define Tony_app_color [UIColor colorWithRed:30/255.0 green:126/255.0 blue:237/255.0 alpha:1.0]

#define TonyRandomColor TonyColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256),1)
@implementation HomeCell

- (void)awakeFromNib {
    self.vii.backgroundColor=TonyRandomColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
