Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02A2387341
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188280; cv=fail; b=qh/vw2N7EVXjy4gCNFzMrMwYReG63/XBB1sDUs7j+6iyxSgC4NIz1pzxx7/ONTvmhOxgbBDLaH6xuNQGcPwBmGAPeN9B6jYFNZANW/s+XGvL3rOuF3FNmBvCyraVnDntfdXPHuGt8dte7XU4o01/FiMZukloEaIX9v/ZIwOTuok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188280; c=relaxed/simple;
	bh=WW/Y3KA7WPwMtUKPxBo0pXLLlTnzqK7aBeuxJOwjfAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N4p1cEwNMjsfC6Y5dTXMeJ0tSZVipFV0sHGMfM3IVUZ/Xbh/NXga0p9Fi2EzaOx9egB/SC6udV3XSPp0kUdY01ycgH7RB4Xgr7eLVNbOxW7GB+wa5PVVqf/EB/pmbtLDT0QxQRfGj/E8X5anh97wjGx6/aBifwqHnxrl7Qqp+Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RFcfSUTH; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RFcfSUTH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDFK0AyxaAYURA31QThqIsC8a6Y7zFnjzf3YjVxNJzYkC6VaU37pctk5vJ3bKxqe294cJr3NcmvIbwVxyCg8U4d6yicIC9L6DWOL8p1xffOBe3lc/lbM3kCAAg2nAFKfdLMQLU9sGXinvSgFsE82N09qR0I4UaimKNb02PmN0GpNAAz+fKK3A2bOUHx9Otnj+mA1A10/JuBnPuI1JuJViNoNHTxjBEnn44UBFGcVU+qnVtSiRXwB36Kdlegd4trF1nuVaeif1E5L/EYfCFzKUiK/j22P/9COh4T22PitkxJjwzCyP++8F1Z28I5H7NGX/1lRS6gQ8ud7Gjj4yl3/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xn2ufhsvt20onXv5PQfiCwyQUfw4qw2c39BcxDi7LFs=;
 b=WeqErB5MzJAFhLaSLtih4z5C+0jnthHhPmi15Wmd3x7VpFF4cD0Y/kWrltNk+KAoZ2xy21f3aAzfo7tndEUY784g6IMr8j1bllf+vDinSRgoTz+BERl7zIwi0WFGvt878Rrsl//l5Kv2NP68vS6GCh1ca0MI9F/s36DaHsm9PxfsBUtykxAKKBqkU7WdE4xvoK7rOLY+vfnykMIRIYGnBxQFYGs+5hr5/ounvTXbvShmVfrCe1WtXI3hJ4+RKjIh/UuO9bmdfiCVd1YFed9LmcP4uTn9P/5zqlmZrm70dkKTk69M08/VO/9Uw/WhxmhRifmwjgyFpj/tZ4v7aXScaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xn2ufhsvt20onXv5PQfiCwyQUfw4qw2c39BcxDi7LFs=;
 b=RFcfSUTHiCrmzzdBCHdtPsZa9wmCTrJWIT7znsATLlyBc7+SbFb6danthQFd9hKAhjJfPR0Ry8WxiOL0qcwR9dekg2DKWWO+IShK6rInBSXARV0xjEP6+hXiXoEal6vQmscgNhrHXPWVBtm7E03BldPPw7Eia/iK+NoOyYzi2LHl19MsWQ6BucSCOxg+2PuXRozxRFpSaXw521gyKz/AM/GoNZGMwCv0icoRqsb3+9s0KlLdYeOqFibWC3yIGzMjfyQD7n2QBgcIuJyptKUc+PZEQXrLzqvjYu61OIkt9RUIBPPA2JQvsBugoEerlA8zfMa/LCX50NgZcHDGMyydpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:24 +0000
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
Subject: [PATCH v4 10/17] gpu: nova-core: stop re-parsing a bad GSP message
Date: Fri, 11 Sep 2026 21:43:53 -0700
Message-ID: <20260912044400.677097-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f85a85-480f-470b-2e14-08df1088850d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|3023799007|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	/v5JsaYrRl7DrTdSqAhoJ68T1RLcgfo0867h+mMwc5bZisbCpjMI0tl6pX5vKgmQsbHBsB24LcsBs0ox0LnwIyTU2ed2ws8WsdJy5zvN5Payyn87dksiJupIcoDdQF3UMTh8MZaGSnoht13IG+hgmUCCEE1mFn4l3QjVlGvwZkCnvrJ2gyaiNOWN+lSOyQGWsyDVaqUSY1pvWxUSnTg9hkh/XjDoVt2wyAwz4phxBiDfB/vBweStV9pe6mrYP/xAr9fnMrNxA3Nn9SRny5sNdrkt3L0zcvdjikox/N4OskrHK28vcGZCSBHlWzPg89h2P2jzQELobQOnpT39b8uPN0cwncwrQAZESEI0OrYEHJEOKMY1vuuHLZ+ynTOfaT73xFRfOWOLIFnxj4qHgemQ6K8PcaxJ9XyDcK+Utrb5CwPWjZyGWkzSp8aHFRFqgCJ8P9LL9tWYxUIKObLRoSYAtl0n1D/O2/3TLIoa98sai/HJ3bixPI0nE18ELsPMruHYXeK6CUF2CNY+OzKxxEOIL3Dv4OXp1KfIEITw1Z+lsRAvB8KT3ZAS+Jsy/ga7rBnErSQqlqtHHpD3mEwZQ15Ws71F4zzBWPcfLdNrD5JXyGI+CU12Z1OxuvoNZjsIQQ7QixF5+s4DBxYmw6z4JL+zDFqqsCt7OsL94RMTlXO/Cg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPgP57zGoFcsfJUHKdCud5a/gBzDF+7SH1vc3IUTamvYqJ0nenqiHF5sBVbk?=
 =?us-ascii?Q?1WayrPBlhRi5zVtoK4x1ujmBWDUGvsGbzjgfzDG7DeR7e8dJSeVTMQXxo1fQ?=
 =?us-ascii?Q?8T0tD/zs4G6fnpP6CImOALfEL/+hTM5DkjSXLsD6vE5/l7aK7Q7kDaX1zLSz?=
 =?us-ascii?Q?s8mu4L/odsRJ7Nx/4kQRd+ZfPQB8CbrNlaYzA7HAeqdXPnbSlFafIuL/K8JB?=
 =?us-ascii?Q?BATumW3y2f3+xkRfALnImnThr29GFobGsbsfCkamuLVbL8+nK7rKmU+0EWv+?=
 =?us-ascii?Q?khhj8XXVuf6Eo0LOONJgRRpO6+61fRHub7eriqNiiw5iVfSm29u+9iW0S6gn?=
 =?us-ascii?Q?Grk6rOCH4Yik6oiwiQyUXIYnjDF40VieZl1xlk77p1HYJiUWdM7tsvHZd0Pm?=
 =?us-ascii?Q?EyuZ722nhTEcSP2OQJ1c8Y6W+wUMGwXCxE2NSYNqVxGV228TSnT5RW2trDcn?=
 =?us-ascii?Q?7mRWilvghy/nP8C3a6C8GYyN6kFx7BMOz12GCYt8WIOlxsGF7yyrk+8284nt?=
 =?us-ascii?Q?WFapijhSIOd4KupHUm73KXOC3nE+ufjQh6We+wewzytV+LLgCaA9vS5iauDQ?=
 =?us-ascii?Q?TBZs+HufChc6qjnPkncHoXPM/ZOsFT8v2YAb7dcqdvb02OG4r43bgys1IAsO?=
 =?us-ascii?Q?kUGa8iAlClZOLiWRUczbQEbUwcUmfSsmCJOg8XveXBlAuGmFcZsR28ZrOs5z?=
 =?us-ascii?Q?yfF2H/prBPkUQAPuJesYSXb9VRHc1tWSeIatpiMOS2gk9E7zf7masILz/FMb?=
 =?us-ascii?Q?0LYtfNAOKjz7tPaNA4FCecKKDPCSSQ53nGxiSTHP1ETGbGqCmGvjh97z+J/p?=
 =?us-ascii?Q?eX1IDrrR89KoEPXDT7CLDvGJBdAjGTpMHRnfWQHjKTqqAgYcquW0/4lRIzLH?=
 =?us-ascii?Q?xN9rHlirbRl6i5yUrokG7BNvjD3B7Rzqu00zQKGhPyFMURhnRylYmDMixz1G?=
 =?us-ascii?Q?zi3Sf9TYOVl7rNv6+mZsUjYan24pK90OYryjF/pWuGO8v7XnTgEkftmOXZWq?=
 =?us-ascii?Q?WFY7M0kD+kkgaXenGfaWLErkOFBEsht7TrG0GGrIpbX6S5vF8PbnOVnVsmu8?=
 =?us-ascii?Q?1g4ajGf7NQj7gQoFHswnmgLtKRRmlmDCX/6mXOQmtK7AoZ7xqlm89rkhYTdF?=
 =?us-ascii?Q?y8mT3ENovleEYCnDnOH1NPx679xOq5ECfaKIeVgi1slI6GQ1hDMZoVb7qPpv?=
 =?us-ascii?Q?OMyLi6//RlIEyvjHDm2gintWHApJ+2G7kgH12flPMssNlNDxbCj8E0xD6bFR?=
 =?us-ascii?Q?vQwo3lrjkv5nUxpXaveiAccjRYC7jo0wa5jjLX16mVtZM60WhDJEeXc6ph5X?=
 =?us-ascii?Q?JrhBPNO9LoGZ+gCGM/3mRkIoW0hTezjJoVPGazRlcp2pxOX7L4AKSrWKzr4y?=
 =?us-ascii?Q?58Yxp4FATSUkfl5e0Vr5S+9InARot5uoxadYwT6csm92a8cRdhkxRxKPB9kU?=
 =?us-ascii?Q?Mpht9T9Sv6M8MmAUPi95vYQqwdccFJANqsP7MowHeHw9tuwnB866fs2LmuDm?=
 =?us-ascii?Q?aoynY8GPzWDoYadtagoMFapoX/QRCOOEzc5EHADL07tf5+N9PDSCMvxw0jJs?=
 =?us-ascii?Q?GRANqmcHnf4FhBBNQXssSiYWE+tf8/2m7DiHkMII2te8bvms8VqmI19mW4MA?=
 =?us-ascii?Q?NM/XfCJNzagSHEltgccd9Hui0J54hH+82v96UcBGRs5gZbUAQT+CW9s6z+3u?=
 =?us-ascii?Q?A4jcnjUONe8a1nIytRai1bpEqr9UX6XzY1ireMC7BgVMGuM1wTOdUmSeWBBE?=
 =?us-ascii?Q?lZX4x0L+WA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f85a85-480f-470b-2e14-08df1088850d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:24.5103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJZCFweTxahwAgnFckE7yftUgw1g3sxOtR1q+D09Yg/ShxKWCKAZZ5726a1JFlI1UeezvYqRVf2jR0K6neyHuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

A GSP message carries its length inside the checksummed region. Once the
framing or the checksum fails, there is no trustworthy length with which
to skip the message.

Two failures left a bad message at the queue head. A framing or checksum
failure returned without advancing the read pointer, so every later
receive parsed the same message again. A validly framed message whose
typed payload failed to decode returned early and did the same.

Poison the queue on a framing or checksum failure: log what was
inconsistent and fail every later receive, so the bad message is parsed
once and recovery takes a device reset. Advance the read pointer past a
validly framed message whether or not its payload decodes, and warn when
the payload is shorter than the type it decodes into.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 93 +++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 340760e384d0..855c5a708525 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -2,7 +2,10 @@
 
 mod continuation;
 
-use core::mem;
+use core::{
+    cell::Cell,
+    mem, //
+};
 
 use kernel::{
     device,
@@ -11,6 +14,7 @@
         CoherentBox,
         DmaAddress, //
     },
+    fmt,
     io::{
         io_project,
         poll::read_poll_timeout,
@@ -532,6 +536,7 @@ pub(crate) fn new(
                     dev,
                     gsp_mem,
                     seq: 0,
+                    poisoned: Cell::new(false),
                 }),
             }))
         })
@@ -624,6 +629,12 @@ struct CmdqInner<'a> {
     dev: &'a device::Device,
     /// Current command sequence number.
     seq: u32,
+    /// Set once a message fails framing or checksum validation. Every later receive fails, since
+    /// the bad message cannot be skipped. See "Draining the GSP-to-CPU queue" in
+    /// `Documentation/gpu/nova/core/interrupts.rst`.
+    ///
+    /// A [`Cell`] because [`Self::wait_for_msg`] sets it through `&self`.
+    poisoned: Cell<bool>,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem<'a>,
 }
@@ -732,6 +743,14 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
         }
     }
 
+    /// Logs `reason`, poisons the queue, and returns `EIO` for the caller to propagate.
+    fn poison(&self, reason: fmt::Arguments<'_>) -> Error {
+        dev_err!(&self.dev, "GSP RPC: receive: queue poisoned: {}\n", reason);
+        self.poisoned.set(true);
+
+        EIO
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
@@ -746,11 +765,13 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
-    ///   message queue.
-    ///
-    /// Error codes returned by the message constructor are propagated as-is.
+    /// - `EIO` if the queue is already poisoned, or if the framing or the checksum is invalid,
+    ///   which poisons it (see [`Self::poisoned`]).
     fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
+        if self.poisoned.get() {
+            return Err(EIO);
+        }
+
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = read_poll_timeout(
             || Ok(self.gsp_mem.driver_read_area()),
@@ -761,7 +782,12 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
 
         // Extract the `GspMsgElement`.
-        let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
+        let Some((header, slice_1)) = GspMsgElement::from_bytes_prefix(slice_1) else {
+            return Err(self.poison(fmt!(
+                "read area of {} bytes is shorter than a message header",
+                slice_1.len()
+            )));
+        };
 
         dev_dbg!(
             &self.dev,
@@ -775,7 +801,11 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
         // Check that the driver read area is large enough for the message.
         if slice_1.len() + slice_2.len() < payload_length {
-            return Err(EIO);
+            return Err(self.poison(fmt!(
+                "message advertises {} payload bytes but only {} are readable",
+                payload_length,
+                slice_1.len() + slice_2.len()
+            )));
         }
 
         // Cut the message slices down to the actual length of the message.
@@ -798,12 +828,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             slice_2,
         ])) != 0
         {
-            dev_err!(
-                &self.dev,
-                "GSP RPC: receive: Call {} - bad checksum\n",
+            return Err(self.poison(fmt!(
+                "message with sequence {} has a bad checksum",
                 header.sequence()
-            );
-            return Err(EIO);
+            )));
         }
 
         Ok(GspMessage {
@@ -817,13 +845,13 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// A message whose function code is `M::FUNCTION` is decoded and returned. Any other message
     /// is logged as an event.
     ///
-    /// The read pointer is always advanced past the message, regardless of whether it matched.
+    /// The read pointer advances past the message in every case, including a decode failure.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
-    ///   message queue.
+    /// - `EIO` if the queue is poisoned or the message fails framing or checksum validation (see
+    ///   [`Self::wait_for_msg`]), or if the matched message is too short for `M::Message`.
     /// - `ERANGE` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
@@ -838,20 +866,27 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
 
         // An early return here would leave the read pointer on this message.
         let result = if matches!(function, Ok(f) if f == M::FUNCTION) {
-            let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
-            let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
-
-            M::read(cmd, &mut sbuffer)
-                .map_err(|e| e.into())
-                .inspect(|_| {
-                    if !sbuffer.is_empty() {
-                        dev_warn!(
-                            &self.dev,
-                            "GSP message {:?} has unprocessed data\n",
-                            M::FUNCTION
-                        );
-                    }
-                })
+            match M::Message::from_bytes_prefix(message.contents.0) {
+                Some((cmd, contents_1)) => {
+                    let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
+
+                    M::read(cmd, &mut sbuffer)
+                        .map_err(|e| e.into())
+                        .inspect(|_| {
+                            if !sbuffer.is_empty() {
+                                dev_warn!(
+                                    &self.dev,
+                                    "GSP message {:?} has unprocessed data\n",
+                                    M::FUNCTION
+                                );
+                            }
+                        })
+                }
+                None => {
+                    dev_warn!(&self.dev, "GSP message {:?} too short\n", M::FUNCTION);
+                    Err(EIO)
+                }
+            }
         } else {
             self.log_event(function, seq);
 
-- 
2.55.0

