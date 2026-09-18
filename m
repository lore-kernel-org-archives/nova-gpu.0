Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E83C5DA1
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697602; cv=fail; b=SK2b7d5HvejoQjxHPrqApmH2QwNZzwDyODC9ekcknqgCLgAPCFA7fN44SdNEI2EmPMEoyR3kI4gh/4h39FLOEkoI3BPzvvVkdro2RTwxo3+mL3+aFTQQrqcvDeHgm8hx5SA2zwVs7HQvduVJR65BgMa5BupX38hmkBGZkSHz5Cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697602; c=relaxed/simple;
	bh=+0pM30y6eF/xY5MS4XEi2/xlG2BDAU82ddGtasZvz+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A/5l5oj+0S1U4AnfaAJwbUo2EcapAUQ8QDQuU21zVsCHY6mCZg93VnWxXT45nFlv6AaKHGMnz43QWY6/Gli7b3uoia98z3YbKT3o9ohrf9iJgh+WZ2quNbzg42atp3VgT20L83De1hW+2rAX7MEJoyevtQsvhGbU42Fp2MkUB0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oQuHuE8p; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oQuHuE8p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnYZugbfOwsJ7RYWfo9aXdjw+ZoEpXbQF+aTEiRyxOK+flmoNqZKYnFkXH3TS9cYlfRMfiDMEIjnAOZ+sH9rEqp0KhllEGzWQnsFbbH5AAmWNHPNq0mBHTnC9Q9JtXFm1h8IAs5wraGsFn2L+15d6fXmpRncfROwvSEzKzT2AM0ktQeXBLm9sXZXF7cIcXaqGonnKxZ6E1QQiFp+//GP+w5klNp9bDISGvha+4RsHz3XtHej9LYfRy2g+ROwGuymeb3isAz4cz3Chs8XH4cK9sVY6Hef+yRzRgu1hLyrDEE7avFolX2GvJ3MoQyldX6gGWmxvHfNgFJOsjwPv0dQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6W3HSJ4qitUK2Z+4CC4pBH33j0uNp83IlJpDgT+xm+s=;
 b=eN+wkIY6FLVCb81k77GYiqZTUm//zAUjWuDvyv2GmDpVhFHzxWXlpUKErvb0Bb9maUB09fLaDTSYW3FmSauD4P5jQt5vq1Ag0Re8CiADtn6ISwo5RvyeLc/+vn4LgXiaoV/lwChFlDn4k97Yky62Dd3284Ta66w0zHQ/1ihJiCVIWIIVPeRKOMwKuuFWSaSI+Jq509fTG+qY9dOv5V6VBd/gQyQTZFWRb1oRi4+VQZ5XsvdpKdo9JB84iYPvdaI+C96tDu5gu+dsH5k8XEWndJBow8CrI7kjCkO3ouYRH/sZ9C9z421bWur3qDmYeHwBbVtApeNiyv+Z33wZFtR75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6W3HSJ4qitUK2Z+4CC4pBH33j0uNp83IlJpDgT+xm+s=;
 b=oQuHuE8pUvjzzAgmjLo2g1TfJDQyq8jA0C/TDzTkNYq9tae04VhkAGIW8Y4TUfJfeMS+D4sDci8JUcCt9GQYsXwDL6G+yiSiFS3BzOiKaoi8ZeuoxCSvPjPkzi9fSIzjbdfUWubMiaZjFOtZe9tAiBI6/RuEsYRYxAPo+wi0tshECtNXAH30m1KENeGu/7J1S8NIdWmhKnCkCMD8fx0Pir6J1MIKSwFTSio56+JuJ47Tjsn9OU9bZvnkhduVMfDk66wjUSIUkq/cRF+peWIX1CUvv+rpUA6jPPElbM5dkMEn4JGdQnSMMBJ1OQ7GzlI45MUHVeFCyBHJltiKOrQobA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.12; Fri, 18 Sep 2026 02:13:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 02:13:08 +0000
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
Subject: [PATCH 4/4] gpu: nova-core: gsp: distinguish GMC events from responses in debug logs
Date: Thu, 17 Sep 2026 19:12:49 -0700
Message-ID: <20260918021249.1187837-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918021249.1187837-1-jhubbard@nvidia.com>
References: <20260918021249.1187837-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:510:4::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: d607190c-3663-4966-bb11-08df152a61d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|366016|376014|10067099003|3023799007|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	HfJ8AwPtDqG6qqIOZ4TIFt6z88OSjstW0BzpQERlbe2rVrwfxMwvZ71Oz2B5jPNCwtHLH19VTnWY7MWq6UD38pbVc4VxgkgUpYKalNSvNexW3DC8DDt2UeJJ6B+FeDENl1CzpLwMGAvQCqvJbhPuNA7OnMY/c/34SRz6TrFZFEZUzesdPx/1tO9DQKeFTwymX7vVRWay31Lki7MzePxeQi/y27UiYt15y0gVrC+y7I8HjluJc+FfiDn1HATi5O6lyvekPElA9IVrL4fUzyv4r3XKzws5JyGE2OlBVNHA4Ta3z6/PmYKX7IED5zSSTJEfYVv7hDEJEbxy8FI6OPX0BExJriMCTRs8qNGXd57UYN/dLI+cwnXAZ/oCW0U8JDP/HcbpX7IQyiIJx+B+stYPBaKNEHm8476ALWYZxG+peJTEmwBMU8d2HEXXYHUM6A6eN8QBJAZymNbsKKPD4fUiU1eQtU0M8hHj0haQzPa9UzeZludHQL4ZJbEnrgpJGeu9GFMKfLM+Gc8vw4273ty/eiqQq7q7U/TrJPWGyABr5Ovfs4J9xc5pCyuUJ2QrplorwHT2KIbJA23TFov0I4+KFLAfKDRXGOA/2nBrJ1emCcIlD0XdZ3wbUiWF2twH9MAsz8q1Cwe8X7Vu7Px9TQaXDpYijXlDW76ZXrc8Ybd1eVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(366016)(376014)(10067099003)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AbQz3DTdpIyxNOznnfnnZWoRpRc1YwmU1L7VOt0f03mZIJevI0BYVvO79GPB?=
 =?us-ascii?Q?zaXpY7R8S+U16/Wmw55XCj5VUPqn8LqXHIHvx2vNYSqvdnqEoBF5Yxl/F9Vk?=
 =?us-ascii?Q?usGm6k9E9Z8FwxufeHJwndCRb7CzMbN/RC6DdSFi2IzgBq/a74E2SxPWOG+s?=
 =?us-ascii?Q?u09cLnod2dGZhaiv13Q2LJoWCJZsmwgVzwoJhG3BjYNnX0pEy3c6UXTMSszk?=
 =?us-ascii?Q?NqDw+JqvHgleOXXvCTHSJfmygmHbXT9OYgaHFcJC/90pJC9PLNpwU5l/hjNw?=
 =?us-ascii?Q?XAjy78Gns4sntoV1W9mipTW7dYTXdKhGjA1a7AAOnf66VAQOoRpOesyrzcfg?=
 =?us-ascii?Q?MMQd009zACG3VG2aMbUUcReLwLZx/ckrpLiWH6Yc1hN0eZo0UAUDaiq3IZ7I?=
 =?us-ascii?Q?Z+rtDJZgjEuporKrpbQo3MhGNJZKZeI72zN4xu0N8+1EQc5SV3ClexrZd+Jn?=
 =?us-ascii?Q?ac7ggNjCW66MVAdStQdQih3bYbpE8lDq88XrvzJKB+cVYZHMEBMylfJuUcjY?=
 =?us-ascii?Q?I55fuhkw0SHlbgVoWAqkol+mc6bXqoFGzsrPYq9oYCF7hVPrk7SwJs7cXUhG?=
 =?us-ascii?Q?m2DQo1CRyCPMRlpUFkDU0mH7QnF7kejR5jKzV/2wbdl7A5zpyun444SbAF8T?=
 =?us-ascii?Q?I65qw1K4nnS5Y7l6A/LePoa3oY1bk0LInh+KxKsuK6gOkPIbMsTXv9ibS0C6?=
 =?us-ascii?Q?wvUL3hTrPtIiUr/J7uWvYfP8aSytSgK/tLgi6UVDRYs1vSTv+UTtHeQ3x7aj?=
 =?us-ascii?Q?nIQGayLceOZedgP+i42FHO/lFLYw0AQrt70i6RPfxGFZfKAdE32WUbSG8NwP?=
 =?us-ascii?Q?ec6PGvamb3YfuiagOxRh0BPjIdtMhGxkZTqzKI38+wB+sgMtgCqIkQhnjhAO?=
 =?us-ascii?Q?uh8BqX2L2JOjEZQaiO/1DkppaNXfbksOPnHOUH+OwHvQHSv11SgTGmZW8Fx1?=
 =?us-ascii?Q?Fis0ZiPxOiQkxl9QfB+DXu4s6g0KfQXSagxI4zZPbfHO/CF0J/Iv3CLjhDAw?=
 =?us-ascii?Q?TEIHxeW1M7jZskrDRfyMDf0xPOmdSR6m1wegZpLtFORLi97hH3El7DzbEwwP?=
 =?us-ascii?Q?Ow7CFURqlAyRT1fB+CPLrp2M6oZOEtZ8bkxSIzooB7zVEUy6Px847vdLeMH/?=
 =?us-ascii?Q?cmyVs7e16QIT6MN78rq99A0Kn0aQ7dSzidFAZPC/NzaI2YxqirHmc+ObEHVW?=
 =?us-ascii?Q?A5QX8wmZOR6gJrkURNXdExyA75EAtDlGPn6xkSG/RmfnL0Z5BcdBBcv92j6Z?=
 =?us-ascii?Q?HpH5l9Ly9wcVkfiqw6qUmWU60SZuUG58r1XNYbEqL6BgtIUxqDMJjEufF6gL?=
 =?us-ascii?Q?mauDqP2sSWZ/lLQQaN4SRPFAgvsHQWD7DIdwAR9DgMeEXSW+y1Z5TCrgRCv1?=
 =?us-ascii?Q?A5gUB60II/IMwZSfegOC617f+1/L2cTp4Xa9IN6pd4yamJlCQ/SC4GR+/IWO?=
 =?us-ascii?Q?Tyaa2pxrJxjEGlpeWyJAbZLCgJKbjWMLvbOnppXgmjrnua9tq5RDcQZ99hFX?=
 =?us-ascii?Q?QmH2x79JPXS2ZwNAsfjMNm9aaPVy2zkF+kTvov2xRZ8lyzRd+pteeue8G6Iq?=
 =?us-ascii?Q?dN/yF7imbxJYgvU8yf40Lz11r/3j1446QdBOSHhioY7C7tSascodA52WJC1O?=
 =?us-ascii?Q?VtAvsq4/1xe7fzQQTZn6t2DvMONVctZO/DxUQJ+vNZbXt/2UnrWVJWAuxaf7?=
 =?us-ascii?Q?TBa/QvY5MmQ9V292I+xNZT1r9RLUC1/OUoq5o910glDdiNU9ZPSIiOCadXE8?=
 =?us-ascii?Q?A9Drhr3xww=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d607190c-3663-4966-bb11-08df152a61d5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 02:13:08.5954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXH+TItg5mkCgHaQ2teDKNvXCZHj9YpyVmqN0KkawGOEYk81bkWQjQ97kK0box0OCLSxzGI2h0A7C7QXjFKuzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015

GSP-RM numbers its GMC events from bit 63 upward, apart from the
driver's request numbers, and marks a response with a flag in the
command word.

The GMC receive debug line printed the raw sequence and labeled every
element a receive:

    GSP GMC: receive: seq# 9223372036854775808, command=EXEC_GENERIC_BOOTLOADER (0x10002), length=0xb0
    GSP GMC: receive: seq# 0, command=GSP_INIT (0x10001), length=0x450

Print the sequence with bit 63 cleared, and label each received element
an event or a response by the flag:

    GSP GMC: event: seq# 0, command=EXEC_GENERIC_BOOTLOADER (0x10002), length=0xb0
    GSP GMC: response: seq# 0, command=GSP_INIT (0x10001), length=0x450

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 35 +++++++++++++++++++++++--------
 drivers/gpu/nova-core/gsp/fw.rs   | 11 +++++++++-
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 2b53b1e6cebf..530ad51304ce 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1062,10 +1062,17 @@ fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
     /// Logs a GMC message that no caller is waiting for: a response to a request that has already
     /// timed out, or an event that arrives outside the boot sequence.
     fn log_gmc_event(&self, header: &GspGmcMsgElement) {
+        let kind = if header.gmc.is_response() {
+            "response"
+        } else {
+            "event"
+        };
+
         dev_warn!(
             &self.dev,
-            "GSP GMC: dropping unclaimed message (seq {}, command={})\n",
-            header.gmc.sequence,
+            "GSP GMC: dropping unclaimed {} (seq# {}, command={})\n",
+            kind,
+            header.gmc.sequence_number(),
             GmcCommand(header.gmc.command_id()),
         );
     }
@@ -1268,13 +1275,23 @@ fn consume_element<R>(
                 message.header.function(),
                 message.header.length(),
             ),
-            QueueElement::Gmc(message) => dev_dbg!(
-                &self.dev,
-                "GSP GMC: receive: seq# {}, command={}, length=0x{:x}\n",
-                message.header.gmc.sequence,
-                GmcCommand(message.header.gmc.command_id()),
-                message.header.length(),
-            ),
+            QueueElement::Gmc(message) => {
+                let gmc = &message.header.gmc;
+                let kind = if gmc.is_response() {
+                    "response"
+                } else {
+                    "event"
+                };
+
+                dev_dbg!(
+                    &self.dev,
+                    "GSP GMC: {}: seq# {}, command={}, length=0x{:x}\n",
+                    kind,
+                    gmc.sequence_number(),
+                    GmcCommand(gmc.command_id()),
+                    message.header.length(),
+                )
+            }
         }
 
         let result = f(self, element);
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 106d71f95fc3..ec474a175ee6 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -729,6 +729,10 @@ pub(crate) struct GmcApiHeader {
 /// Flag bit of [`GmcApiHeader::command`] that GSP-RM sets on a response.
 const GMCAPI_COMMAND_FLAGS_RESPONSE: u32 = 0x0100_0000;
 
+/// First sequence number of the space that GSP-RM numbers its events from, so that an event's
+/// number cannot collide with a request's. Requests are numbered from zero.
+const GMC_EVENT_SEQUENCE_BASE: u64 = 1 << 63;
+
 /// GMC request that carries the system information and registry keys to GSP-RM. GSP-RM answers
 /// it with the static GPU configuration once it has finished starting.
 pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
@@ -776,10 +780,15 @@ pub(crate) fn command_id(&self) -> u32 {
     }
 
     /// Returns `true` if GSP-RM sent this header as a response rather than an event.
-    fn is_response(&self) -> bool {
+    pub(crate) fn is_response(&self) -> bool {
         self.command & GMCAPI_COMMAND_FLAGS_RESPONSE != 0
     }
 
+    /// Returns the sequence number without the bit that marks an event's sequence space.
+    pub(crate) fn sequence_number(&self) -> u64 {
+        self.sequence & !GMC_EVENT_SEQUENCE_BASE
+    }
+
     /// Returns the `NV_STATUS` that a response carries.
     ///
     /// The value is meaningful only when [`Self::is_response`] is `true`. In a request, the same
-- 
2.55.0

