Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423D31E855
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363810; cv=fail; b=d71SKPzHRDxDepxGpH6GsSs1TM9nUWNzr01mPwmIxD+hT8uJC1x1Kkk7KK1rM11ZFw4T95Rb8Tz9o39NDaq2S4XFS1ZyurKhV5bkxZne4XS3y5LC59SBxabuRoPDRTpQTNvDH59qnruSZc29imPaANKNR39V9aPAGwApwbt8QiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363810; c=relaxed/simple;
	bh=sQQ1ubel+zC5dCpYDbdmhUGjQZaTkzJr4BxrSa7HRbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QO5WN1XH9QmgFlF8UyQGQZejwAmbPSm54sW5wbw0tJ63ljzrRwa/DGIuY0Ck5Bdvt17fP+pCW41zxs/4GOpLrMCn8JNaSJb2HvCrLmBre+zSppP/yXXf/t8t83H8cFOJT/++ZEMC6f7b8FtuUFmY+WgWHvYF1ExNjSuNtafXU/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DdbpXH5N; arc=fail smtp.client-ip=52.101.43.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DdbpXH5N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOLAT0+jb7dQQRWcV5YBqeqqMDDpf5OpqSOckrHQ1gM0DYRp8jiOn89oXzrIMcf9MWnFDKBW/SLkNsfno3ax7BSnpuZhObxBFVos+R0ff9UiwC6FXSTUrlKMrQJI4M3NP4rYml+LbRRKD2PoHKUD5v1MtZtOlvmH7qqqcHO1HlA4ZYmdCMkam7cF5Cm9qkgyYmzXkGQSoVQW5H3sk7X5i0O6pfXMUIRRwRG/9TEjBzuFZ7pqYlXrX7Zf5FKUK1vgMB5eT7gqTJkP2KNwPt5ZFyLfvEdQFif3lKAwv6M8e9a2YN8o16awPTLQ18H6mk3xnUI6lo8+d2CUkQC4+cczwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwxSJhs7cZv94d+n9tl8aBmiqws7mZiDOS9MnI1wZe0=;
 b=SWIfbpH7pavCUjM0cu9VcTOq2aBpppBmo7ijYTGsLJ/NEHavmOZZEGazkxJkfMOBn7R1eZM055CNckkuNrX9RwzqJm7b5Sejof9R/I62syItUWinlIE3GQbw/n7gG0aFCB4KSfv7Pnp3X114i9vljVJvBhNSl1Msci91zuW1NE//Z5+61DoLKKnvRTI1yrLEWfUECNSBXUxiQseq0LU2eMSX7e2jOyn+McDIW0+Bww+SMUURS3ItoO7+K8p+oiyVA5O8vWGMdq+mHp9scmyP3wRk3M288+t/pXFVkioQtCg0k92QhNixjQJ5AIjjxBTbVtusQmYWRy2VN2JW+EqEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwxSJhs7cZv94d+n9tl8aBmiqws7mZiDOS9MnI1wZe0=;
 b=DdbpXH5NZ788zlU0JL9y0FjxlFP28ovTC5P7QZ7SjmL47A55aPABqtXfArZiivOPt+wA3QI8ufOvAOr7tWtE1NB//X4p1tvw21N6uo28Oe/8E++lPCcvKiWmZpq0SzNE4vOli7HLWWi1BQHV/JxvwUqYu3iSniKPPIlvwquFjFj7jxIMrvbFkhCE37yPdpUgN8J4nHvLPikIkCJydtBeqX3W7cwBzTO4GPRB3AZgTAo3w7eYUj+HWKVF1l8Djpu/gQhud215FiRF1Ku9Vf8x9Ag0bffTeIf5cpxJg+TUU+8tG0bzp56oZEMXMMuUdHw/k2Ms4/mRkunMxpD4K7eETA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:35 +0000
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
Subject: [PATCH v2 31/31] gpu: nova-core: distinguish GMC event and response debug logs
Date: Fri, 21 Aug 2026 18:54:48 -0700
Message-ID: <20260822015448.238214-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad5c030-6b9d-479b-b4bb-08defff098b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5waDsCMnaNq7sm8CKIsJlmJwYuIBP2LiPVydk4PY2eAhRJtHKGNXfyb4LHnGa5q+0jLaNnfR6CexJyMMlyeTlivjOeoxZXl7MwmXpcJ2r+A/EVXNmUzviRELBclVAuI5QKAnE9hQ1rnHKZZ/Qa767PcPuPDTzOxG00DsUk5VWWaUJXtuL3TeMMknASOFdlEdJ/3cyZXqhMWK0mAFfj49pkTM7B7XjhhU0O8R53x/mZzry3+1Dw7ps2q7yrYY5kHz/REWeFzM0fX9kPFF98L6z/3NpDIWNDP5+QtecZGW3b6YIvpjRWnj0oEqrKWBB3TeUHz85h36n50Xt6csrGLNZk5yn4wwRguAJKG8qBb2bIEryYJyNebkOWd34WMYVF/BUT/Mi3Smdo+D3zD9KJEUSOmvSC1YeoRfXxgvp9Lacw9vibzEaq0X+QXFfponH2vtw6MIaLpFLOdopkOpXHDYNXg4DBF8PwXpBs4u+BHOxhtIT+sbkU+LJcrI8q2Uu/942ApThNWPiSOd7WMcUH4kGkHpHh6QODpNk5AXOFNtConTKTzRCkvNKbYRaKNZ+SUHzySpTkKhNz0EvZqhwdheeiQsMk5dtdlvE+CMdt2pHQlvqvt5mbG4bXFjdGHoSGw/xoiMmxGcP4uCrBLDiAZU8QG/H2hNKU8SkqC0oc3xkeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a+xXn3LIGbYl8WSyF7mJNVx6z3a2yRZhCDxLCwKfTvxuCCu1GgQU9eiqxQYU?=
 =?us-ascii?Q?fzrgvVbWnkQYCJIuSgkLhbJmv8tD9bJJpVVZQs3MTIdl3jMAHYKYNZsrn9ib?=
 =?us-ascii?Q?sz5QwPeqBT9ocdHx9f7dJ9KDJjgTn2PzEApPCqgG10bTy0qAUP1bokpbL5cV?=
 =?us-ascii?Q?Vc0JPFr8Us4VqQosPa/CXXM5fhTJ6ayesIIeN2C7QiGl2yy0fyponTuLvmcx?=
 =?us-ascii?Q?uZkVDXt5XXTGWbpDiT2NnUX6y5NFMvv+lFxuzjjPwx3pSTSofQlBgK+5R2H3?=
 =?us-ascii?Q?AOW52Vj4lZJZg6Te/HRU0yzdGUJR6tM34+JxMsMKKM48W4Vc4iZU2GEUeoi9?=
 =?us-ascii?Q?jKuqwRR/V86p7fR7Y467XcLY7ChyhQ7QMDU4Gp+eEegAIpxsydnx8xYT0xPo?=
 =?us-ascii?Q?YXU9RLGQdrqmqAggMKPcZBUuqAVidpknRF7XRtU053+Tko/egNDAC7/a7WsZ?=
 =?us-ascii?Q?jGwZ9JtMDnnM82ZLqsXyXkfFl1ZDVcADTpyiXCU8sf01/GjkJINonSoNogQ6?=
 =?us-ascii?Q?x3sBq7oy2BV5/PdckWBeBey+AhJ8uwHs6hY8U0z/eQW7ZYj1VWuRDbhp2qA5?=
 =?us-ascii?Q?qQOYS9OmWxqHMMx32YHBLuEW9PcsvQh/Sd093aITjtUXvTW3m0vp7x2UBeTU?=
 =?us-ascii?Q?Y6ebOOwQ9Ofg7SWEYvwBR8UuBJk7uoXIseE1OMX5dB5CjZPYt3PPAMgAlLAG?=
 =?us-ascii?Q?4NbDT9O+h1V5aAubw2QsK51Nk0aZoZ2p9AiiJ+o3myGNwC1T+RC9lSvgqlOE?=
 =?us-ascii?Q?UY8iKERj4NL9S3vUdAO+lUlbPQvAXNNvjOrLsBL34MlUNDrdf6uiiZ5yAVO3?=
 =?us-ascii?Q?tMvzUS9b9IzQRCXB4mXvoYPxlppkHcQMgNpJ86/OhpPb7ppqKPHW2ezYSkSv?=
 =?us-ascii?Q?AKXcCm2BHT31jpyzuMuB8HXpiX/8eu+0UPDQoWVCizJxIWAXZ5JE7FPP6FtP?=
 =?us-ascii?Q?FvV+HUyTpz76Lv5P1EdTous7uM42PSw+bTQl6YFvvRK66ayIqCB57SayOrCz?=
 =?us-ascii?Q?gZ7CewaE3PcwKazKy1aVdXLKdp8GTVONgURkhXmg55WcaR0d3gZoEs+UF9n+?=
 =?us-ascii?Q?leAh8rI0KUCnNrQTx+li/tqg8JIdfNRu56fI677CaIT8RE5CyoyUHWdxm67h?=
 =?us-ascii?Q?p2BYAWcAF214OHds5Wj8F1JkUODQd8/2BCCm+D5u4YBDCOme2YaN4zYDgY71?=
 =?us-ascii?Q?iifLK6vbiTRyu/X7GHm4ygCZX8NOwBzmPWU/c8MPO0ZZbuJy5PBa5kuChvCd?=
 =?us-ascii?Q?m1u6JmecNn4TSSXE5o1jZLP6rRS5QsbAcpG5AIzw441a9cdBMswTHx9nUGZN?=
 =?us-ascii?Q?pXcVgsw2Y13ZUH1uqLoiozh3/EE1cvkw7eY+J8ny3wuFukgntaTVi2Kj2CCv?=
 =?us-ascii?Q?HyFg/IiIgW0Zj+7gdeseK9gvvtjy3ISTYvxE3s5JVZJGJ+111tfwgKXu7ArL?=
 =?us-ascii?Q?YTubUOwdzyX9vTTIAb8Gctyk1hr/lQgBYVPw75/WA2GZrjcultihyzQ5RMOC?=
 =?us-ascii?Q?fILpSQgUhxNYKBzRty0VRAFVHt7sYQrPgYKqBZvkCbmdPgsQhIgRS82R8PSX?=
 =?us-ascii?Q?Tcnp7yY42+D4qdzMSmnJJ+y//b+gDsmLjrtg87RV6Kp4wvXiT7mnanK+GdR5?=
 =?us-ascii?Q?Me5lpsUPrbF3I+KtzH3FFgm4QVLxw5JUjIzzz1FUrSDDr6SDG/hfdS2OFnS0?=
 =?us-ascii?Q?uKfaWR62sQYt8BS9l+pNcZDjej4htOgZGEDz5t8BHX3JOOXk0qCc9gdh1eEq?=
 =?us-ascii?Q?0p9bvG91ag=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad5c030-6b9d-479b-b4bb-08defff098b2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:35.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7nHaWPQgxz/hTGXh9uCjBt+1neTcakeHwHS0c+jIjFyP1zqTfD34x6HjgBWBQTySZf5rHo+yaDcYEdPty/8Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

GSP-initiated GMC events assign sequence numbers starting at bit 63 so
they cannot collide with driver request sequences, which start at zero.

The receive debug line printed the raw 64-bit value, so the first boot
event showed seq# 9223372036854775808 (0x8000000000000000), and it
labeled the GSP_INIT reply as an event.

Print the sequence with that bit cleared, and label a reply as a
response. Sample output on a Turing GPU:

nova-core 0000:c1:00.0: GSP GMC: send: seq# 0, command=GSP_INIT (0x10001), length=0xf8
nova-core 0000:c1:00.0: GSP GMC: event: seq# 0, command=EXEC_GENERIC_BOOTLOADER (0x10002), length=0xb0
nova-core 0000:c1:00.0: GSP GMC: response: seq# 0, command=GSP_INIT (0x10001), length=0x450

Assisted-by: Cursor:grok-4.6
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 10 ++++++++--
 drivers/gpu/nova-core/gsp/fw.rs   | 17 +++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 8e97cc71f2b6..e6931f65b167 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1299,11 +1299,17 @@ fn receive_gmc_and_dispatch<R>(
             (None, QueuePointers::Unchanged)
         } else {
             let command_id = header.gmc.command_id();
+            let kind = if header.gmc.is_response() {
+                "response"
+            } else {
+                "event"
+            };
 
             dev_dbg!(
                 &self.dev,
-                "GSP GMC: event: seq# {}, command={}, length=0x{:x}\n",
-                header.gmc.sequence,
+                "GSP GMC: {}: seq# {}, command={}, length=0x{:x}\n",
+                kind,
+                header.gmc.sequence_number(),
                 GmcCommand(command_id),
                 length,
             );
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 927332203a43..150c8042867a 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -674,6 +674,13 @@ pub(crate) struct GmcApiHeader {
 /// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries flags.
 const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
 
+/// Response flag in the high byte of [`GmcApiHeader::command`].
+const GMCAPI_COMMAND_FLAGS_RESPONSE: u32 = 0x0100_0000;
+
+/// GSP-initiated events set [`GmcApiHeader::sequence`] starting at this value so they
+/// cannot collide with driver request sequences, which start at zero.
+const GMC_EVENT_SEQUENCE_BASE: u64 = 1 << 63;
+
 /// GMC command that hands GSP-RM its system information and registry keys and returns the static
 /// GPU configuration. Its reply is also what signals that GSP-RM has finished starting.
 pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
@@ -715,6 +722,16 @@ impl GmcApiHeader {
     pub(crate) fn command_id(&self) -> u32 {
         self.command & GMCAPI_COMMAND_ID_MASK
     }
+
+    /// Returns `true` if this header is a reply to a driver request.
+    pub(crate) fn is_response(&self) -> bool {
+        self.command & GMCAPI_COMMAND_FLAGS_RESPONSE != 0
+    }
+
+    /// Returns [`Self::sequence`] with the GSP-initiated-event bit cleared.
+    pub(crate) fn sequence_number(&self) -> u64 {
+        self.sequence & !GMC_EVENT_SEQUENCE_BASE
+    }
 }
 
 // SAFETY: All fields are integer types with no uninitialized padding bytes.
-- 
2.55.0

