//
//  ViewController.m
//  TOM3DTouchGestureRecognizer-Demo
//
//  Created by Tom Metzger on 12/25/18.
//  Copyright © 2018 Tom. All rights reserved.
//

#import "ViewController.h"
#import "TOM3DTouchGestureRecognizer.h"





@interface ViewController ()

@end





@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	TOM3DTouchGestureRecognizer *recognizer = [[TOM3DTouchGestureRecognizer alloc] initWithTarget:self action:@selector(touched3D:)];
	[recognizer setDebugMode:YES];
//	[recognizer setLegacyMode:YES];
	recognizer.minimumForceRequired = 0.8;
	
	
	[self.view addGestureRecognizer:recognizer];
}




- (void)touched3D:(TOM3DTouchGestureRecognizer *)recognizer
{
	
}


@end
