# Keycloak - ADFinance

Custom Keycloak deployment with branded theme, email-based 2FA (OTP), and Docker containerization.

## Features

- **Custom ADFinance Theme** - Branded login, account, and email templates
- **Email OTP 2FA** - Two-factor authentication via email using [keycloak-2fa-email-authenticator](https://github.com/mesutpiskin/keycloak-2fa-email-authenticator)
- **PostgreSQL** - Dedicated database included in the stack
- **Fully Configurable** - All settings via `.env` file
- **Live Reload** - Theme caching disabled for development

## Quick Start

```bash
# 1. Copy and configure environment
cp .env.example .env
# Edit .env with your settings

# 2. Build and start
docker compose up -d --build

# 3. Access Keycloak admin
open http://localhost:18082
```

Default admin credentials: `admin` / `admin`

## Project Structure

```
keycloak-app/
├── .env.example              # Environment config template
├── .env                      # Your local config (git-ignored)
├── Dockerfile                # Multi-stage build (plugin + Keycloak)
├── docker-compose.yml        # PostgreSQL + Keycloak services
├── scripts/
│   ├── setup-auth-flow.sh    # Auto-configure authentication flow
│   └── create-user.sh        # Create users via CLI
└── theme/
    └── malawi/
        ├── login/            # Login pages (ADFinance branded)
        │   ├── template.ftl
        │   ├── login.ftl
        │   ├── register.ftl
        │   ├── login-reset-password.ftl
        │   ├── login-update-password.ftl
        │   ├── login-verify-email.ftl
        │   ├── error.ftl
        │   ├── info.ftl
        │   ├── theme.properties
        │   ├── messages/
        │   │   └── messages_en.properties
        │   └── resources/
        │       ├── css/custom.css
        │       └── img/
        ├── account/          # Account management pages
        │   ├── template.ftl
        │   ├── account.ftl
        │   ├── password.ftl
        │   ├── totp.ftl
        │   ├── theme.properties
        │   ├── messages/
        │   │   └── messages_en.properties
        │   └── resources/
        │       └── css/custom.css
        └── email/            # Email templates (HTML + text)
            ├── theme.properties
            ├── messages/
            │   └── messages_en.properties
            ├── html/
            │   ├── template.ftl          # Master email layout
            │   ├── email-verification.ftl
            │   ├── password-reset.ftl
            │   ├── executeActions.ftl
            │   ├── code-email.ftl        # OTP code email
            │   └── ...
            └── text/
                └── ...                   # Plain text fallbacks
```

## Services

| Service | Container | Port | Description |
|---------|-----------|------|-------------|
| PostgreSQL | `keycloak-postgres` | `7432` | Database (independent, accessible from host) |
| Keycloak | `keycloak-malawi` | `18082` | Identity server with 2FA plugin |

## Environment Variables

See [.env.example](.env.example) for all available options. Key settings:

| Variable | Default | Description |
|----------|---------|-------------|
| `KEYCLOAK_VERSION` | `26.5.2` | Keycloak base image version |
| `KEYCLOAK_HOST_PORT` | `18082` | Keycloak port on host |
| `POSTGRES_HOST_PORT` | `7432` | PostgreSQL port on host |
| `POSTGRES_PASSWORD` | `postgres` | Database password |
| `KC_HOSTNAME` | `http://localhost:18082` | Public-facing URL |
| `KC_BOOTSTRAP_ADMIN_USERNAME` | `admin` | Initial admin username |
| `KC_BOOTSTRAP_ADMIN_PASSWORD` | `admin` | Initial admin password |

## Authentication Flow

The recommended browser flow (`browser-email-first`):

```
browser-email-first
├── Cookie                              (Disabled)
├── Identity Provider Redirector        (Alternative)
└── Login Forms                         (Alternative)
    ├── Username Form                   (Required)
    └── Verified User Flow              (Conditional)
        ├── Condition - user configured (Required)
        ├── Password Form               (Required)
        └── Email OTP Authenticator     (Required)
```

### First Time User

1. Enter email
2. Verify email (link sent to inbox)
3. Set password
4. Re-login required

### Returning User

1. Enter email
2. Enter password
3. Enter email OTP code
4. Authenticated

### Setup

**Automated:**

```bash
bash scripts/setup-auth-flow.sh
```

**Manual:** See the flow structure above and configure in **Authentication > Flows** in the admin console.

### Creating Users

**Via script:**

```bash
bash scripts/create-user.sh user@example.com "First" "Last"
```

**Via admin console:**

1. **Users > Add user**
2. Set **Email** only
3. **Required User Actions**: `Verify Email` + `Update Password`
4. Do NOT set a password

## Theme Customization

Theme caching is disabled by default for development. Edit files in `theme/malawi/` and refresh the browser.

### Login Page

- Edit layout: `theme/malawi/login/template.ftl`
- Edit form: `theme/malawi/login/login.ftl`
- Edit styles: `theme/malawi/login/resources/css/custom.css`
- Edit text: `theme/malawi/login/messages/messages_en.properties`
- Add logo: Place `logo.svg` in `theme/malawi/login/resources/img/`

### Email Templates

- Edit layout: `theme/malawi/email/html/template.ftl` (header, footer, CTA button)
- Edit individual emails in `theme/malawi/email/html/`
- Edit subject lines in `theme/malawi/email/messages/messages_en.properties`

### Activating the Theme

In Keycloak admin: **Realm Settings > Themes** — set Login, Account, and Email to `malawi`.

## Production Checklist

- [ ] Change `KC_BOOTSTRAP_ADMIN_PASSWORD` to a strong password
- [ ] Change `POSTGRES_PASSWORD` to a strong password
- [ ] Set `KC_HOSTNAME` to your production URL (with HTTPS)
- [ ] Set `KC_SPI_THEME_CACHE_THEMES=true`
- [ ] Set `KC_SPI_THEME_CACHE_TEMPLATES=true`
- [ ] Set `KC_SPI_THEME_STATIC_MAX_AGE=2592000`
- [ ] Configure SMTP in **Realm Settings > Email**
- [ ] Set appropriate session timeouts in **Realm Settings > Sessions**
- [ ] Bind the `browser-email-first` flow in **Authentication**

## Commands

```bash
# Build the custom image
docker compose build

# Start all services
docker compose up -d

# View logs
docker compose logs -f keycloak
docker compose logs -f postgres

# Restart Keycloak (after theme changes in production)
docker compose restart keycloak

# Stop all services
docker compose down

# Stop and remove all data (fresh start)
docker compose down -v
```
