//
//  VendorCell.h
//  System3ign
//
//  Created by sanu on 11/12/12.
//
//

#import <UIKit/UIKit.h>

@interface VendorCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@end
