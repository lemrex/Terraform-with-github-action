resource "huaweicloud_obs_bucket" "bucket" {
  bucket = "bucket_name_here"
  acl    = "private"
  versioning = true
}

resource "huaweicloud_obs_bucket_acl" "acl" {
  bucket = huaweicloud_obs_bucket.bucket.id

  owner_permission {
    access_to_bucket = ["READ", "WRITE"]
    access_to_acl    = ["READ_ACP", "WRITE_ACP"]
  }


  public_permission {
    access_to_bucket = ["READ"]
  }

  log_delivery_user_permission {
    access_to_bucket = ["READ", "WRITE"]
    access_to_acl    = ["READ_ACP", "WRITE_ACP"]
  }
}




resource "huaweicloud_obs_bucket_policy" "policy" {
  bucket = huaweicloud_obs_bucket.bucket.id
  policy = <<POLICY
{
   
    "Statement": [
        {
            "Sid": "Policy_name_here",
            "Effect": "Allow",
            "Principal": {
                "ID": [
                    "*"
                ]
            },
            "Action": [
                "GetObject"
            ],
            "Resource": [
                "bucket_name_here",
                "bucket_name_here/*"
            ]
        },
        {
            "Sid": "policyname_here",
            "Effect": "Deny",
            "Principal": {
                "ID": [
                    "*"
                ]
            },
            "Action": [
                "ListBucket"
            ],
            "Resource": [
                "bucket_name_here",
                "bucket_name_here/*"
            ]
        }
    ]
}
POLICY
}






