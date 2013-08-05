#import "LabViewController.h"
#import "LabPictureViewController.h"

@interface LabViewController (){
    UIImage *_choosedImage;
}

@end

@implementation LabViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)pickPicture:(id)sender{
    UIImagePickerController* controller = [[UIImagePickerController alloc]init];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    controller.delegate = self;
    
    [self presentModalViewController:controller animated:YES];
    
}
-(void)imagePickerController:(UIImagePickerController*)picker
       didFinishPickingImage:(UIImage*)image
                 editingInfo:(NSDictionary*)editingInfo{
    [self dismissModalViewControllerAnimated:YES];  // モーダルビューを閉じる
    
    // 渡されてきた画像をフォトアルバムに保存する
    _choosedImage = image;
    _picture_view.image = _choosedImage;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"hohohohohogeeeeeee");
  
    if([[segue identifier] isEqualToString:@"picture_segue"]){
        LabPictureViewController *pictureviewController = [segue destinationViewController];
        pictureviewController.org_picture = _choosedImage;
    //    NSLog(@"hoge");
    }
   
}

//画像の選択がキャンセルされた時に呼ばれる
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissModalViewControllerAnimated:YES];  // モーダルビューを閉じる
	
    // 何かの処理
}


@end
