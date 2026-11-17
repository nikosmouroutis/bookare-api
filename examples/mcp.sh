#!/usr/bin/env bash
# Bookare platform MCP server without an MCP client: every message is one JSON-RPC POST.
# https://bookare.app/mcp · Streamable HTTP, stateless, no sign-in. Docs: https://docs.bookare.app/agents
set -euo pipefail
MCP=https://bookare.app/mcp
call() { curl -s "$MCP" -H "Content-Type: application/json" -H "Accept: application/json, text/event-stream" -d "$1"; echo; }

call '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"example","version":"1"}}}'
call '{"jsonrpc":"2.0","id":2,"method":"tools/list"}'
call '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"list_business_types","arguments":{}}}'
call '{"jsonrpc":"2.0","id":4,"method":"tools/call","params":{"name":"check_address","arguments":{"name":"Move Studio"}}}'
call '{"jsonrpc":"2.0","id":5,"method":"tools/call","params":{"name":"get_plans","arguments":{"country":"GR"}}}'

# Creating a venue is real: only do it when the owner asked, with their real email (they confirm with a code).
# call '{"jsonrpc":"2.0","id":6,"method":"tools/call","params":{"name":"create_venue","arguments":{"business_type":"gym","name":"Move Studio","owner_name":"Eleni","owner_email":"eleni@example.com","country":"GR"}}}'
