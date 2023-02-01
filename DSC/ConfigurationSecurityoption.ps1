<#PSScriptInfo
.VERSION 1.0
.GUID 328394fd-c39f-437f-be77-2c13f41e981f
.AUTHOR Microsoft Corporation
.COMPANYNAME Microsoft Corporation
.COPYRIGHT (c) Microsoft Corporation. All rights reserved.
.TAGS DSCConfiguration
.LICENSEURI https://github.com/PowerShell/SecurityPolicyDsc/blob/master/LICENSE
.PROJECTURI https://github.com/PowerShell/SecurityPolicyDsc
.ICONURI
.EXTERNALMODULEDEPENDENCIES
.REQUIREDSCRIPTS
.EXTERNALSCRIPTDEPENDENCIES
.RELEASENOTES
.PRIVATEDATA
#>

#Requires -module SecurityPolicyDsc

<#
    .DESCRIPTION
        This configuration will manage the interactive logon message.
        In a scenario in which a multi-line message is used a new line is
        represented with a comma. If commas are used in the message and a
        new line is not intended they must be surrounded by double quotes.
 
        This example will result in the following logon message:
 
        Line 1 - Message for line 1.
        Line 2 - Message for line 2, words, separated, with, commas.
        Line 3 - Message for line 3.
        ex)$message = 'Line 1 - Message for line 1.,Line 2 - Message for line 2"," words"," separated"," with"," commas.,Line 3 - Message for line 3.'
#>
configuration SecurityOption_LogonMessage_Config
{
    Import-DscResource -Name SecurityOption

    $message = '경고 합니다.'
    $message1 = '조직의 정보를 악의적으로 수집하고 무단 반출하는 행위를 엄격히 금지합니다. 관련 행위는 실시간으로 감시되고 있음을 알려드립니다.'

    node localhost
    {
        SecurityOption LogonMessage
        {
            Name                                                                                                = "SecurityOption"
            Interactive_logon_Message_title_for_users_attempting_to_log_on                                      = $message
            Interactive_logon_Message_text_for_users_attempting_to_log_on                                       = $message1
        }
    }
}

SecurityOption_LogonMessage_Config -OutputPath D:\ 
Start-DscConfiguration -Path D:\ -Wait -Force -Verbose
