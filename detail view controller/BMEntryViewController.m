//
//  BMEntryViewController.m
//  JournalObjC23
//
//  Created by Karissa McDaris on 12/17/18.
//  Copyright © 2018 Karissa McDaris. All rights reserved.
//

#import "BMEntryViewController.h"
#import "BMEntry.h"

@interface BMEntryViewController ()

@property(weak, nonatomic) IBOutlet UITextField *titleTextField;
@property(weak, nonatomic) IBOutlet UITextView *bodyTextView;


@end

@implementation BMEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

-(void) updateViews
{
    if (self.entry){
        self.titleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.text;
    }
}

- (IBAction)clearButtonTapped:(id)sender {
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}
- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        [[BMEntryController sharedInstance] modifyEntry:self.entry withTitle:self.titleTextField.text text:self.bodyTextView.text];
    } else {
        BMEntry *entry = [[BMEntry alloc] initWithTitle:self.titleTextField.text text:self.bodyTextView.text timestamp:[NSDate date]];
        [[BMEntryController sharedInstance] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
