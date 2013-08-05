#import <UIKit/UIKit.h>

@interface LabViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak,nonatomic) IBOutlet UIImageView *picture_view;

-(IBAction)pickPicture:(id)sender;
-(void)imagePickerController:(UIImagePickerController*)picker;
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;


@end
