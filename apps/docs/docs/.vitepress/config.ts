import { defineConfig } from "vitepress";

export default defineConfig({
  lang: "en-US",
  title: "Stripe Sync",
  description: "Sync Stripe Webhook events directly into your database.",
  themeConfig: {
    socialLinks: [
      { icon: "github", link: "https://github.com/lawrencecchen/stripe-sync" },
    ],
    footer: {
      message: "Released under the MIT License.",
      copyright: "Copyright © 2022-present Lawrence Chen",
    },
  },
});
