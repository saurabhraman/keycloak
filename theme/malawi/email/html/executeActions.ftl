<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
</#outputformat>
<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin:0 0 16px 0;">Hi${(user.firstName??)?then(' ' + user.firstName, '')},</p>
<p style="margin:0 0 16px 0;">You have been invited to join the ${realmName} Platform.</p>
<p style="margin:0 0 16px 0;">Click the link below to set up your account:</p>
<@layout.ctaButton url=link label="Set Up Account" />
<p style="margin:0 0 16px 0;font-size:14px;color:#6b7280;">This link expires in ${linkExpirationFormatter(linkExpiration)}.</p>
<p style="margin:0 0 16px 0;font-size:14px;color:#6b7280;">If you did not expect this invitation, please ignore this email.</p>
<p style="margin:24px 0 0 0;">Best regards,</p>
<p style="margin:0;font-weight:600;">${realmName} Team</p>
</@layout.emailLayout>
