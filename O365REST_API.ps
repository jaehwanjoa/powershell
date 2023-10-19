# Create app of type Web app / API in Azure AD, generate a Client Secret, and update the client id and client secret here
$ClientID = "{ClientID}"
$ClientSecret = "{ClientSecret}"
$loginURL = "https://login.microsoftonline.com/"
$tenantdomain = "{tenantdomain}"
# Get the tenant GUID from Properties | Directory ID under the Azure Active Directory section. For $resource, use one of these endpoint values based on your subscription plan: Enterprise - manage.office.com; GCC - manage-gcc.office.com; GCC High: manage.office365.us; DoD: manage.protection.apps.mil
$TenantGUID = "{TenantGUID}"
$resource = "https://manage.office.com"
# auth
$body = @{grant_type="client_credentials";resource=$resource;client_id=$ClientID;client_secret=$ClientSecret}
$oauth = Invoke-RestMethod -Method Post -Uri $loginURL/$tenantdomain/oauth2/token?api-version=1.0 -Body $body
$headerParams = @{'Authorization'="$($oauth.token_type) $($oauth.access_token)"}

# Subscription 확인 -> 즉, 대상 구독에서 Audit.Exchange 및 Audit.SharePoint, Audit.AzureActiveDirectory가 Enable 되어 있는지 확인한다.
Invoke-WebRequest -Headers $headerParams -Uri "$resource/api/v1.0/$tenantGUID/activity/feed/subscriptions/list"

# 만약 원하는 Audit이 비활성화 상테라면 다음 커맨드를 입력한다.
Invoke-WebRequest -Headers $headerParams -Method Post -Uri "$resource/api/v1.0/$TenantGUID/activity/feed/subscriptions/start?contentType=Audit.General"

# 활성화 Audit을 종료하고자 한다면 다음 커맨드를 입력한다.
Invoke-WebRequest -Headers $headerParams -Method Post -Uri "$resource/api/v1.0/$TenantGUID/activity/feed/subscriptions/stop?contentType=Audit.SharePoint"


# 콘텐츠를 사용할 blob key(contentId) 확인. Excel에서 csv 깨짐 현상 발생 시 데이터 > 데이터 가져오기 | 텍스트/CSV 변환으로 해결
$response = Invoke-WebRequest -Method GET -Headers $headerParams -Uri "$resource/api/v1.0/$tenantGUID/activity/feed/subscriptions/content?contentType=Audit.General"
$results = $response.Content | Out-String | ConvertFrom-Json 
$contentid = $results | Select-Object -Unique | Select-Object contentUri

$response1 = Invoke-WebRequest -Method GET -Headers $headerParams -Uri $contentid.contentUri
$results1 = $response1.Content | Out-String | ConvertFrom-Json 
$results1 | Export-Csv -Path '.\Auditlog.csv'
# 추가적으로 Start Time 과 End Time을 지정할 수 있음
$response = Invoke-WebRequest -Method GET -Headers $headerParams -Uri "$resource/api/v1.0/$tenantGUID/activity/feed/subscriptions/content?contentType=Audit.AzureActiveDirectory&startTime=2023-10-06T02:00&endTime=2023-10-06T11:00"
$results = ConvertFrom-Json $response.Content 
$contentid = $results | Select-Object contentId | Get-Unique     

