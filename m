Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17C3D6CB0
	for <nova-gpu@lists.linux.dev>; Sun, 27 Sep 2026 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507698; cv=fail; b=Dt7N7ld1ANFdoPZCRWqUf/w5H8bGai8xNCAYPMnpBo2b29vrbeVPLDnDO83FXe3YzMKftW2vRCurRXTPznwxo1ZyRW+JwV8tNEebM6wJYCLltWhKp21xW9Pe67kdu9hgtr+NcSkqF3XtXXuLLxke93L6qTmuwDY/cXD50mMRXNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507698; c=relaxed/simple;
	bh=yNNMDT4uI2eBgMyfpYYUS5F/ExWgaRZJcPNjwrMV0t0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nRBK4zpk72MSkBVOzbDhs+clCMqNmW3LuNfAhYuyZQTZ6l+QklpKXTDRXTlcbBJan/ZWe5A3x7uGTwJP9F7qsKoeCu2OMV9/Wd2hbYg0q5WG++YE1VdDco7YIjyrbc4NwsLzTiU6ABRLDM6TBbIcS3maEOvXbpLlZLjfT+JdcOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LIxSyGBR; arc=fail smtp.client-ip=52.101.43.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LIxSyGBR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJqzHlXxhPTRHgmITIdiYZ0OCs1cOtrQ/V9D9m1Uy9+5lhSJ4haIpotv661xjUm91RJ93EP3SpQwEU4NN2zUs8nFpOmg5Vwh5I+bQqA2utJcQhmnFwTMbgicw2HpxLKsyp8IvYXpGEtzHpT3yjrwXc/JY2YVfbpG9C3wROdQc1HHH0m8dLVq0eHmkgeeJNJF6unqRXrnHvlywjIPfHqXf17ERwv1thL5wd5m7/QcNaWMgKjUOB4LqHFfZVuFecFxztMxYfLDyrnNlZJ09s5YZnk0veYV1JtD96Hbb7QKJinkWu/j3TAHQ9cHP9XE56Dr8YTFHtiL//LdzcizquivYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/n3SaEIjt+Cfb4QMzPZDHsOUgvag4QHc5ZaNuAmwug=;
 b=sU47c1oItbzGN2cePoslKhxg6oWgF1JqjsgnvC5gj5T4Y/2ZwqGijK/XkyQ8DXFSJ/WTQG6OUusJxP40cEyxSACP/iMOgSi3x25guB66WNpQ13zzOdlFYmduzm/SkqFBGIPftFUwJtWZhEUaWNaOk8EvKATkultDoVUo9r6l0t0G/R5U+hDbYzDw68vbi8ALdsn2XLupkxPJonJ4K1cIhrbPDD4k7U0mf6yRwo/6uboDJZTzgMGR9jwyUqHnhzBECLmLMFFjs7tzPZe7b/WW9tbt2dnC3OdVVwjUsvrLkGu2e4f8+wNPkVaxh6pZ8R35sIYSKraTY1XP0S9kMSTFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/n3SaEIjt+Cfb4QMzPZDHsOUgvag4QHc5ZaNuAmwug=;
 b=LIxSyGBRHwQ0sonPDxcwMx1l82q4yKQL8HqJGf2Yb22vDxpLUBWsS4A/uy7+FQ4DaGhKCegtUTiVGY3YZ3b0ExdzigiyvlBfin/0K0hupKlxuEc9PikVDxCQMEPCMVMh2f2JYJwoz83MdnXDRdCB2kNFGtzRVSOMpc4ZaPsS+F/WDthiSvZZSKVPn+Z7C13FfKMtOpyNGTzisg2OLRGZT6eZMCcLZ+obmpbT/5UrTMQRrY62poUULH6X1dRfk/HYxvnX7YmRCrkGF3Z6/t/GMtk7FIdv6fqzABHm1Qchw+zqYwLvLwAgILQ/dMY/Q5O72EbkOAbxWIczhlFHN4mlVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Sun, 27 Sep
 2026 11:14:40 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 11:14:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 27 Sep 2026 20:14:26 +0900
Subject: [PATCH 04/10] gpu: nova-core: gsp: cmdq: group the RPC-specific
 part of send_single_command
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-cmdq-rpc-v1-4-822db5af910e@nvidia.com>
References: <20260927-cmdq-rpc-v1-0-822db5af910e@nvidia.com>
In-Reply-To: <20260927-cmdq-rpc-v1-0-822db5af910e@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::11) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4ead45-22ed-42fc-da05-08df1c88857b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|23010399003|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nycqcEss6qaZdtBgBg3n0hjoQGFQ21j0dWHKfFEdWWIXsEAH7vcBrGVWoeozAMMdww3eeY1hp4DApYyHYn0meA8ZndO5jvXUAqEXJ1/xDyXaGp2tUlui2V6nrboDdEc9q+VhbVdv2GSMg0VinxtCsNcUokqDjv6qW/X1mR4W1aLU8bPU+OtIpBUwdlcxU+hn3XYjuiCMmjWZeZLk0e/qemQ8Oo6SjQryO8aS/Z5KAUK3edjaRHUhYWxviptJYpQXJK46JU3KccLY9wM5MuTy+vKeAAeTnlUssLhp4RjtUaTZE3mUW1Yvgixaq3JyQBtZN1trmfFjgbKcsvQb0uqZqZF7q26+wAAeNIVNttzH6+1cW3GUV6HtmhrxJvaNNG89wErP81Cqsp/x24S2ERA/bAwHBNCxHlRGFyS9j7FUoFfgP1/qXn1AHV5hy9/R8ERB8s1lwEcospy2MXPWhlEDFMoeof8/u0fCGsulGeQPbrMwi9mKtbOiMA6C3/Z4IsfvfSv7/mtaL2KqUaoKNfM7PpmJo1/YGoCZqZtbrAUqTFSR4pPk/qV7txZW1MMeMfaBohUydwcXLBFfmtjF75Iy8LitAx98TzDjLXx1rJO1sf7ub84xqegklIW06Kha8PbLBWwRwivjq2aS7ec4BwSjWPx7KibC9GHFWNjNMUeS/Xs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWYwMUJodUtiQ3NDYy9QUDVyRWNqa2RNbG5mTHltUWxMVXZNbnFpMDlBN1Zx?=
 =?utf-8?B?QWlYZ21zWWRiRFRxeEtlTk5JVnEweUNxRXlKb1dWU3oxeUoxT2I4eGxVZVZt?=
 =?utf-8?B?ZHZNelJpK2ZMbmJQMENhS1ptckJzNnpJeFI2ZU15Y3d0ZlR5aUxFaUpZcVFW?=
 =?utf-8?B?QTB3dGNZb1ROTVZRWFpFMWNBczg3YVdYaDdabHJIb3MrUjFVcU1ZOVN2RlB6?=
 =?utf-8?B?YlQyOTB6WWtYbHJuWnFYUjhCV2VSZnJtelJNSC9zWktjWjBRMGsrM1lJTDFV?=
 =?utf-8?B?RENxOEtNbW1qR001Y2poLzluWEVML29SekRTZGROL3kzb01zbVR0eU1Va1dI?=
 =?utf-8?B?ZXVGZXpqcElWR0UxUTlBemR5c1FlMksyVlF4MXh1d3RjbEJ0TFF3clZYd20x?=
 =?utf-8?B?dWF0VmllMkFFWHpXbVR0elZmQmVjM3BLTENoaDFPTmRZV0ZhckwyV1JNMFli?=
 =?utf-8?B?WWx4amg0amJueUZDL1BjSE1sTDUxR0ZEbEhIZzZoVTV1SWV1UC9XVVJKZzkw?=
 =?utf-8?B?ZUZOdUdLTVlRWjN0SDhGT05PS0VuTXNFQmxDdGZEaGJNdU5xMlpmZksxY3Bm?=
 =?utf-8?B?OHoyQ3pNWGZUc2ZIMVdIbnVFYzZsL0pHNnlFMVg2UnNGZGFkbnZiODFKWHJ5?=
 =?utf-8?B?a0lLaFd5NmE3c29HTmMvS0hUWDBBTEtwRXhNbitHa1h4ejZnMEYzcVR1RlM0?=
 =?utf-8?B?MWovSkdLOEExS0EzMGZ2REVldjc3OFV5N25iWFFhNDE4TlhCMHdodXIxYzhZ?=
 =?utf-8?B?RXNvNUg0cUpmRnFONjRtTTN2WFJkeE9YNjJEWFlOZjc1UE0zK0I4VHcybWwx?=
 =?utf-8?B?UVBTc0txY1JZRHBKT013cDdxWUpReFByRmZJdXBMcGZnQm5ta0dIK3o4ZE5U?=
 =?utf-8?B?NWpWWmNKZnhoU29oUUczMmgvc05ES0o1Y2NUUlVIWWM5VmZqenlYMllQZy9Q?=
 =?utf-8?B?eXROS2w1OWRKdldYRDI2ZkZTM04wU1ZBajNaSTZ1V1Q3a0JucXU2UHFYcy94?=
 =?utf-8?B?Q3BlQTdDV3NnQXlhRTNibERyN3p5S0drN2xrWTRLMGg0MjBuZ2lBTGpNMVFv?=
 =?utf-8?B?bHBOSGdIUytPRmdRYVJkeklObDFiVFZhcko3b1k0TW9FRmFveG1kNHhQTk5H?=
 =?utf-8?B?d0VjMG5ETnVET2xUdDRHcWRmK0l0QjJ3RFIyaU5GYVpmckp2RTc3TTlZUEQw?=
 =?utf-8?B?b1MrcmtkZ3hPaStHTUV5c2tETEhNT3dJQ1kwbXkxakM0dmhKemhlOXExYmJa?=
 =?utf-8?B?SkRUVVkwb3gxbXpPZXJUaHpncUFVQ1dvSDBHeXBGc1g1RTF6blh4NFJsNVYr?=
 =?utf-8?B?QVdnMHFxRUxPYUpOSS9GSFlybDArTEQvMm9ONWRqdE53RlVoNWtteGJ0ZUMr?=
 =?utf-8?B?T2FKdG56TDdKRGRxTDAyOVE1c29UeWp3NHRmTEVrOEFFOHN4NitSblJ1dEZ4?=
 =?utf-8?B?dlNLeUdxajBkVS9RQzlIcHFxcmlseThEL3dsSGNiQzZRcnBvejBSM3RqM0RD?=
 =?utf-8?B?VjJlTTg0OXlxSHdyUW9OZ0JpQ2FVakxZUzdhZE1HUC9udllvbzVXa0pJMVlK?=
 =?utf-8?B?NlFvZHVWZjdtSERTaXMwOXRGVklFZURIeVFDMDFyWFZseFRzMHFTa3d2bi9t?=
 =?utf-8?B?L25FNWNPZk10T1VqNW5lUC9xR1k2bWViSkxlbTZBUkd2OVBKRTBOa3p0NVBi?=
 =?utf-8?B?cFJFREx6T3dpamZMMkh2R0tiQk5lMzV0cjRxOU1ZQVNqUHRYRkY1aVFYOVJO?=
 =?utf-8?B?My9XbzlGVnZDbEVsMjE1NlhVZ2w4WnVCNVUwQWxVeURMbENEdWdWUE1jQzRL?=
 =?utf-8?B?Qll6a1JMWTZ4ZENsb0hldTZBZlZhNGtEM2hxNmE4Zk1PQ3VmVXc4Y1dRUG5V?=
 =?utf-8?B?cXNPRFNxM1Y4YUgzTk5ZZnQ3ckEycTBUWTJZeWduaHZiZDQreDYvaU9LVzNR?=
 =?utf-8?B?STVhSGNmRmd4bVlLZHhTUXdwVC8vRXovczFtanBjcWgrRnBCMTdnNWZOQzZQ?=
 =?utf-8?B?SWZCYmRMQis4ajA3UEpQV2ZwVUZ4U1JTU0REbFh4NXJ5bU5xZmFSbTAzM2ds?=
 =?utf-8?B?N2VRNU4rK1U4aUVjcmVSam5PQm92cHhxRWQ2alZHVnY4aDBPZkdrL0F2b0po?=
 =?utf-8?B?eWRiOVhFc1VIV2I5SmZsSXR0UlVkVGtNVjFMeUJWZm0xTDJZWkNEUHhsaStl?=
 =?utf-8?B?YkdGd2ZUQ05Xa1BVaityejZPVi90MlFsYUJWTldmOFkvL2t3RDJsUTlqMmxI?=
 =?utf-8?B?NlVpbVkxL29xekRROTlQU1dFc3RWVEl5S1VYczU5amFzOURvcXVpVDVCTWUy?=
 =?utf-8?B?VTduT2ljWW9XNDVXbWNMMFJPUDFwbm9iY1ozUTVUaGt5dlVLMUZFaFVBUDVC?=
 =?utf-8?Q?yXqmHZPe1Id/fqBJ8VAEfWgscFYfyry3H+/GMFxU0vfcn?=
X-MS-Exchange-AntiSpam-MessageData-1: qYUzL7X7wkMfCA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4ead45-22ed-42fc-da05-08df1c88857b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 11:14:39.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFA0Gj0CRS5OFpKJ0AyVKSqi+VXVlYC+UrqdJWlNlp4F4JBpuwNPBYrBb+OzdYrmqFC1bWLJpBtTiqS8VwF8ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154

`send_single_command` handles both the transport and message layers of
the command, intertwining the logic of the two.

Reorder the code so the message layer logic is within the same
contiguous block of code, so it can easily be moved.

No functional change intended.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 8e7e6609ebf1..f0e4f8f5228d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -659,18 +659,21 @@ fn send_single_command<M>(&mut self, command: M) -> Result
             .gsp_mem
             .allocate_command(size_in_bytes, Self::ALLOCATE_TIMEOUT)?;
 
+        // Fill the header.
+        let msg_element_init = GspMsgElement::init(self.seq, size_in_bytes);
+        // SAFETY: `msg_header` is a valid reference, and not touched if the initializer fails.
+        unsafe {
+            pin_init::raw_try_init(core::ptr::from_mut(dst.header), msg_element_init)?;
+        }
+
         // Extract area for the command itself. The GSP message header and the command header
         // together are guaranteed to fit entirely into a single page, so it's ok to only look
         // at `dst.contents.0` here.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
-
-        // Fill the header and command in-place.
-        let msg_element_init = GspMsgElement::init(self.seq, size_in_bytes);
         let rpc_header_init = RpcMessageHeader::init(size_in_bytes, M::FUNCTION);
-        // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
-        // fails.
+        // SAFETY: `rpc_header_mut()` and `cmd` are valid references, and not touched if the
+        // initializer fails.
         unsafe {
-            pin_init::raw_try_init(core::ptr::from_mut(dst.header), msg_element_init)?;
             pin_init::raw_try_init(
                 core::ptr::from_mut(dst.header.rpc_header_mut()),
                 rpc_header_init,
@@ -687,14 +690,6 @@ fn send_single_command<M>(&mut self, command: M) -> Result
         }
         drop(sbuffer);
 
-        // Compute checksum now that the whole message is ready.
-        dst.header
-            .set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
-                dst.header.as_bytes(),
-                dst.contents.0,
-                dst.contents.1,
-            ])));
-
         dev_dbg!(
             &self.dev,
             "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
@@ -703,6 +698,14 @@ fn send_single_command<M>(&mut self, command: M) -> Result
             size_in_bytes,
         );
 
+        // Compute checksum now that the whole message is ready.
+        dst.header
+            .set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
+                dst.header.as_bytes(),
+                dst.contents.0,
+                dst.contents.1,
+            ])));
+
         // All set - update the write pointer and inform the GSP of the new command.
         let elem_count = dst.header.element_count();
         self.seq += 1;

-- 
2.55.0

