# Install Bookare (for Cline and other MCP clients)

Bookare's platform MCP server is a **remote** hosted endpoint. Do **not** clone this repository, do **not** run `npm install` or `pip install`, and do **not** start a local process. There is no local MCP server in this repository.

## Connect to the platform server

- **Name:** `bookare`
- **URL:** `https://bookare.app/mcp`
- **Transport:** Streamable HTTP
- **Authentication:** none. No API key, no headers, no sign-in.

### In the Cline UI

1. Open **MCP Servers**.
2. Open the **Remote Servers** tab.
3. Server Name: `bookare`
4. Server URL: `https://bookare.app/mcp`
5. Transport Type: **Streamable HTTP** (not SSE).
6. Click **Add Server**.
7. Leave headers empty.

### Or add this entry to `cline_mcp_settings.json`

For the Cline CLI the file is `~/.cline/data/settings/cline_mcp_settings.json` (or the path in `CLINE_MCP_SETTINGS_PATH`). For the Cline editor extension, use **MCP Servers → Configure → Configure MCP Servers**.

```json
{
  "mcpServers": {
    "bookare": {
      "type": "streamableHttp",
      "url": "https://bookare.app/mcp",
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

Set `"type": "streamableHttp"` explicitly. If the type is omitted, Cline defaults to legacy SSE, which this server does not use.

The Cline CLI command below saves the same server in this equivalent shape, which is also correct:

```json
{
  "mcpServers": {
    "bookare": {
      "transport": {
        "type": "streamableHttp",
        "url": "https://bookare.app/mcp"
      }
    }
  }
}
```

### Or with the Cline CLI

```sh
cline mcp add bookare --transport http https://bookare.app/mcp --yes
```

## Check it worked

The `bookare` server should appear as enabled. A successful connection lists tools including `list_business_types`, `check_address`, `get_plans` and `create_venue`. No sign-in is required.

Documentation: https://bookare.app/agents

## What the tools are for

This platform server lets an agent set up a complete booking venue for a business owner, with no Bookare account to start.

1. Use `list_business_types` and `check_address` as needed.
2. Call `create_venue` with the business type, name, owner name, owner email and country. It returns a booking page, an `access_key` and a `claim_link`.
3. Set the venue up with the venue tools on this server, passing that `address` and `access_key` (start with `list_templates` then `setup_from_template`, then adjust).
4. Call `get_embed_code` for the HTML to put booking on the website you are building.
5. Give the owner the `claim_link`. Bookings open only when they confirm with a code sent to their email and accept the terms.

Only create a venue when the owner asked for it, with their real email. Keep the `access_key` secret. Unclaimed drafts take no bookings, email nobody but the owner, and are deleted after 14 days.

## Optional: one existing venue

To connect a venue the owner already has, use `https://<venue>.bookare.app/mcp` the same way. The owner signs in with OAuth (read only, or read and change), or send `Authorization: Bearer <API key>` from the venue admin. That is a different endpoint from the public platform server above.
