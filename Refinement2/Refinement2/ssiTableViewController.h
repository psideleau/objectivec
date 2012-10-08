//
//  ssiTableViewController.h
//  Refinement2
//
//  Created by Administrator on 9/25/12.
//  Copyright (c) 2012 Paul Sideleau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ssiTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary *selections;
    UITableView *tableView;
    UIButton *submit;

}
@property (strong, nonatomic) IBOutlet UIButton *submit;
@property (strong) UITableView  *tableView;
@end
