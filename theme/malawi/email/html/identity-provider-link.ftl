<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin:0 0 16px 0;">Hi,</p>
<p style="margin:0 0 16px 0;">Someone wants to link your ${realmName} account with the <b>${identityProviderDisplayName}</b> account of <b>${identityProviderContext.username}</b>.</p>
<p style="margin:0 0 16px 0;">Click the link below to confirm:</p>
<@layout.ctaButton url=link label="Confirm Link" />
<p style="margin:0 0 16px 0;font-size:14px;color:#6b7280;">This link expires in ${linkExpirationFormatter(linkExpiration)}.</p>
<p style="margin:0 0 16px 0;font-size:14px;color:#6b7280;">If you did not request this, please ignore this email.</p>
<p style="margin:24px 0 0 0;">Best regards,</p>
<p style="margin:0;font-weight:600;">${realmName} Team</p>
</@layout.emailLayout>
