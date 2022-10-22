import 'package:flutter/material.dart';
import 'package:todo_list/Services/Task.dart';

// Create credentials
const credentials = r'''
{
  "type": "service_account",
  "project_id": "to-do-list-365717",
  "private_key_id": "2cf2c428822508ec4a77d837ec2e2a337b4d287a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCVoL1Y26prgUvK\n+jLxtAPwPn7As6HgDsnQ7ctebG2T6ed6MDF9rlTMgJ6tJprwm9LPTJ/qfL2JSNWF\nHiJMirE7h7UfLkmnLHXfEwmwFm6cniuFzlWB+aAwF3zGDfn9NmqrL/0zfkhayuYs\nT0gyatcO1xCrFcDCNPf3NLdcC6wLIUKAlv4phCdXmYmdKdfM2SEpTvPKNxZEdlhD\numpGDmPa86cLrrN/RoHH/AOYf6NNsrv4fhDiFCQO5v4O9glXiTYEppUyzx9nPxej\nK6ixkhUNeTUHqzI+uQWpdIGYQ+qnAuSDGB37FGlyP5NR9UIbUc2P8y3tfa1OVIL+\nBSoESAjTAgMBAAECggEABvwzirfqi01EcAvhH/aC7o7EVROtvWuDUW0gft55+RtE\n0qf4T4E5dTiV78hrGEt1+nZ9yrEbGhMb4LSI7mDVKE3MD1IWXycMs6bMX3uUm1wo\n9PyucjxolYYrLYXOg1ssfKRnYiWFlDN/rlbfLHdfZdJ1dT81OfvGDbTY0IO8+uH2\n03UpaFFtXaa1N51Q7xB4iQEpOnMaNp+t51VdW9WqtKe+9nX1pH0eMEWzGuKAW+g9\nDkNbiJWM2iSmV75PJQsQAmthQWP/jk5dj52+FQu8pFkrbEpV9/7/6VUzbuZ1hi0y\neXpRRsbEXd+eMvswobC1no3xsBodH12OX8DGvRDewQKBgQDKl01ylPfmKCsbWN+y\n5MFuXMu1sC/KmSQceCehSvGXn9fc7stk4mp0Mm1Z5R1CmM8rZuvnLF8zplEqcSsf\ntTZaf8LB2qidsd7UmtwJBcc1vHjj+UYY2rNYbU0DFM2NHclfJ5i2SUezJ8JHOdul\ny3S8fz1l0EhToURUF2Ksp3lpQQKBgQC9Ev/sbzOLhdw4xbA433C4Eof+FPr7XYN5\nKztfKKD/vzvI7JKjCz7QrcpKblgw5Qj4UvLIBodXmp89uURKdP84m5MmPhCWr2Zh\nky8kRRkXdFPM5ZUQflcZWwU/1VigK74W5LLCblAm0grTTX5Cv8phqbPLinYNnkej\njuPhqKX5EwKBgQCou4vNuzUdhKcih8sI/G3+tVsVYEDtxM7Gx2x6cij12DO510mg\nJNP1I2rgTGsqZItn4rjoOZSxN/yyFL+OESfMCEz1mGCHtvWYrcJF4YIhx3AIsD0p\nxj1JkP9raZAp0H0/u4L9j9sf5CVznUTLucDonjFM80TKIq7+Otv8YSBGAQKBgAea\n2AhegKg//heae/gNpK8Cr82ccmvh2wPopT6yl6cxvena+hrsvN4P328W+R0eWToD\nvBgnixIO+hC1fvWvtwRD3atQG8Kz015hWSgQT24OE8DOCyzaqA4xBwkGP8ZRfBfX\nowkG/tpQ4HaXS1jL9gvvk3fAXfc2QpNlj+znp6VZAoGAQPbStHIpOnURwOOYwZgy\nwRIgJsXIwjcg2tWFiFKKQwfs+mLeCQYr1Z9R+bNN8iPw4lFJFARtX5Y/MURuCcug\n3d/vKrCmRbgTChuop0c9VRT28vot+s9sJDbChcwcGsr+T8lRE+hHQyf5M3mdCKZG\ni+XodD1tOf5/rcVJT+8mOZU=\n-----END PRIVATE KEY-----\n",
  "client_email": "ayrton-todolist@to-do-list-365717.iam.gserviceaccount.com",
  "client_id": "104813759463232300438",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ayrton-todolist%40to-do-list-365717.iam.gserviceaccount.com"
}

''';
// Name
const name = "Ayrton";

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

Color standard_color = Color(0xff3032034);

// 3D Image Taks
List<Task> ToDo_3D = [];
List<Task> ToReview_3D = [];
List<Task> Completed_3D = [];
// 2D Image Taks
List<Task> ToDo_2D = [];
List<Task> ToReview_2D = [];
List<Task> Completed_2D = [];
// Writing Taks
List<Task> ToDo_Writing = [];
List<Task> ToReview_Writing = [];
List<Task> Completed_Writing = [];
// Unity Taks
List<Task> ToDo_Unity = [];
List<Task> ToReview_Unity = [];
List<Task> Completed_Unity = [];
