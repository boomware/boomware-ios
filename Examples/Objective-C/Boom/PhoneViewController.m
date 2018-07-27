//
//  ViewController.m
//  Boom
//
//  Created by Sergey P on 31.05.2018.
//  Copyright © 2018 Boomware. All rights reserved.
//

#import "PhoneViewController.h"
#import <Boomware/Boomware.h>

@interface PhoneViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation PhoneViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Remvoe device data", nil) style:UIBarButtonItemStylePlain target:self action:@selector(actionRemoveDeviceData:)];
}

#pragma mark - Actions

- (IBAction)actionGo:(id)sender
{
    __weak __typeof(self) weakSelf = self;
    [BWBoomware verifyNumber:self.phoneField.text method:[self selectedVerificationMethod] completion:^(NSError * _Nullable error) {
       
        if (! error)
        {
            [self performSegueWithIdentifier:@"PINSegue" sender:sender];
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

- (IBAction)actionRemoveDeviceData:(id)sender
{
    __weak __typeof(self) weakSelf = self;
    [BWBoomware removeDataWithCompletion:^(NSError * _Nullable error) {

        if (error)
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error", nil) message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [weakSelf.navigationController presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Success", nil) message:NSLocalizedString(@"Device removed", nil) preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [weakSelf.navigationController presentViewController:alert animated:YES completion:nil];
        }
    }];
}

#pragma mark - Private

- (BWBoomwareMethod)selectedVerificationMethod
{
    switch (self.segmentedControl.selectedSegmentIndex)
    {
        case 0:
            return BWBoomwareMethodSMS;
            
        case 1:
            return BWBoomwareMethodVoice;
            
        default:
            return BWBoomwareMethodCall;
    }
}

@end
