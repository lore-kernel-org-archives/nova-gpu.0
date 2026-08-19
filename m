Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A23C3F4C
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111587; cv=fail; b=raTA0i3aIsK2WMoBAgwVqA61fOcczlXyuX8Ns+1kYO9eV2dI82oFLaT50aR09fYbVBAnd+77WIPK4TsH3vgwXQ5tYVYeE++X4hKTkFlstscuztFNpKVCneyk8XqfaKpCDcsw0+GI+8HufZj400PRk5ifj6VPLN87ntOqS7pPsfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111587; c=relaxed/simple;
	bh=u8LhELNVpntyE5HXDXHFn4+ht6A89BDJ+SDtpDJ77Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fid8/PBT8NQEegPuk4KYCI0IZf2OXJUCiokCaxK/Zf8+Wi8EJSJSm9aKJh6+GXyQCcZWFxnWnUP1EE6kTe0SpSOILIiNBveZkUOPMQR0NvDmWkgqGTkcG8TYY1RhC8mUwVbJOvoDwOpp0HZ4wGZWSrBHU8jagFeVzQmMfDJR4qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eHHyCMeI; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eHHyCMeI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izT895FO3/4/vOpBD4l0oNABUMXX6MzLMYxcr2PgyCboarolUO0hV459AXo8ZfEi3uc9c818ayrdJM9nyNZGB/ruO1dtpyakihJK5YWPQpw4CkySN5t1H46KQ56OHUfyGuGYdOKa4sylUiRlcSatwkxjAXfUQYMxC7swHnv6VYRCYGU1+JGPLCE+9R3XsQDOGzhpnWlibhBJ4iy0G8K43VBa0eQ8YGyX1pA/DeI7P+NopN4nLxabYIpsWkgPNT6m5gKMnqPdQHn+w0MT/eDFk8NyYOKUNGFC5wS+N84kGGiLix9IMIvEP0w/ckZu0ocTxzBT++N2sbBzrhLNmTsvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WI/wv8FIph0sbL4hviur/FkVklGWsyUgPJz0vXz3pck=;
 b=yKki1qbpx1m3upaAqmwOrVGLFeKbeaMl5nytoxaaPidtn5SPacEIBt8ybNB23CH+kTw6xkzgsSlAV3G1yFvx1C9c2dNzC2yAUIJuy25f2dlJkUta2/cL+2dRcEj6n1jY6lR+5sAg+0sJdns2lDJhK+InNqhUi5P6xRyyzwHmTPd7obrQnfJGvd8E3ddvxaVPJrCUZ/vB/n4t0Oge7845HjgsFEY20b7LwyUp2jMwr8i8lQVKjZZPZ8zXsPIJhGhxV3TyD+Nt3eB8mGpTdPl8k88Rf43l/Zbh7QQ+Au2Em4uvhd1yDhJUDz5vV0bap7gQOCIA9TdOa5GCwnrll4YDYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WI/wv8FIph0sbL4hviur/FkVklGWsyUgPJz0vXz3pck=;
 b=eHHyCMeIftXtQPeHpcUUXFl3zk+5uasEc4J2U5B5Xp652QPFC+l8wf2lh1SyPHNUTMGJZfjZLK7jemdcwvfy5MHLfcpJyR1w0y+GGcLxafMi9yETd/V05MjtvQONGzm0i0QPoGtZOX8+jUIW3MaLmHR6DTW5Lx4XSpKFetMt3HWZ/A6wAssiR+v935Ee07CgHBfWGRz41a5D9H9LilKnGtlh2zFOxEHG8AKFFvmL3N6iVJnVXmoYcjT/rF3kljmqwTEAxiAq14Th3gzrvq/iKaiUc47Ph+sGcrNqJ4kV+On/bKdN03r0qDldvdOAy425G0qXm4mYQ07YOLys2Zpm+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:41 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 16/27] gpu: nova-core: add GMC transport receive path
Date: Tue, 18 Aug 2026 20:52:09 -0700
Message-ID: <20260819035221.336390-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0023.namprd21.prod.outlook.com
 (2603:10b6:a03:114::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 815bb13d-9ebb-4039-4fdb-08defda5519a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|3023799007|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h3EXdmg056ge2tmebZ6eJJjEL69ej7e6tMG/i5sfgRCuLnBiawwfy2WgMZebqotN50+bxu54OlZMeZ+6sJDyEGuT2+2TCh2Q4VUFZ/siJcYIC1REnz9dWC9efX99un07RjcPKAxua/DKGjvFcFWBvQR5lxLuIAA6z3rPwjHBSB8ATo0mIuWDKS5Ge8rfUcTkou27XBvrpGMRDt5JT8HagphU9HnY88rw9OZd5JyvpNGfTB3rdvkII9XOygBtTrKXw97txoIcOInhi/hyhg0AdOD+PeO6PhekXvehx5AwbbeTiUZN+cjO2GCQD8b6B5JURABvJKU5MlGSOJlsM63Im4Wq0aDNeRw7ZXfe+6+6esYwn/ZtJoHiQda2ElMR+GzHgM7g0gmMK9LO+u/OiqToaclwskvEx6hyaq6NQ5HWv9wlhI7lcvIzNdo65t6hdi1wuE22YfgSwH8dINa11gicS5sWevb3o/2zUfN4YdKFxoFBquP/HJ7Lg3j8nzITgXoYe6dYQTQKwRGcn6/EJLyPlvIcowCOfiC+evgmZUsGYcOhMYFeTGIfHMUWJfJ/5kbLA1YgPO46Qh1PlpmRZdxytmwNlOPTE4ws86ZJdw/mBMlm+icJozWo19jEyFDaSuelEzw6M2AifD/x3xiLSycVXtsSy6sgAOxRoFmj+xf1qz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CCxWauI5ZP0ZRm3z/p2Fv5C0FUJIna4f5ORQYG1N+aaCEXHnf+tRek+UEuHx?=
 =?us-ascii?Q?uiL2k0ykGGVCn0kAPVfp4ed23Cvdej96RX0lVsgIvv1oadnuvqOrHs/W+0yP?=
 =?us-ascii?Q?DAFkI3keVJgYW6DjOcALU1VNw+oK8PML3FlgZCcDoGAmjYaBsVpBLGNOcbiI?=
 =?us-ascii?Q?rv1r1ZL4G2ENJwFi9l5TlsTBgVGORn89f1u65aaCOXlDXP5ZvLKD3ceXwNck?=
 =?us-ascii?Q?27KaxB1bQLZrRCzxgAVdjndXh9a+zJqmTQmDknVFDImK4EWmhZit+0Bf2Vat?=
 =?us-ascii?Q?ZqI06Z5+E+bKuPI4LX4m1qYGmO1UkJSqLGpMN4rL65JhInRBALn0hT4xKDR5?=
 =?us-ascii?Q?7+TQGWYbTG5myKpm7XYzzq9ho3k/dbwylP2aoKP3rRrzLT3Txp0tJEc/wGqr?=
 =?us-ascii?Q?OsvPWsy2/J0rMy6mGqBfS6wsKk/ZWk9yvb6Jlm9CKYDtzoMEwO20cJNcYBbt?=
 =?us-ascii?Q?B+88XGPvx2DsuHi7ePRlCsejGAaOO5r0qmXxu3pXP5KwNG/rnoCG7jpW0ZWi?=
 =?us-ascii?Q?7FWsFnWIdXzc0PtFsuEzEEZMbtXXXw6Zy43syJLferv2j72WqPJs4LZLzodg?=
 =?us-ascii?Q?mntGEXwdHFC7Dff+WV40dkzR4LjBZsgu/Kg6ztVHDicQ6ukaGPh26J+LgnlK?=
 =?us-ascii?Q?WGgoJZEQerKfCcQu7ZF5ysvhfr2VL6/GZsHs/Zf73N5QZyBsXwHR0GK145Bn?=
 =?us-ascii?Q?/MqTDXn8J6aA1ToId/39O3l8ZWuvynXq9MadCVqb4wannw/91e8E2/HaOtRM?=
 =?us-ascii?Q?R0yocXxeQ99O95xpcxxiIp3VDJkcjxjw1e2GmeCSDShFZBo9LxmMKf05V9Hk?=
 =?us-ascii?Q?eXQxUmjia5IHuAQ0fB9V1jS4kHZbIf2nm0R3VlzUur5SGZPSq9RfT8NXe5GU?=
 =?us-ascii?Q?+j5dtBTj0Utiqj846cN2S9Sy0idqzs8UqObXCNQnAkxVYwP4jAWqw4iZpxsu?=
 =?us-ascii?Q?M7D8VJr99D/Y1dy3lAEefh5ukIlJ/TRf3GMyQ/QAekIH3C1oh7+F7lDgrvTG?=
 =?us-ascii?Q?KiDfTp9vzDRcmX3mGSoDL5+CvQ15Jgi3IpzZWo9yzGq33nORx8JVoJaNoTa6?=
 =?us-ascii?Q?pSM78+VW2ewPmmoXGQ99OfwGwidrqSOc4Bk8MYJYBTOIrRINZq2cXSA0LeED?=
 =?us-ascii?Q?Sv8v9zuoJ7MfOS5okDUeaWjEW6R7lO6jUl5TLOaEoIRevE3OdLLrL6ojFtu1?=
 =?us-ascii?Q?UZy3Il2EOHeCrc7jgY+BmF6JFwv4xlGBIJw0AqqB7rvN350QM/60bkb9ReNT?=
 =?us-ascii?Q?csot+x1BVy+WfJQdjvdqjzelmKkFzkAgPPSd7Pjv2qSrkCKm3Y/QO3d3MEaE?=
 =?us-ascii?Q?PVJYlZd/movrWs2mclXmylqR49PzFl3JSWVnsD2zYOWGETv8opiRWXRVW/w7?=
 =?us-ascii?Q?rox9mXuzfl3GW7ePZcCvEe+X4S+pSjWI2SYBXT5UYkt3dLnYkFBL22DD9Bfu?=
 =?us-ascii?Q?NwLuO2UHaFF5LkhWHDL4UF9pWEkNx0yKqedgNzKRc4+TOUkTx5XMWVfBeJkA?=
 =?us-ascii?Q?D9iJWtnmeSAO2qWiDJR4mp6PXEnrD1wjKNhkA3ep9GlvTwWmLCV/wmt94Yik?=
 =?us-ascii?Q?Po502KYgXDSsmz7Lp1icg9JPLUKWfxzVjEhKPbyfNu88bbB4INQ1VbqPit9v?=
 =?us-ascii?Q?9WDQ4qgsVjjquaynEq0OeBVNypelGx+q709cQr9VdpS2gzgg1YDF1iI5Qg2c?=
 =?us-ascii?Q?XFy6ncM18cWhgl0BoOOR9+Ny6IwYf6LSZu4oo87gP/fVk7rmvlf0HshXRGXq?=
 =?us-ascii?Q?F7IlSdBucg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815bb13d-9ebb-4039-4fdb-08defda5519a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:41.5026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPviqDt5esVurnE3DEyQUr4afwIaOXkiVcEhqppB4xQunBOtxRVWieIOZbNMhUjbNjx1s+1k7poGGpnAouSRTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

GSP-RM posts GMC and RPC messages on the same message queue. Both use
the same MCTP and NVDM transport headers, but RPC messages continue with
rpc_message_header_v and GMC messages continue with GmcApiHeader.
Existing RPC receive code cannot parse the GMC layout.

Add a GMC receive path that validates the MCTP magic and rejects
payloads whose advertised length exceeds the available queue contents.
On a framing or length failure, poison the queue because the driver
cannot safely advance the read pointer without a trusted length.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 83 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs   | 10 ++++
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 88b143c6a7b7..fba94153e744 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -629,7 +629,7 @@ struct GspCommand<'a, H = GspMsgElement> {
 
 /// A message ready to be processed from the message queue.
 ///
-/// This is the type returned by [`Cmdq::wait_for_msg`].
+/// This is the type returned by [`CmdqInner::wait_for_msg`].
 struct GspMessage<'a> {
     // Reference to the header of the message.
     header: &'a GspMsgElement,
@@ -638,6 +638,18 @@ struct GspMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
+/// A GMC message ready to be processed from the message queue.
+///
+/// This is the type returned by [`CmdqInner::wait_for_gmc_msg`].
+#[expect(dead_code)]
+struct GmcMessage<'a> {
+    // Reference to the header of the message.
+    header: &'a GspGmcMsgElement,
+    // Slices of the payload following the `GmcApiHeader`. The second slice is empty unless the
+    // payload wraps around the end of the message queue.
+    contents: (&'a [u8], &'a [u8]),
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -1285,4 +1297,73 @@ fn drain(&mut self) -> Result {
 
         Ok(())
     }
+
+    /// Wait for a GMC message to become available on the message queue.
+    ///
+    /// This is the GMC counterpart to [`Self::wait_for_msg`] and reads the same queue. Like that
+    /// method it works purely at the transport layer, validating the MCTP framing and the
+    /// advertised length and nothing else.
+    ///
+    /// A [`GspGmcMsgElement`] and a [`GspMsgElement`] share every field through `nvdm_header`,
+    /// so a caller that may see either must check the NVDM type before reading `gmc`. Both
+    /// layouts put the element length in the same place, so the caller can advance the read
+    /// pointer past a returned message either way.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
+    /// - `EIO` if the framing is invalid, or the queue was already poisoned by an earlier such
+    ///   failure. Either failure poisons the queue, so recovery requires a reset.
+    #[expect(dead_code)]
+    fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
+        if self.poisoned.get() {
+            return Err(EIO);
+        }
+
+        let (slice_1, slice_2) = read_poll_timeout(
+            || Ok(self.gsp_mem.driver_read_area()),
+            |driver_area| !driver_area.0.is_empty(),
+            Delta::from_millis(1),
+            timeout,
+        )
+        .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
+
+        let Some((header, slice_1)) = GspGmcMsgElement::from_bytes_prefix(slice_1) else {
+            self.poisoned.set(true);
+            return Err(EIO);
+        };
+
+        // Checked before any length field is read, since a bad magic leaves them untrusted.
+        if !header.has_valid_magic() {
+            dev_err!(&self.dev, "GSP GMC: receive: bad MCTP magic\n");
+            self.poisoned.set(true);
+            return Err(EIO);
+        }
+
+        let payload_length = header.payload_length();
+
+        // Check that the driver read area is large enough for the message.
+        if slice_1.len() + slice_2.len() < payload_length {
+            self.poisoned.set(true);
+            return Err(EIO);
+        }
+
+        // Cut the message slices down to the actual length of the message.
+        let (slice_1, slice_2) = if slice_1.len() > payload_length {
+            // PANIC: we checked above that `slice_1` is at least as long as `payload_length`.
+            (slice_1.split_at(payload_length).0, &slice_2[0..0])
+        } else {
+            (
+                slice_1,
+                // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
+                // large as `payload_length`.
+                slice_2.split_at(payload_length - slice_1.len()).0,
+            )
+        };
+
+        Ok(GmcMessage {
+            header,
+            contents: (slice_1, slice_2),
+        })
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 56f255a3d49c..9e6b5ec6aadb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1055,11 +1055,21 @@ pub(crate) fn init(
         })
     }
 
+    /// Returns the length of the response payload (data after the [`GmcApiHeader`]).
+    pub(crate) fn payload_length(&self) -> usize {
+        num::u32_as_usize(self.nvdm_payload_size).saturating_sub(size_of::<GmcApiHeader>())
+    }
+
     /// Returns the total length of the message, transport and GMC headers included.
     pub(crate) fn length(&self) -> usize {
         num::u32_as_usize(self.mctp_payload_size)
     }
 
+    /// Returns `true` if the MCTP magic field contains the expected value.
+    pub(crate) fn has_valid_magic(&self) -> bool {
+        self.mctp_magic == MCTP_MAGIC
+    }
+
     /// Returns the number of elements (i.e. memory pages) used by this message.
     pub(crate) fn element_count(&self) -> u32 {
         self.mctp_payload_size
-- 
2.55.0

