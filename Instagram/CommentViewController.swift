//
//  CommentViewController.swift
//  Instagram
//
//  Created by 海野恵凜那 on 2017/01/05.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD


class CommentViewController: UIViewController {
    @IBOutlet weak var commentTextField: UITextField!
    
    var post:PostData? = nil
    
    @IBAction func handlePostButton(_ sender: Any) {
        //postDataに必要な情報を取得しておく
        //let time = NSDate.timeIntervalSinceReferenceDate
        let user = FIRAuth.auth()?.currentUser?.displayName
        
        //辞書を作成してFirebaseに保存する
        //let postRef = FIRDatabase.database().reference().child(Const.PostPath)
        //let postData = ["caption": textField.text!, "image": imageString, "time": String(time), "name": name! ]
        //postRef.childByAutoId().setValue(postData)
        
        // Firebaseに保存するデータの準備
        if let uid = FIRAuth.auth()?.currentUser?.uid {
            //post.comment.append(uid)
            
            // 増えたcommentとuserをFirebaseに保存する
            let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(post!.id!)
            let comment = ["user": user!, "comment": commentTextField.text!, ]
            //let comment = ["comment": post.comment, "user": post.Data.user]
            postRef.updateChildValues(comment)

            
        }
        
        //HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        //全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        //画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
