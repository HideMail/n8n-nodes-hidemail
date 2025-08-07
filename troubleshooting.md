# HideMail n8n Node Troubleshooting

This guide helps you resolve common issues when testing the HideMail n8n node locally.

## Node Not Appearing in n8n

### Issue: The HideMail node doesn't appear in the n8n nodes list

**Solutions:**

1. **Verify the build:**
   ```bash
   npm run build
   ```
   Ensure there are no errors in the build process.

2. **Check the symbolic link:**
   ```bash
   ls -la ~/.n8n/custom/
   ```
   Confirm that your node is linked correctly.

3. **Restart n8n completely:**
   ```bash
   killall n8n  # Kill any running n8n processes
   n8n start --tunnel
   ```

4. **Check n8n logs for errors:**
   Look for any error messages related to loading custom nodes.

5. **Verify file structure:**
   Ensure your node follows the correct n8n node structure with proper exports.

## Authentication Issues

### Issue: Cannot authenticate with HideMail API

**Solutions:**

1. **Check API credentials:**
   - Verify your API key is correct
   - Ensure you're using the correct API URL

2. **API key permissions:**
   - Check that your API key has the necessary permissions

3. **API version compatibility:**
   - Make sure you're using the correct API version in your requests

4. **Network restrictions:**
   - Check if your network allows outbound connections to the API

## Execution Errors

### Issue: Node fails during execution

**Solutions:**

1. **Check execution logs:**
   - Review the detailed error message in the n8n execution log

2. **Validate input data:**
   - Ensure the input data meets the requirements of the API

3. **API rate limits:**
   - Check if you've hit any API rate limits

4. **Version mismatch:**
   - Ensure your node implementation matches the current API specifications

## Debugging Techniques

### Enable Verbose Logging

```bash
DEBUG=* n8n start
```

### Test API Directly

Use curl or Postman to test the API endpoints directly:

```bash
curl -X GET "https://api.hidemail.app/v1/emails" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Check Node Implementation

Ensure your node implementation handles:
- Error responses from the API
- Different data formats
- Pagination if applicable
- Rate limiting

## macOS Specific Issues

### Issue: Permission problems with symbolic links

**Solutions:**

1. **Check permissions:**
   ```bash
   ls -la ~/.n8n/
   ```

2. **Fix ownership:**
   ```bash
   sudo chown -R $(whoami) ~/.n8n/
   ```

3. **Create links manually:**
   ```bash
   ln -s $(pwd) ~/.n8n/custom/n8n-nodes-hidemail
   ```

## Getting Additional Help

If you continue to experience issues:

1. Check the n8n documentation for custom nodes
2. Review the HideMail API documentation
3. Check GitHub issues for similar problems
4. Reach out to HideMail support for API-specific issues
