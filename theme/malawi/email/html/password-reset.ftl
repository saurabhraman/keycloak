<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin:0 0 16px 0;">Hi,</p>
<p style="margin:0 0 16px 0;">A password reset was requested for your ${realmName} account.</p>
<p style="margin:0 0 16px 0;">Click the link below to set a new password:</p>
<@layout.ctaButton url=link label="Reset Password" />
<p style="margin:0 0 16px 0;font-size:14px;color:#6b7280;">This link expires in ${linkExpirationFormatter(linkExpiration)}.</p>
<p style="margin:0 0 16px 0;font-size:14px;color:#6b7280;">If you did not request this, please ignore this email.</p>
<p style="margin:24px 0 0 0;">Best regards,</p>
<p style="margin:0;font-weight:600;">${realmName} Team</p>
</@layout.emailLayout>
