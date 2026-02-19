<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin:0 0 16px 0;">Hi,</p>
<p style="margin:0 0 16px 0;">This is a test email from ${realmName}.</p>
<p style="margin:0 0 16px 0;font-size:14px;color:#6b7280;">If you received this email, your SMTP configuration is working correctly.</p>
<p style="margin:24px 0 0 0;">Best regards,</p>
<p style="margin:0;font-weight:600;">${realmName} Team</p>
</@layout.emailLayout>
