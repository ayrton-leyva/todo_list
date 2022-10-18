import 'package:flutter/material.dart';

// Create credentials
const credentials = r'''
{
  "type": "service_account",
  "project_id": "to-do-list-365717",
  "private_key_id": "a53f98091d9a4849710a50a34434e18e1f3aa9cb",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC/yJjBBJ17AtQb\ngJHJZAOhUUqUhSz26hl3Z9Zsg3NFoDDPo1eKfvoi2Xs/uy7JnZhb/ZMJIx2Bj8E2\n/8aPLJ1rbhEKmd6uNDbCnsrIrA3Q/iZgHdLFes5ggE1GcyHwxijnLEtibOUI6OxP\nhm8SRVAQYgriGcukiByLbmoVFx6EeVR3zXgma5y7IBGuW6FrYqXZ5at0N0482hi2\nvBjdUKY7xJKScyvDIzid7NkuBNLDUxlq+IjDrom9kGMGVaYUyC0S0bBFG7ylQONv\nBidUutFHDzlVKLDqFGC85+bGvyrlFWNdVTo1MnWI4WNx6Adt9poBhAIAp86m4zbQ\n2uJ0i8uPAgMBAAECggEAKILDfZYve8H7svmEEhHd0HAe/GNrPZbynS3iddaIfW8a\nkGm0/qzWwpDE/4/XEMCI4/ma2wW/YFRQ4IDD3Q90CzLbR618A7lEzfSD6kKpwnlE\n+u2hzZQkzu6bJCQCydzZ3AcXv2k4Mhsde6jugmIAyQ0ktmDzisQzn2JJ5z2UdS/b\n/+0uQfXmtL4uDU0T/rWMAfSFTQEaS5oNDJjwJl7mcV+GXOg7JoBPOtWDzg9XC2vN\nY2JNqd5Kf4CRqnz0zBnq2VQyubWCKeTFAmo2TBDamM2OG113jO5d6oRiSRvbXd+a\nFa60rpyIsb8irslqr9Tyb6neZbmSuV+awHufAZMnlQKBgQDu0PzNehu/sPXKrcsa\nYR2s9J3a7LhaLIzB4i0c+zje0UoQZtk10JPAXY8CotrwbArt5OaP99+W7yt640y7\nmSqPiyDTW8vvwbfaTr36adNNvtmhBsEsnZMjIT+uJAKUKS+ur4Cub5LD1huTT7cP\n6BpHMantPCxZhzUKwVafbke9vQKBgQDNlUMv2l1LjD43SxFzhnkbj0WNwwsXvbVf\n9B248bC5Xan0qIG+a2/cpOollo+/boCCv8NXVeRpUZ1/8K/Z4oWoyZG9Oe81HS1t\nCYz2oL803yFWkTA8N5wkBqFa3YWAE5Rp78TW067tHlsHnx11NhwLH7vKFYagvTh3\nKCHmmH3lOwKBgC0fodS1UM7sgdS0995ZIUFPyw/VkJPBPStZMAr80OcRBnyI4lvP\nuEstolruKI4q6/m9OW9Ud5PORxnmHtaHf0o2EJK/Eo6PvMxr+mt5WWqkN/y8CP4E\nHAwUOTMPLMmP6qmIEblj7YhBSV6RPlasFWMEWEYyC3MzH+uTUmm3bajFAoGBAK46\nAk+quwhMmWmY1/hVDYwatrJ2io8bOnxQUWQsiD4AMAnlSNeNC6ctqDYkzDxLNOQa\nCj2Y0FOlVFpaK133SJkMAtQgJiaYTKgswOc+wezX8NQBhaRy6IPrjpGITRyG+29w\nQRxjF8tiv3jNE1UDf265/Rc9ePP+iL0LKPfZYlCDAoGBAOjbsgR5n+O3nY/DHG0p\nc8ASebKkEZWwtBkWvKNiPiBMPE762D/mky2wyW2fE1uClyNB1HBBzloYuHmBh7gw\nXOhuxGccC0KTGEEBmeu+zp8MTHCP1t2QMAnJSA05Ut3oFhrxc2F7kAoGq90Lf2i8\nqvPc7ke4KuVDXhXvE+qmVsP7\n-----END PRIVATE KEY-----\n",
  "client_email": "lorenzo-todolist@to-do-list-365717.iam.gserviceaccount.com",
  "client_id": "106378750395075913182",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/lorenzo-todolist%40to-do-list-365717.iam.gserviceaccount.com"
}

''';

// 2D Image Task spreadsheetID
const spreadsheetID_2D_Image_Task =
    '11FlAL7xExi-XGuPDZPRdDGeZVwNzTIKh70XprlCmo3g';
// 3D Image Task spreadsheetID
const spreadsheetID_3D_Image_Task =
    '1GiRGZz0qrVnRc9DhwegC9k3E5f7ou4OGkmqdnZpj0D8';
// Writing Task spreadsheetID
const spreadsheetID_Writing_Task =
    '1tYEp8freZVHSmDkqFmn1IiZaVjsLIULMOEa_1oegIw0';
// Code/Unity Task spreadsheetID
const spreadsheetID_Code_Unity_Task =
    '1LkwIYUthgE3JSgXYp6IOUPdW9K-5IG3uSs74u8Em7OY';
