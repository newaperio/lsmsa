//
//  InterestViewController.m
//  LSMSA
//
//  Created by Evan Cordell on 5/27/12.
//  Copyright (c) 2012 NewAperio. All rights reserved.
//

#import "InterestViewController.h"

@interface InterestViewController ()
@property (nonatomic, strong) RKTableController *tableController;
@end

@implementation InterestViewController
@synthesize tableController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableController = [RKTableController tableControllerForTableViewController:self];
    Prospy *prospy = [[Prospy alloc] init];
    
    RKForm *form = [RKForm formForObject:prospy usingBlock:^(RKForm *form) 
    {
        __weak RKForm *bForm = form;
        [form addSectionUsingBlock:^(RKFormSection *section) 
        {
            section.headerTitle = @"Required";
            section.headerHeight = 30;
            [section addRowForAttribute:@"name" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
            {
                tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                tableItem.textField.returnKeyType = UIReturnKeyNext;
                tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                tableItem.textField.delegate = self;
                tableItem.textField.placeholder = @"Name";
                [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
            }];
            [section addRowForAttribute:@"email" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Email";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];

        }];
        
        [form addSectionUsingBlock:^(RKFormSection *section) {
            section.headerTitle = @"Optional";
            section.headerHeight = 30;
            [section addRowForAttribute:@"telephoneNumber" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Telephone Number";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"address1" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Address 1";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"address2" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Address 2";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"city" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"City";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"state" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"State";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"zip" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Zip Code";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"interest" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Interest";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"currentSchool" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Current School";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"gradYear" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Graduation Year";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
            
            [section addRowForAttribute:@"concentration_id" withControlType:RKFormControlTypeTextField usingBlock:^(RKControlTableItem *tableItem) 
             {
                 tableItem.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                 tableItem.textField.returnKeyType = UIReturnKeyNext;
                 tableItem.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
                 tableItem.textField.delegate = self;
                 tableItem.textField.placeholder = @"Concentration";
                 [tableItem.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                 [tableItem.textField setAutocorrectionType:UITextAutocorrectionTypeNo];
             }];
        }];
        
        [form addSectionUsingBlock:^(RKFormSection *section) {
            RKTableItem *tableItem = [RKTableItem tableItemWithCellClass:[SubmitCell class]];
            tableItem.cellMapping.selectionStyle = UITableViewCellSelectionStyleNone;
            tableItem.cellMapping.onCellWillAppearForObjectAtIndexPath = ^ (UITableViewCell *cell, id object, NSIndexPath *indexPath) {
                [[cell valueForKey:@"button"] addTarget:bForm action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
            };
            [section addTableItem:tableItem];
        }];
        form.onSubmit = ^ {
            [[self.view findFirstResponder] resignFirstResponder];
            Prospy *prospy = (Prospy *) bForm.object;
            [prospy sendInterest];
        };
    }];

    [self.tableController loadForm:form];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
