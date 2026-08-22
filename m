Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF1263F5D
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363730; cv=fail; b=EaHbKp+dBjK8vP6EjM29nz1iq8HI8LaqAIpic4Gkxh64gHXR8oJQ7rEIRholbW1fFIsJ/Kcd4ult/vLjLEJn0EczHVffNDOatSZ9GVDCa9Yk2+fySISpU3Fjibm6Wyf1REWnum1z9RF3+sBHBQzrDpx+ETxmAXxmWO8jxlxUADk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363730; c=relaxed/simple;
	bh=ccrK5J+3SaPsrQfji2jJHD7MRfmxCfQ34CvQzVb/zTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rXInqf59Z0l/tMKMEosRN6VX7KPiHjjAx5jqnMXZsW/ToOf2knMFIBxG7BVMraXdFqluUXK1MsymVsdNobSlQP8ce3iug9BQMhPt4NigLvgejHfbANHdCZe/alGTRM1eln/EihAdWRtSnsX8mCZW4Lr+R68arGRciz6kIoj8OiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rpq6bfeK; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rpq6bfeK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCLMJ2GvXniG5ze+ga26wGuJjhskwB3vJwULQkjyE2RWkHZItT+ti5houEUdDT3gVpDF9vLQNyV9vNVAyDM1cwI30wvgSuu5SUxhSus0alwoRyTOJLnqH8FUX9/7hDVPS0e+gl2hJnNRhMfgZxRDfFwoakM20eU5mByh0BbdnXG7KbEVrvAQN1MSbyCxwl7rJj6ezTA7riGxq4LEDlTqPoo8ozu5te8yoOn/dLgCC9PuZQT6gCV34L09uge9v/6N0K6fet2TEfaS20dXde9s68Vn2edxi4UgMMFMp1rFhCVWJSZvY+jTlnakIGHxSlKuoMN6Sxp5/xkGAix/Xw7rjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58IPZlb7j8qLFTkRvGAjzCWi/ZDDCBNtef2/rr5WO9Q=;
 b=LDj5CqpMjBNukxWdDzv7WTxObAHlJmipH7W6D/78nvI32FhbajtreuNCDCtwXhvWlDwZolYx6oakFRBxL5fAn1E+Zmuawae1vgGDevSN2tntoX6GTH3yitX+Qkla8SwN51ESsgreGRYtRSlCvUyBUlO7PtlEwDGUIgSs/1cqM6nRMwPkCy0OuhYF8KTL88XS1vzqoWOqj4dAzzbP+MVR01RXcDSaSlg58weIiYTKBWeA6aJPkonGMyAllmakPqN9+Fbqljqbq85Bex3z+Tl7KT5usqgqlDrC2VMQtxq2LfqiXikPnoPXj3Sb6qTcwpOeVNGF8lPuZeccGEJeLTXfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58IPZlb7j8qLFTkRvGAjzCWi/ZDDCBNtef2/rr5WO9Q=;
 b=rpq6bfeKs/mnN9KxZhhFz4aG4u8ibvUEabRzlBV8Ogh4COmnh4MLZBq4ZWAVjkBSj4knCJ3xqvxl+FkvyBqFZLb2UXE7TZDbrtT/FaHZ4HKcDgRTlPB6iVFKQc9esN/Y1snwBtUAyhWn2X4mWeAUzhfdDiz47QmYmf0iKuTSKEyjcZC/WRqJXw8jXsowYB4JPgs3E1wbBbZzf+cbkB2374h+gTRfmIm59F1zykFw/amtysGBwbIsd0lk/XYMmtDjxZ76gsT6HRCywiPZzFgfLV2g0pbTWZY3zEQhebcU/wZUAag4Bd7x9XDRpvlF1JfqXagbvby1HQZu+Huf98zhkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:17 +0000
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
Subject: [PATCH v2 07/31] gpu: nova-core: distinguish async GSP RPC traffic in debug logs
Date: Fri, 21 Aug 2026 18:54:24 -0700
Message-ID: <20260822015448.238214-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6ca47d-2c9c-45f2-9eb6-08defff06a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|6133799003|3023799007|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HNKpEIcVAbCfZ/Lp23TXGYOxMAP6qjBcekfzNmMf/vJqmS8rurNbs61aaOwzobPLls4LH30PMuWnkCe4pU2P9awJuMLUH87ldv1SQGE0G4c3TQJrBuwkxIceVgMv0JxhKfCAyrzLmqiBaonC8ZiscWkG5wGIYB3J7p4PGK4dnM6Q1vZ5EhDi7sLrCkKERoUpyT79rhTnF/8g0oCXchTZgFF2ewnGzeOUwR75xfh3JnleqD9fk4ddM4dkF/uXoMaiVJOb9FDRv+qu+jIoexqwd6e1qW+OeIXx4G1rdjGzZvClN6uZEOrq5ABwYZvZVVnPzgzYVA5SI5FC1Lq+eY6yLDqFI0aTGB+5uQBXPwOXwkxa9VZ27uCFAKb7HPQsO5A7Qv91M+m6NQOjUYWMPpUdEn27FH5/75Ihx75msRpZpmlKhZnSYNy6FpgI9TI37x5n592XhlMyxjWGX5NYfQwltKSDz1tZmg0+RgRks0n6Lwxj0c5zeyQOLrEetXvxW7+di8iod0y0gHLKSM8yPIyQnvGFAMCEtEv6m7XGe2pdHjmL9Abkcnh75DO8Ci2+dXp/orwDauPhN8iaYS91x+l8FS6PLygjggR/ManzSMnLxG22A3ZGr0bjKEeA6sHFHLOFswe4wDy/H2gFwDZKDvjxoH2njb5qnTngDH8pavIgzAM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2bmWJPwKarbHJterSiZGq45psP7SJJAZikqA36/2+DRk7Ke7eNbXKY3JInXS?=
 =?us-ascii?Q?yUXvSaZyW95rWd6COAVc9rXtM+t1XLPVNwKL01M0K8o3Y3W0dbMwX65JwNr+?=
 =?us-ascii?Q?a6LzDk48ArFbXL1D1TnopZpvD6vEfziRxFqxZVkbKoWvA7l8OqjOnPTn2sKU?=
 =?us-ascii?Q?cfGWWXOdJJ4GWKpyXYHJ3XJ2phuTyQiAvtyuyj5MOLna1CfXx7cgb11yxDWy?=
 =?us-ascii?Q?k9ihH7wAOVwZkCvsxjq+QlAWRSS/5V5akDVA3cgBo7KWlcqP6NgIz7+FGjpi?=
 =?us-ascii?Q?L+b81FJgnlM5tLKZsNBt9iwmPhxh6lo8Ohyg3dc4/EntZO033XclcSemf29C?=
 =?us-ascii?Q?eujrtewZh9MFhZ6zO8ya+f8jiV2MchQa9gmDITPtO3fCqKHUBP1iP9rLIC/N?=
 =?us-ascii?Q?YYu34HQDS3xrvRKfoOJWV/6ZdyUE3bUqPDWd3PZlmiRyhKmhWwZYAxpoLBzV?=
 =?us-ascii?Q?E8p3Ja5de3wXuZfAxTqSw74kELt8ipsGDWEXtGFyf61o1UnsvMSu8tStkZgw?=
 =?us-ascii?Q?zxm1T4vsP9SC0jciMfzi8U5NIfDdDTxLJDwYc0nKIbeqwePNDCDkGu4fTBDD?=
 =?us-ascii?Q?xVxQZ2xnZCsD/8cUlVyqnEFZLsRb+v7T6y+mSqaGSRBsliFtx7ojf+wWu5dK?=
 =?us-ascii?Q?5NCIizy2711jTUCMBNLbLK8SEVdsmed7TeKZlz65ni8HmJeCum3KAGQdZMUf?=
 =?us-ascii?Q?vEM/tlN2tri0zOWyJCoYH94sKpKHIXs+RiHj7d+wh2WJL343mlGaHd+GPmti?=
 =?us-ascii?Q?Z0NPBIqzL5syWt2nJ4Iidvqbb4Q+080MeLRTQf3RAI7yhUZlGH8nqIkLNSTn?=
 =?us-ascii?Q?mqF8tLYf/1nWf4v9XaHnkIN6E84pCswzCPnt5FaTm9TP6siJIyuI8xjKGT5M?=
 =?us-ascii?Q?hK8ORgaYgzu5vz9Ys7to7Tu4Ark/yitd+UHdCCQZW9aJQbVLpH5Sipl1sudr?=
 =?us-ascii?Q?lQspElat8W4ZlQSSE5LoDmdRRreEE35bCwMqCH+B/oTWFhNXqIiOzWwp0WpE?=
 =?us-ascii?Q?Oko5Fym+NKPc04fk0/66r5aUY7MVZVbBCjybCKKd+yiLLq1/pyG3E7fVz92D?=
 =?us-ascii?Q?Mh5ksbcqPE+bLvi6l3l9GA0XyGgw9mQnjVPbaZ4dRBB0CV4HI8aZljNQ8eTV?=
 =?us-ascii?Q?F3v27QSdCLn1PxAbPpuFmV4O2FRHfBE/3gD5jjOKA2UWRYiItgOM4Zf6lCTY?=
 =?us-ascii?Q?4nQMCC+z0OLjtcdJ5zScPYJX5bT71ffPLgg9YssHty0sbNmewb+1zX3q1E7M?=
 =?us-ascii?Q?ONTn1D6krACUSR9nYqPb0+6TyVMGlNMHjnjMGIaqgR3VV791gLc4SEbhHPsG?=
 =?us-ascii?Q?u+njBTXQeK6JMycl4pgK6vCHjocDuF/V/iKIeNGPeST4Ceh0PT1iLxXJni74?=
 =?us-ascii?Q?WyMbEswzSSsJE3VEADx+6sv/JGHF766QNnEuPrpfUN2Rr2PwEuyF7iz8/rc8?=
 =?us-ascii?Q?gCxHYPNf4x8GAZPVJsU4i9okQMygIP7plAjMaGnjGeCJLxtUrOehHcamcT4t?=
 =?us-ascii?Q?4uuWKu3IuAR31e0V8mrSudvBV8f+gCKphGVTQGEuvYBFfF02e5bvnQzA1YCT?=
 =?us-ascii?Q?GLl9T2MwAy+p8TS+LuADfpgdKk+JFzwXXAIXbRseqOXg661xl+hS72LMl2tm?=
 =?us-ascii?Q?0z9xufbfRQed8l8uvGxbbROxxiaWCTffZASnP/C8RqrmRrXvpQimQgM1uVfu?=
 =?us-ascii?Q?+n5xw7T3i8uSt5RWvs/4cdUz/iX/IJPFlqBCzJXBTT2Yubr7hK41bWO4Rknc?=
 =?us-ascii?Q?P3hQLxRtew=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6ca47d-2c9c-45f2-9eb6-08defff06a1b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:17.4030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2M0OMVVFgnmtobanCh1tFghvng4VWB5EGyDUXzaMOFrNtNwXfDxwyCpIRpvEP/Sgo8TU+2WkLT5a9NSwKzPs1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

The receive path logged every message at the transport layer and did not
distinguish events from command replies. Async sends shared the RPC
sequence with waited-for commands, and GSP-initiated events arrived
with that field unset.

Print a distinct debug line for async send, sync send, event, and
command reply. Number async sends and events with driver-local counters,
which wrap rather than trap, since they only number log lines.

IS_ASYNC selects only the send log line. Every command still carries the
next RPC sequence on the wire.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs             | 111 ++++++++++++++----
 .../gpu/nova-core/gsp/cmdq/continuation.rs    |   1 +
 drivers/gpu/nova-core/gsp/commands.rs         |   2 +
 drivers/gpu/nova-core/gsp/fw.rs               |  19 +++
 4 files changed, 107 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index ac3e6642031a..1eeef2120b6e 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -87,6 +87,12 @@ pub(crate) trait CommandToGsp {
     /// Function identifying this command to the GSP.
     const FUNCTION: MsgFunction;
 
+    /// Classifies the send-side debug log as an async send.
+    ///
+    /// Default is `false`. Set this only on commands that are sent without waiting for a reply. A
+    /// [`NoReply`] continuation of a waited-for command stays `false`.
+    const IS_ASYNC: bool = false;
+
     /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer.
     type Command: FromBytes + AsBytes;
 
@@ -528,6 +534,8 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Err
                     gsp_mem,
                     elem_seq: 0,
                     rpc_seq: 0,
+                    tx_async_seq: 0,
+                    rx_event_seq: 0,
                     poisoned: Cell::new(false),
                 }),
             }))
@@ -672,6 +680,12 @@ struct CmdqInner {
     /// [`CmdqInner::receive_msg`] match that reply to the awaiting command. Advances once per
     /// logical command.
     rpc_seq: u32,
+    /// Debug-log sequence for async sends. Those commands do not wait for a reply, so this
+    /// counter is the number printed in the send log.
+    tx_async_seq: u32,
+    /// Debug-log sequence for GSP-initiated events. The GSP leaves the RPC sequence unset on
+    /// those messages, so the driver numbers them itself.
+    rx_event_seq: u32,
     /// Set once a message with corrupt framing or a bad checksum is seen. Such a message has an
     /// untrusted length, so the queue cannot be advanced past it, and every later receive fails
     /// until the queue is torn down and reset.
@@ -738,13 +752,24 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M, rpc_seq: u32) ->
                 dst.contents.1,
             ])));
 
-        dev_dbg!(
-            &self.dev,
-            "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
-            rpc_seq,
-            M::FUNCTION,
-            dst.header.length(),
-        );
+        if M::IS_ASYNC {
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: async send: seq# {}, function={:?}, length=0x{:x}\n",
+                self.tx_async_seq,
+                M::FUNCTION,
+                dst.header.length(),
+            );
+            self.tx_async_seq = self.tx_async_seq.wrapping_add(1);
+        } else {
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
+                rpc_seq,
+                M::FUNCTION,
+                dst.header.length(),
+            );
+        }
 
         // All set - update the write pointer and inform the GSP of the new command.
         let elem_count = dst.header.element_count();
@@ -826,14 +851,6 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             return Err(EIO);
         };
 
-        dev_dbg!(
-            &self.dev,
-            "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
-            header.sequence(),
-            header.function(),
-            header.length(),
-        );
-
         let payload_length = header.payload_length();
 
         // Check that the driver read area is large enough for the message.
@@ -877,6 +894,41 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         })
     }
 
+    /// Writes the classified receive debug line for a decoded GSP message.
+    ///
+    /// Events print [`Self::rx_event_seq`]. Command replies print `seq`. An unrecognized function
+    /// code prints nothing here.
+    fn log_received(&self, function: Result<MsgFunction, u32>, seq: u32, length: usize) {
+        match function {
+            Ok(f) if f.is_event() => {
+                dev_dbg!(
+                    &self.dev,
+                    "GSP RPC: async received: seq# {}, function={:?}, length=0x{:x}\n",
+                    self.rx_event_seq,
+                    f,
+                    length,
+                );
+            }
+            Ok(f) => {
+                dev_dbg!(
+                    &self.dev,
+                    "GSP RPC: response received: seq# {}, function={:?}, length=0x{:x}\n",
+                    seq,
+                    f,
+                    length,
+                );
+            }
+            Err(_) => {}
+        }
+    }
+
+    /// Advances [`Self::rx_event_seq`] after a GSP-initiated event has been consumed.
+    fn advance_rx_event_seq(&mut self, function: Result<MsgFunction, u32>) {
+        if matches!(function, Ok(f) if f.is_event()) {
+            self.rx_event_seq = self.rx_event_seq.wrapping_add(1);
+        }
+    }
+
     /// Receive a message from the GSP.
     ///
     /// The expected message type is given by the `M` generic parameter. With `expected_seq` set,
@@ -910,9 +962,12 @@ fn receive_msg<M: MessageFromGsp>(
         let message = self.wait_for_msg(timeout)?;
         let function = message.header.function();
         let seq = message.header.sequence();
+        let length = message.header.length();
         let func_matches = matches!(function, Ok(f) if f == M::FUNCTION);
         let matched = func_matches && expected_seq.is_none_or(|expected| seq == expected);
 
+        self.log_received(function, seq, length);
+
         // Every path must advance the read pointer past this message, including a failed decode.
         let result = if matched {
             match M::Message::from_bytes_prefix(message.contents.0) {
@@ -938,9 +993,10 @@ fn receive_msg<M: MessageFromGsp>(
         };
 
         // Advance the read pointer past this message.
-        self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
-            message.header.length().div_ceil(GSP_PAGE_SIZE),
-        )?);
+        self.gsp_mem
+            .advance_cpu_read_ptr(u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?);
+
+        self.advance_rx_event_seq(function);
 
         if !matched {
             if func_matches {
@@ -962,8 +1018,8 @@ fn receive_msg<M: MessageFromGsp>(
     /// Routes a GSP message that is not the reply a caller is waiting for.
     ///
     /// GSP-reported errors are logged at error level and unrecognized function codes at warning
-    /// level. Every other known function code is consumed without a log line, because the RPC
-    /// receive trace in [`Self::wait_for_msg`] already records its arrival.
+    /// level. Every other known function code is consumed without a log line, because
+    /// [`Self::log_received`] already records its arrival.
     fn dispatch_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
         match function {
             Ok(MsgFunction::OsErrorLog) => {
@@ -1004,16 +1060,19 @@ fn drain(&mut self) -> Result {
         while !self.gsp_mem.driver_read_area().0.is_empty() {
             // A message is available, so this returns without waiting.
             let msg = self.wait_for_msg(Delta::ZERO)?;
-
-            let pages =
-                u32::try_from(msg.header.length().div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
-                    dev_err!(&self.dev, "GSP drain: message length overflow\n");
-                    EIO
-                })?;
             let function = msg.header.function();
             let seq = msg.header.sequence();
+            let length = msg.header.length();
+
+            self.log_received(function, seq, length);
+
+            let pages = u32::try_from(length.div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
+                dev_err!(&self.dev, "GSP drain: message length overflow\n");
+                EIO
+            })?;
 
             self.gsp_mem.advance_cpu_read_ptr(pages);
+            self.advance_rx_event_seq(function);
             self.dispatch_event(function, seq);
         }
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
index 05e904f18097..a606c7be52a7 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -147,6 +147,7 @@ fn new(command: C, payload: KVVec<u8>) -> Self {
 
 impl<C: CommandToGsp> CommandToGsp for SplitCommand<C> {
     const FUNCTION: MsgFunction = C::FUNCTION;
+    const IS_ASYNC: bool = C::IS_ASYNC;
     type Command = C::Command;
     type Reply = C::Reply;
     type InitError = C::InitError;
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 61fe93db9e7e..d5575c036eb9 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -52,6 +52,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Sel
 
 impl<'a> CommandToGsp for SetSystemInfo<'a> {
     const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
+    const IS_ASYNC: bool = true;
     type Command = fw::commands::GspSetSystemInfo;
     type Reply = NoReply;
     type InitError = Error;
@@ -122,6 +123,7 @@ pub(crate) fn new(vgpu_state: VgpuState) -> Result<Self> {
 
 impl CommandToGsp for SetRegistry {
     const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
+    const IS_ASYNC: bool = true;
     type Command = fw::commands::PackedRegistryTable;
     type Reply = NoReply;
     type InitError = Infallible;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index d3678f16750a..857d53c77297 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -359,6 +359,25 @@ fn try_from(value: u32) -> Result<MsgFunction> {
     }
 }
 
+impl MsgFunction {
+    /// Returns true if this is a GSP-initiated async event (`NV_VGPU_MSG_EVENT_*`), as opposed to
+    /// a command response (`NV_VGPU_MSG_FUNCTION_*`).
+    pub(crate) fn is_event(&self) -> bool {
+        matches!(
+            self,
+            Self::GspInitDone
+                | Self::GspRunCpuSequencer
+                | Self::PostEvent
+                | Self::RcTriggered
+                | Self::MmuFaultQueued
+                | Self::OsErrorLog
+                | Self::GspPostNoCat
+                | Self::GspLockdownNotice
+                | Self::UcodeLibOsPrint //
+        )
+    }
+}
+
 impl From<MsgFunction> for u32 {
     fn from(value: MsgFunction) -> Self {
         // CAST: `MsgFunction` is `repr(u32)` and can thus be cast losslessly.
-- 
2.55.0

