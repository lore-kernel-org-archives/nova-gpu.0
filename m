Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B323BBFAA
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111564; cv=fail; b=eZlFeLrVnhbe3bw8VI4TSm3JSS3ul9CAAldMG/PgKfqfu6dXCo2QCkZfQBT6335DaNYfUZxUF4x5QSubHga8VFOdh6vj09uO4hQV1z9zp50xjqX8jarHnqnufFxPdvAdpBlgBkfjaC5ary80rnL4r++RImRS0d1qkZay0VZt24M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111564; c=relaxed/simple;
	bh=FdUgix5dufvP6Su8HKiGOD6rmi4dpST7nBP0CDUBmic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i94xdOIaqz6f34xasPyrCv/09Y5oyhDaXKVXkSyqI9J4cMiwDjuy8f/Pee9jm0mtL+Kr+wO/XbSo/dvnJysEVhzcxzwd/u8NfrwYXawM+n6znCipqTwwwsNaXZTW41nbkWNsQ9HwDy/nfWsMuNEGmaolkHro5QKtwOsxyWlRFdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dspa3c5c; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dspa3c5c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmvrgFFBAeL25n9OZFSdFht78FNLM37Kdpp//H4JxDVGPwfm3vXEFm/NBgqHYqM8zXr76c8Lrhxtj4Z1z4vk3o9d/3kLBbp+Y9VBUinlgmWM2PJY8QMemnoSpAQlM5DGRg+S4FxFeVaSxOb7JWpgoOVBXJEoHPd1UYQFvUqe8sMi1rzpdkROuHk9ppkBTqG7OyzxytNaXJTNSj7eyjT5oRoffSk3VBWgsnED2kZp+KqaNs9pJslaey48pAA0ilKOuNYB0MhvHBYoTTbtkHs/McTgTc97PcBoEXMZkDjFaH3wmdLZLPPZbsm1sN/m8HZLIsGv1ZLwWYOLGkGsDzwVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsQV6lov79qX95NYzTSjlbFvD3ytC2r2z2DtDhk+8AI=;
 b=nc/X/bS3WQ1Fx+GTRca8t57HbTnEiiRVBGyiuZSxpnG6D5hJ6wwXw9gT8Ai8bSGsfzlbim9u28kSTpdP7FErqeAq1L+Mms1ZZ7Xq8DyI7HHXDMsn7hhhKnaGnBKwDwkkUFNuCS/75O5yI4digtJNbhv1Sv8ne2g1750iQqhGdgLl5Pmq0owYZWI/2oR2QuWJDK9+3Ni8TpqWiiw8fyAHdMmHW/tGJI6UpSxZujQY0r5fH4i5xZDq4lwabsVLy5Btj0QYm73xM+nhFrrvTUfmMkGUT8xjyxQoMX2sJ2stbvo43zds5oa8zIMBy/8dimrboNaGXspRoxFB6v9p+Y5mkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsQV6lov79qX95NYzTSjlbFvD3ytC2r2z2DtDhk+8AI=;
 b=dspa3c5c/4T70DiZiodqiISKjzE+FeeS+CE3zkhrWnZLGHtroa/jobzqu+qQM0O4MAAEbAqRZN4dO+s3JNWby306C/K7OyglLPF+YNJoyZK8achTHf1tAij1quQm0iZ2ukvUi3WanlqXtvOJcg0F5VViVvJ2vgChw+uKJFGywEpVkW7H3zYhRzvfTJQDkKjnW5aGVDnQlW0w87X44UW9XAjSznOJILkNlb8XW0GPvxsHNTh0mEt5txgXud+tVoszgRpeHN4biWJDsKXTq6l3bOMBk2pE78d9EuY1l4uR7xbyzfP+oqac0UB/KfegVw0T3VDeWddo6pxHgMSyioLyEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:30 +0000
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
Subject: [PATCH 06/27] gpu: nova-core: distinguish async GSP RPC traffic in debug logs
Date: Tue, 18 Aug 2026 20:51:59 -0700
Message-ID: <20260819035221.336390-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 00dda2f7-2edb-425c-b45d-08defda54aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Nz5cwPs7vc+B7ItgVDkerVmoF6GL4166I5I4K6faV+SaCbXrIhe1CyUTQjsOvi7q8je8punTvwOOgL2uKqr5jjazSdIt43TMYDRRoFgblvE15vgkaqu5eVEkjuwWf+vLffwVa8yJtkYC1shoBXhN0srTioKEGPSEa9QAYZY6Dr2fWsxWvmcudqK7u7UEzACACXaQZi07pxlCU5NTX7l2hZH9/49wTRbg+G/ilOZhsa5qXI+oyiULQOtMd5X3sB/oqOX7IzauTJ0LaaRCSGhbiS6zPZi2ujY1HpFwZG+TFC+x87jGSkqSILF08OY7KePNtDJjQE2Ed1nSuHD5Q1QUSikX3lLuA5WhJRiQAqAoaPpJwUoigmuV83CGavzQ48Y+Dd8r373gVy9YX/Bfez9BMQZn8GUaTBADKrYD4fTfo4AZpjYO9F6QGqu2HvqCWcHYYy3XVMG0MnXvkcXwrYG66/PHV5yQjkNgvW+lEyfMth7hvxq/YIu2LLEXIGouH5kHBfUpIjMssSzCUwT1yQ8bLthoT7VISfWI9g7V5iTW9/qQkPDwuQhP2AcXqDeOjUHV+mqNTNW1yaluWAJpgIHTrYnkpx4u1K0/7b0wv9asOqQqldTdmNhNfVYLWVd/5vWhLvEH5zn5txOKmmOxowBoaMbg6VrNKKPnqMBdPBSFKPc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gJj0zj1ezGoZTwj2ZkFQea48C/jXErGv1mrCtbW/yw6RCAq0jbHUAJEhjlji?=
 =?us-ascii?Q?OLGthOu6PfszzGdzg/Yb1VtPOQSHNaTMJIyIyUbO5uCcsOv3D6T9H7i9vzpM?=
 =?us-ascii?Q?3ziSM54bq2IkyY7z9xVRrQGdAfgyGf3XKJUY8nABeuMQe65ZJYH6xzF8YAnB?=
 =?us-ascii?Q?AUb4zVrP0kvHhJHBuL+QcNF6VikLAvD0jIYCyAJWlhxV2usCPKxKsAJJ+/zu?=
 =?us-ascii?Q?m9iqGUkFcdbdx8iLba8xOOmQBKCWpC4qN2zZQuJzfPQ1m/PA21y8V8Hjo3b3?=
 =?us-ascii?Q?2w0h/mvM+SB3qLUbvkzRFA9m0i3xWJPMzO+IFCGkg8cAVJNaMRzQo+2rC6mu?=
 =?us-ascii?Q?wax3q1O5v9gQ59n6ynJYfyGXpqIYQmmX72uxMWa1UlHM42QsRrR2SO9xc7fq?=
 =?us-ascii?Q?peMU45F6lqLel2nN9GZvr1cYy4nm2HcMvYNXRlyGUjAW8a0ZjGGwO7+8yqxx?=
 =?us-ascii?Q?bxs0h39evglP6MIfPGMGsoKunMF2ohv38zhcdZpkqbJQeLmwjfpzNPC/v3jl?=
 =?us-ascii?Q?mTL9ggaTEEcdYf3sGEHUW0W14lbH6cB3JioCVn+4gQ6D80eN1fWWEJc/J0cD?=
 =?us-ascii?Q?SJnPg2h0UdFxIveKIU3+8aC1fdKbTVgKH+NtiOrrIgCE+3qA/mtrMqWjfgQn?=
 =?us-ascii?Q?eCWpF+sW5vWRnflSKtU8NVEYh3tOJPNh+ZbVRTVTmEuuqNwFzOk4WZ7xzQGc?=
 =?us-ascii?Q?f+9Wzh6wVXFDXPTI0azOLuCnH3Rmd718npk5eeccJEeULxLygJpef//bHvba?=
 =?us-ascii?Q?lZoyyuSNH6tr5r2OHDurUAm0umdcGl2TIgP+2iH0h7ZAla43doVHLG660/rY?=
 =?us-ascii?Q?972Ja3881MxAtRh1t5QKQm367gw7tFoozga0q7TGpT+sOZT02/BIDedn+Jo2?=
 =?us-ascii?Q?YwVnh/z1+Mo3VN63Fo82krMxyb4QfIE86TSwX/bnOB6VR4vBBR53hFw4P+OX?=
 =?us-ascii?Q?E0m3/koVVm5A5K1t8dG/j6F+lg7xKJM7cdQpN4FU1FlcIhhyFvSCazYvYhcI?=
 =?us-ascii?Q?oIxoqseHIGP+IrrgMBnc1DBsemlwQ8tQTFXakODI5JX1d1eb+T4pfydCoJiO?=
 =?us-ascii?Q?9LQ/20PE28SRy+V4iOcDVWoVcnMRWLQUzwtq311KRP7bJk1cD1p06/fbovup?=
 =?us-ascii?Q?+hl2FZGFMp4n5uxJCtnzds32kGcpzAWzMMeLHvMYAO7DgPOuvUBYxF3i7WBC?=
 =?us-ascii?Q?96blxy9sWu2LH1SUT3+QKm1OUWAgLGd83XfuNn8YEJFldHmeBp+WQEcBQjjE?=
 =?us-ascii?Q?+WF8pgDHUwPb6D//Z+X1qa3ifL09ID5g8AZcLvIzncrNg9WLFefs3MYywI30?=
 =?us-ascii?Q?CnzRDhr6zBy/a+lUSXSyXqkPcnGviVB0oummR4a/7DYzSYNLkPxhXAELRzo0?=
 =?us-ascii?Q?CRtgPMJ3ZSV5n/uLwyamyHy8J7HL4t/JTmmhlYu7Sco1HHIqzzTrqQA4Eu1/?=
 =?us-ascii?Q?qHp6rJgFlyHtqyx7YhKy3kCky5PCNwo/ZoihDWEW0YJpkCocAVdVSWnnTPha?=
 =?us-ascii?Q?z5CeREj9lk0a9LXNCCwztIaRS5Jfqqw8FXqP2mSWa4GT4O4fHWNBsiwMNWIK?=
 =?us-ascii?Q?Da+QsNPW9Sq5bNRzhbv/n80QMcPTMTef8LcvDA51Vx3IHgj1IraudSRD/sQV?=
 =?us-ascii?Q?4SHDuYkHk8WovvNBcUZ9EDzIyYIlQfz416FMtnzyojdEeGncQ793qmivt6dh?=
 =?us-ascii?Q?3d/DNMgfOl+AmtN0foKRALzD3Xj9x9tp8Yn04yEZALLNQQjHLeVHxF3fuk3B?=
 =?us-ascii?Q?nAsLGU2u0g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dda2f7-2edb-425c-b45d-08defda54aca
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:30.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JM1Z3p83xCAIElXllybSVMiWR8vYWzC/sPfv51BfEqFhl7Le3NQvgIK0BgDSnfKGQTOeOysyB5UcqAA+90/8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The receive path logged every message at the transport layer and did not
distinguish events from command replies. Async sends shared the RPC
sequence with waited-for commands, and GSP-initiated events arrived
with that field unset.

Print a distinct debug line for async send, sync send, event, and
command reply. Number async sends and events with driver-local counters.

IS_ASYNC selects only the send log line. Every command still carries the
next RPC sequence on the wire.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs             | 111 ++++++++++++++----
 .../gpu/nova-core/gsp/cmdq/continuation.rs    |   1 +
 drivers/gpu/nova-core/gsp/commands.rs         |   2 +
 drivers/gpu/nova-core/gsp/fw.rs               |  19 +++
 4 files changed, 107 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index ac3e6642031a..d3afe3f9bb37 100644
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
+            self.tx_async_seq += 1;
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
+            self.rx_event_seq += 1;
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

