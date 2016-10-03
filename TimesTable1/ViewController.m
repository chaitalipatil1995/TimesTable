//
//  ViewController.m
//  TimesTable1
//
//  Created by Student P_07 on 20/09/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.multiplierNumber.keyboardType = UIKeyboardTypeNumberPad;
    self.limitNumber.keyboardType = UIKeyboardTypeNumberPad;
    
    self.myTableView.delegate= self;
    self.myTableView.dataSource = self;

    self.calculateButton.layer.cornerRadius = 7.0f;
    self.calculateButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.calculateButton.layer.borderWidth = 1.0f;

    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateButton:(id)sender {
    
    NSString *numberString = self.multiplierNumber.text;
    NSString *limitString = self.limitNumber.text;
    
    if (numberString.length > 0 && limitString.length > 0) {
        
        int number = numberString.intValue;
        int limit = limitString.intValue;
        
        countArray = [[NSMutableArray alloc]init];
        
        for (int index = 1; index <= limit; index++) {
            
            NSString *text = [NSString stringWithFormat:@"%d    *   %d  =   %d",number,index,number*index];
            
            [countArray addObject:text];
        }
        
        [self.myTableView reloadData];
        
        [self.view endEditing:YES];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return countArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    NSString *result = [countArray objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = result;
    return cell;
}


@end
