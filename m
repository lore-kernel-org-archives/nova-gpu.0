Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F7934A78E
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405340; cv=fail; b=pyUiDdCyehI/DabOGH6v2YIAs/GDhoyA/SWF6Tj0eAnwicWWP52H7bCfo7wNRSOMe8QuOd9SGOHqCthxcEclIkmwD8v1BoOnofUJOeZ7GCBErN5WjeivTm8iGwfPE9ezWkwzwFtmH16yIKkN8D0rUJU11LFgMM6LdEOuYSP9lTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405340; c=relaxed/simple;
	bh=Tywzt1Xq6u+u556aiaBSXLpXbBOgdCCI1IBa7TCj7nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NwYDA75tlgrLLmRDS2ySDyumxtcIjoSTq3pMrG3jAZIPYknZ4+dcQg38ooz975lT0bopL3BNTzhYrer2yhTVKSKNWRjXWusKq6ewbWLlv+rZ3jnTGQKkuqGKldEWDTpy99yr7jbKrae4b9wZz/sHVTfkZ7hVODxdDVbVVpAJx60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RUkgbvH1; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RUkgbvH1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSGGyRimnOBS8RoCJiuwxmNMTiwiniKosljqYOb+me5doboQ6I2oAg3+O05hSN5arVvmIaRtlESQtx9IjtAPow2aCOxmQzNb/rPwhVZTvLkWbUqQ7QcL80i991PLP8RQsodbLPtAngNowEuQlbq9ln8j3Gp4THnQXe5j1c6RfHDck7eLw+BvmswoEC+iMpxhACVy1To3lKvvO+ic6wGiCcP5IdHd1hlziIFCdxe8z1b5KOjv3caQuVq1Mx2FLIq9D5ikplbf9ZgpKNDk7fPyjnbXVrHurvrEBtXgEKb5UOoejVoHYTddriJcSXwAkcraJSZMz5rr4eMS5/Rp4JCPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lF9yvtP5COXPlV+AlBxCKkCSkyF51vFfj6KUbVLo/8o=;
 b=tX/MqFvBu0CRi9ps+7+bDZJPq5v8vAp8we1BAfc/i5pkSB7k4jrnAoaddHnKZUUMLbvaGrJIyHsSx423R6uJeQjSP9tkNEqG/vPVWRY1yRDoUKTpM/3M0TbJunJAlXBnV3QRBJo61ZbMGYYl64GhR9+ncsstr6z5nLxLCuHt3EwuwZMA4WdEHEXLupkHym4ygm1FZKCsqIWp8eySFX6md3UE5Cpo+ei5zw3it0NWticciSlTDnrxuX0WX+6EJld6MUmhi/Ves8Pee5soM5Dtwa/do0sUgrGCl22I4A8WdGk+zTnbNxkjouaXp3nQ75rbFgnm9yE2ji9oKXptzgHdxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lF9yvtP5COXPlV+AlBxCKkCSkyF51vFfj6KUbVLo/8o=;
 b=RUkgbvH18W4MUcwCwA+KInl2uQlru8sjyH7oBWxZ+VlfNeT2ePnQM9XaPoit7zuotjNRFT0/d/H8zGXyGuB3CYN61qy9hPhs8zl4vWkrZnA8IdnaZx5WI/V5/1i7rDLeZ0I9i42kyuBboAlan51v3uzw06dwJXOBH+ni/pXC9aYB3DzkRu+in/bUa0tkqH+BIqnDfh5GZ3XvHktVf3LmceIENh2j6yiFIic0sYdyssBMeUbi5PFd3YXjrBkrDHyw221qJ6r3QtV9ms7mN+cA1I37j+ZRnaiXSEENbuKTx3q5UoAKGlqFHJihD9J2NMSucKVu67OyVrRfPaNEIhPIyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:32 +0000
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
Subject: [PATCH v3 09/14] gpu: nova-core: recover the GSP receive path from corrupt framing
Date: Wed,  2 Sep 2026 20:15:08 -0700
Message-ID: <20260903031514.1515905-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 662f28d1-4ae8-48ab-3b92-08df09699ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|3023799007|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	do92NmOtW6Rx9ydTCIQTTcDUlI/7cr5BMkEyuKNzv2iM3YZk2FKj08vPssMPw7EqMjzVZ/MnrWFdoQanlG0kpyJcFwBDsVVi567o0nVwktzvd3EFi7jSi+ank+SIdv83rY8IH1gQ4IPO+OAvuANT+/u1OiK8PsBS0o4J+eP0PUoC8Ukv47m/WP1fGBwhgxC00tJg193YGN+XFKDRnqpvs6oGaCCyC6FQ1+lvdSPjd8dqXvnSif1K46egwTHHSq22k8WPn7HFNUxk7vKCglWgl6ElOUxysmb6f4kXXc6YZNkeTNZPlt6xzFof9Wm7p/aX7E7tCC3I0VEEeclzBK64ScSu7C6kIbGfRn3zTz37p+DFtrXco3GJJYItcY8fk57/6Qh/UFayeSzjZt/krOONijUci48UXvtqlaSUAz/J6QsVOI0amo9NsRqgTJBxtEZrIq6cWPRCOumfF9iQtc4hMOLcg1JgeVHkH6F5HA07okplQO1SOKZmwETPXhRGrT81UvZuJtDc4YXuv1AWbANw37kW2KaevkDf/H7UqoMUaN/OHdWm4wPdtoqwuUXVc2+G2OEScyd7Jr6TOH+NryYoXwocOkA325l1xMhX/hJcMN99npZrufvjtrJeuejrqlU/Kale6TBL3LxsdUshPACysyN+DuVzjXHWpD3wPdNGUUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ixvFCuvdrbKWjqdsYtbevBxX4MgP10xCAbv6dYVTF13G3PIDjl9jUp8S5Ifq?=
 =?us-ascii?Q?p6/KcLj7tkmJEKzEy8IKm+FL8SNgQFSaM7VBH65bJB/7Bx3zXMe9oZcqJ99O?=
 =?us-ascii?Q?Wu+S6xpHfS1DUfY4zPQSmqjYY/O8rBaUpeawIUaoLwOtk5BLpMjegp5VHgwO?=
 =?us-ascii?Q?zpSYxv7IGrKqyFKhlPxy0CopJ1ZPf57uQYaWFAld/YCbgextK4Pwk9jOpOh0?=
 =?us-ascii?Q?i4ns31eutlZd0W8UWZQafR4vQgpr048zxM0Q+5tSW77J11zsP/FVkPL+16+1?=
 =?us-ascii?Q?JDvkLlA1OD6qWaovL8IW3srlRyK6S4xvFy2XFe7g6YjJi4NtbEfdihwEP+fU?=
 =?us-ascii?Q?tvq2CmpLBvm8QNWx8IfXFXIq3+4ok+f/6GhHrwyALyxcRDdbKj6DmikdU9ZL?=
 =?us-ascii?Q?Uefh/kfNwBKandgrmKbMCvvBvyTw6ClYdYuG9nEHityo1bDOdqFBSIT3viE9?=
 =?us-ascii?Q?nJDLV6U26n6jnIWD7HCsk7JR6B6fNJO0JqgeZtIkAcU/qpVTT4vy3vYyZsdz?=
 =?us-ascii?Q?W6ZXXz7jM/V6MOSsGhgE+jZckCU7lGe2LmzEPKEYiwYip/gHW9qiNiTi7CNE?=
 =?us-ascii?Q?+TW+sV3cIHiFL4FU5hbNzdhBIaCml27c4DT2lgMj9ueVonp8kIsG+sKWYzKn?=
 =?us-ascii?Q?CZxYrYbbvl8uhVxbTWnPP8piNNbAj9DQRKmlWYGeHD8zGJ3FthZS0JLu7owd?=
 =?us-ascii?Q?IKy+oGEXOpQvdfH6+II6cPEjXgsigGdo7GVjkAF/9lVQeW4mAPr7y06V7L00?=
 =?us-ascii?Q?6E6MjoSXEqlcFwwBvbfUYbhLiY+7CMkfMFjbPmbqywVZGz0SobAsEae+2AMV?=
 =?us-ascii?Q?5bqTMw6j9LYnYP9DMXVwCHPDpq1s7YpFcoOB/TfML5xT03qUOCLuxwg4ezaY?=
 =?us-ascii?Q?72OXA3LFXMV00jpQSpWzsSU92jqItuwwDTbZBPU973XHnfyMJGkTu/phAYkr?=
 =?us-ascii?Q?nYptiVkSXiRv67JF+jlbMU4C1e/zo7q+r3Z+m4fdR371Aoh1mBlIOGnab3st?=
 =?us-ascii?Q?uv71h32CbqnVH8q/sG2/N6N244tzp8kUwZUk9QcbWf8xUqU2Ov/xo4gGk0o+?=
 =?us-ascii?Q?iQKKsIcH09BD6h7Sfigv88sHLm59kOoY8lTa0MYZgvzxEtOalE6WDZDpwJef?=
 =?us-ascii?Q?tuVEV35p8zCpET7c9L4mNxcbJF6aqfhN+c97dkmYeC0RBDFoBYmojvnhsvHI?=
 =?us-ascii?Q?78A3w4viN7tIa0lcJgr5hHTwYZCpRapNJGyG63NzoNxuc6MVvXURYTw/4v9N?=
 =?us-ascii?Q?ruGlr11AkfbWtxl2XOURjjSPwC8GqOnw9oRARW6dEet5HHN0YzVkIZX55p/1?=
 =?us-ascii?Q?f6zl8CtsNlzW62k/d4F0q3TeJgh4cjVy79OPvKw9aVU8NPE73doW9TW1DoMV?=
 =?us-ascii?Q?pcc7JjOUgfQfVNDS+RzbgV0L85NALrPT82O0guQUm0RYNBnoQSAEbJCPDbez?=
 =?us-ascii?Q?Rp55+ZgdMdvQkdRXxmnyynIvrBhdqJDVOqFhqZ908I1cCWWZrBpIQeg1ZNAK?=
 =?us-ascii?Q?DHq+E3lFeyVC9ejhrvFrUttfSG5XjGIkqw0c98QE8p+hoouFhzfA6Q8hoKji?=
 =?us-ascii?Q?uaw8eYGmZ3LZtmTcs4bY3NQ9nCfhFznbX1CCEvGHUXi4lo1XoysWDgP7yJNr?=
 =?us-ascii?Q?a5RdI1ZM7YR8ALfKw+l/Tflgdwry7agx/A+mV5jEdv/NjvOggT0X/w+a5v2e?=
 =?us-ascii?Q?1TV7TwOCTthmsJ09dHfFrXYeA18QHX5JgtmJzPePQEKy94wi/G8soxqAYrUD?=
 =?us-ascii?Q?7EYvKqVUzw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662f28d1-4ae8-48ab-3b92-08df09699ae4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:28.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMILL8mLoisPJeFtf76l5wvIgrj2V/+fcCGgORCgCqV88WvxDZDK+xj2Ci30Vt41LZZtb8hklk4K/p6DLAyalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

A GSP message carries its length inside the checksummed region, so once
the framing or the checksum fails, the length cannot be trusted to skip
the message.

Two paths left a bad message at the queue head. A framing or checksum
failure returned without advancing the read pointer, so every later
receive re-parsed the same message. A validly framed message whose typed
payload failed to decode returned early and did the same.

Poison the queue on a framing or checksum failure, log what was
inconsistent, and fail every later receive, so the bad head is parsed
once and recovery requires a reset. Advance the read pointer past a
validly framed message whether or not its payload decodes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 96 +++++++++++++++++++++----------
 1 file changed, 66 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 5572224db233..ce4d6a111e68 100644
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
@@ -531,6 +535,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Err
                     dev: dev.into(),
                     gsp_mem,
                     seq: 0,
+                    poisoned: Cell::new(false),
                 }),
             }))
         })
@@ -624,6 +629,12 @@ struct CmdqInner {
     dev: ARef<device::Device>,
     /// Current command sequence number.
     seq: u32,
+    /// Set once a message with corrupt framing or a bad checksum is seen. Such a message has an
+    /// untrusted length, so the queue cannot be advanced past it, and every later receive fails
+    /// until the queue is torn down and reset.
+    ///
+    /// A [`Cell`], so the shared-borrow read path [`Self::wait_for_msg`] can set it.
+    poisoned: Cell<bool>,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem,
 }
@@ -732,6 +743,19 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
         }
     }
 
+    /// Marks the queue unusable and returns the error every later receive fails with.
+    ///
+    /// `reason` names the inconsistency. Without it the failure is invisible, because the queue
+    /// just stops producing messages.
+    ///
+    /// Takes `&self` so the shared-borrow read path [`Self::wait_for_msg`] can call it.
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
@@ -746,11 +770,13 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
-    ///   message queue.
-    ///
-    /// Error codes returned by the message constructor are propagated as-is.
+    /// - `EIO` if the framing or the checksum is invalid, or the queue was already poisoned by an
+    ///   earlier such failure. Either failure poisons the queue, so recovery requires a reset.
     fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
+        if self.poisoned.get() {
+            return Err(EIO);
+        }
+
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = read_poll_timeout(
             || Ok(self.gsp_mem.driver_read_area()),
@@ -761,7 +787,12 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
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
@@ -775,7 +806,11 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
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
@@ -798,12 +833,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
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
@@ -824,8 +857,8 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
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
@@ -838,23 +871,26 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         let function = message.header.function();
         let seq = message.header.sequence();
 
-        // Bind the result rather than returning early. The read pointer must advance past this
-        // message on every path.
+        // Every path must advance the read pointer past this message, including a failed decode.
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
+                None => Err(EIO),
+            }
         } else {
             self.classify_event(function, seq);
 
-- 
2.55.0

