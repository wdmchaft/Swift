//
//  UIActivityHUDDialog.h
//  Swift
//
//  Created by James Errol Villagarcia on 9/3/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIActivityHUDDialog : UIAlertView {
	
	UIActivityIndicatorView	*processActivity;

}

- (id)initWithTitle:(NSString*)message;

@end
