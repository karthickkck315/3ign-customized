//
//  Image.m
//  System3ign
//
//  Created by sanu on 24/12/12.
//
//

#import "Image.h"

@implementation Image

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.nextResponder touchesBegan:touches withEvent:event];

}


@end
