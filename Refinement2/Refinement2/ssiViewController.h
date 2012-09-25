//
//  ssiViewController.h
//  Refinement2
//
//  Created by Paul Sideleau on 9/24/12.
//  Copyright (c) 2012 Paul Sideleau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ssiViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *selections;
    UILabel *label;
}

@end
