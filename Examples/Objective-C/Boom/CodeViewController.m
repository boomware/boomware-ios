//
//  CodeViewController.m
//  Boom
//
//  Created by Sergey P on 31.05.2018.
//  Copyright © 2018 Boomware. All rights reserved.
//

#import "CodeViewController.h"
#import <Boomware/Boomware.h>

@interface CodeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *codeField;

@end

@implementation CodeViewController

#pragma mark - Actions

- (IBAction)actionCheckCode:(id)sender
{
    __weak __typeof(self) weakSelf = self;
    [BWBoomware confirmWithCode:self.codeField.text completion:^(NSString * _Nullable phoneNumber, NSString * _Nullable requestId, NSError * _Nullable error) {
        
        if (! error)
        {
            [self performSegueWithIdentifier:@"SuccessSegue" sender:sender];
        }
        else
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error", nil) message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [weakSelf.navigationController presentViewController:alert animated:YES completion:nil];
        }
        
    }];
}

@end
