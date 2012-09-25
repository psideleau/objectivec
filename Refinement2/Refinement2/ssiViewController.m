//
//  ssiViewController.m
//  Refinement2
//
//  Created by Paul Sideleau on 9/24/12.
//  Copyright (c) 2012 Paul Sideleau. All rights reserved.
//

#import "ssiViewController.h"

@interface ssiViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)changeLabel:(id)sender;

@end

@implementation ssiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect labelFrame = CGRectMake( 10, 40, 100, 30 );
    self->label = [[UILabel alloc] initWithFrame: labelFrame];
    [label setText: @"My Label"];
    [label setTextColor: [UIColor orangeColor]];
    
    [self.view addSubview: label];
    
    selections = [NSArray alloc];
    selections = [selections initWithObjects:@"one", @"two", @"three", nil ];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return selections.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
    return [selections objectAtIndex:row];
}

- (IBAction)changeLabel:(id)sender {
    [self->label setText:[selections objectAtIndex:[self.picker selectedRowInComponent:0]]];
}
@end
