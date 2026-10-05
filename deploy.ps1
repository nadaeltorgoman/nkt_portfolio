# Builds the Flutter web app and deploys it to Cloudflare Pages.
# First run opens the browser to log in to your (free) Cloudflare account.
flutter build web --release
if ($?) { npx wrangler pages deploy build/web --project-name nada-eltorgoman --branch main }
