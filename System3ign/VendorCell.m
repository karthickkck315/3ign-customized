//
//  VendorCell.m
//  System3ign
//
//  Created by sanu on 11/12/12.
//
//

#import "VendorCell.h"

@implementation VendorCell
@synthesize imgView;
@synthesize nameLabel;
@synthesize priceLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
