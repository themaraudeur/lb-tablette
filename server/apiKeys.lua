-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- You can get your API keys from https://fivemanage.com/
-- Use code LBPHONE10 for 10% off on Fivemanage
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "API_KEY_HERE0NT2KiSM9aaihYQ8eRzj2ZJNiSvguxfR",
    Image = "U3JDUZFThkY6e1nBYsal2lFKftDDxYcw",
    Audio = "VzdY3Dt9k2PssVGLhtsxEXn8kAROnH7H",
}

-- Discord webhook or API key for server logs
-- We recommend https://fivemanage.com/ for logs. Use code "LBLOGS" for 20% off the Logs Pro plan.
LOG_WEBHOOKS = {
    Default = "https://discord.com/api/webhooks/", -- set to false to disable
    Police = "https://discord.com/api/webhooks/",
    Ambulance = "https://discord.com/api/webhooks/",
    Dispatch = "https://discord.com/api/webhooks/"
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs

-- Here you can set your credentials for Config.DynamicWebRTC
-- You can get your credentials from https://dash.agora.io/
AGORA_CREDENTIALS = {
    appId = nil,
    appCertificate = nil
}