import 'api_base.dart';

// Authentication ENDPOINTS
final userLogin = '$apiBase/auth/login';
final userSignup = '$apiBase/auth/register';
final userVerify = '$apiBase/auth/otp-verify';
final passwordReset = '$apiBase/auth/password-reset';
final resetRequest = '$apiBase/auth/password-request';
final otpResend = '$apiBase/auth/resend-otp';
final signOut = '$apiBase/auth/logout';
final accountTypeSwitch = '$apiBase/account/change-type';
final passwordChange = '$apiBase/auth/change-password';
final verificationRequest = '$apiBase/auth/pro-verification';

// Support ENDPOINTS
final supportCategoriesGet = '$apiBase/support/categories/list';
final supportSend = '$apiBase/support/create';

// Profile ENDPOINT
final profileGet = '$apiBase/auth/profile';
final profileUpdate = '$apiBase/auth/update-profile';

// Polity ENDPOINT
final categoriesGet = '$apiBase/candidates/categories';
final partiesGet = '$apiBase/parties';
final candidatesGet = '$apiBase/candidates';
final statesGet = '$apiBase/location/states';
final lgasGet = '$apiBase/location/lgas';
final wardsGet = '$apiBase/location/wards';
final pusGet = '$apiBase/location/polling-units';

// Timeline Post Endpoints
final postCreate = '$apiBase/eye-witness/create';
final postUpdate = '$apiBase/eye-witness/update';
final postDelete = '$apiBase/eye-witness/delete';
final postView = '$apiBase/eye-witness/show';
final postsGet = '$apiBase/eye-witness/list';
final categoriesPost = '$apiBase/eye-witness/category/list';
final postComment = '$apiBase/eye-witness/comments/create';
final postLike = '$apiBase/eye-witness/reaction/like';
final postUnlike = '$apiBase/eye-witness/reaction/unlike';

// Result Central
final resultSubmit = '$apiBase/result-central/create';
final resultUpdate = '$apiBase/result-central/update';
final resultsGet = '$apiBase/result-central/list';
final resultDelete = '$apiBase/result-central/delete';
final resultUpvote = '$apiBase/result-central/reaction/upvote';
final resultDownvote = '$apiBase/result-central/reaction/downvote';
final resultView = '$apiBase/result-central/show';
