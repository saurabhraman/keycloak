<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin:0 0 16px 0;">Hi,</p>
<p style="margin:0 0 16px 0;">Your verification code is:</p>
<table role="presentation" cellpadding="0" cellspacing="0" style="margin:24px 0;">
    <tr>
        <td style="background:#f9fafb;border:1px solid #e5e7eb;border-radius:8px;padding:16px 32px;font-size:28px;font-weight:700;letter-spacing:6px;color:#1f2937;font-family:'Courier New',Courier,monospace;text-align:center;">
            ${code}
        </td>
    </tr>
</table>
<p style="margin:0 0 16px 0;font-size:14px;color:#6b7280;">If you did not request this code, please ignore this email.</p>
<p style="margin:24px 0 0 0;">Best regards,</p>
<p style="margin:0;font-weight:600;">${realmName} Team</p>
</@layout.emailLayout>
