Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8C382371
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158709; cv=fail; b=RdIPneQJMQ9Xr7FuhlO98Y+44J4awmWqmfEmO7o5UdZc1dUfpzSL5DGrnDvV/8jK2fvJIFZimAYLQS0qIOtNCk4hKiTVYWPBlWVX2L/FCcBFbU2TGwIK888o4bY/qZLTxAntSI6EEtF1j96CCrrw8/NJo5KXOad/66E2M4QXZ24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158709; c=relaxed/simple;
	bh=cb1BJP5hFXYyjNUy0wLD91cq88LIXOpAhchYphk88Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uj/tyEXEXzh18m9qbfi8VEBSKB/GT4S8jj2USmJ7ke62DXT07PsxzZMFEF1dTsLOQ6K+aG5+1vVQ0zMv5H46eUFz84y4Jk/tOjGTVm3tTRK0y0Ztu9Bd1ee3/zyn4EF/MNKr0qk0T8sBlWBP5dF1KQ06uPNmWW1rhKq3fG0yyC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RRMHopd4; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RRMHopd4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD3kCTI94kuHi6CMWLCqfGurzda39J16gVcNPT49yzKUC4BOZ26TC4jf1pscxyA1CPSO1yIuuQBbUMC4rNXWmYlOhPhnZXYQ9sBREy40MjewAK0Jdgnv6In/JCDh82a3m00g+TT4EkOacOtDXDfEyTLg+F1Fj/XpvA7omaQWk+VbR86viucEbLA0JJEdjpHAkOMsEFw5kccxPNbHuPWqWLrsgZZbZi1VEFdt9ysFmJ8oBhTsv7n/t+y6UobkE6YLAAp43nEX/AWuBFfHtjgecPtQ8VvPd/q2HKsqsIqTYLWsEqCAL2Gnq/2lS0Kt3jpVlM2bTAwqamo0jn9x+dmbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOClEYn0U6XqlU0chrPSSjOr5hlhCqX8US9UPEIyJH8=;
 b=R7eIZ+Q1KeYvM3CKJvyQtAm2fe4g9PElASIjFEJ6RyTE0RArylxIUsa1vFAhn9jdVBlm22xW6smsaS48MvcTndHHFPjKbtwomaRvMASC3hqhrQNGxIymsKDvOOldXu6i9K5pADrZsjQKFdPxEkYgnWMGyxBZLoaoTVWf1VTty33q2h2Kipkmk9fuQEvaPIpmA2DXm6mZyum8tPai8sj5Joyy8Muc3paEwHL6JYohBX7Wd+IzKHTuvmrODqhgbOPf4dB8jyCCVOZueMxTdXGXJRC+/PX5qEcxih0qaRzrFF5y3+IydBjBKOWU9MRYbvfnfEjoGCj0QOtjHJSBIWpUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOClEYn0U6XqlU0chrPSSjOr5hlhCqX8US9UPEIyJH8=;
 b=RRMHopd44rkDEr5WhUsc9r/0UWnpLD9LFrpP2NZ3LuTwVYZkkoYrR6wEMBje4o0mTDk3SHpmJYrHo1SGLkwN9BPE66fyBtNl0kZIJz4SkzfmZv8LqJEnJYIn+zYBly2tT/rUExil8EacPdwqkuvOOFVcwgsLuHtCQvnMjWjAxIYBrojm9uDpaNZyuku33nc1nmNfbCSABzUY0I1hGkuRudxREsJQ0dVtpHCKFckS1lZ/rebWRjCGP9BoPArRrb3PN9dGmAd8Naz/k4n46xtQVnW9aJzV2tmPalrAEEFbkqYiUMeEeT6+ELtpzpjH2n2RjTmxktkr4ATJYaSsJTINaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:37 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH 12/17] gpu: nova-core: recover the GSP receive path from corrupt framing
Date: Fri,  7 Aug 2026 20:11:14 -0700
Message-ID: <20260808031120.363869-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b16b30-a37a-403c-629c-08def4fac22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7NLcoI3/+Lu0Wpyqk0TMmEo6/v9yOVuqO8FbrWXICWM87ZxP/p3yr+2jBZkqkmNZXLsypIOpYpRxMkHAfAMf47wOm+qOhzH/X4uWXd8ZscB+Fr42zoQoKZ0y9CvPPALpjrPWbSR9UgAvQpXdTMZYBuJk4cJPhIlvlEQHPrS4FW7AObPOTujz/c+DvZNDBTvjKW5qptEI2NmQA5+8TGUAvA/8mUkVl5q4qCQhaL+Cs+8UAyxM5AIK/zVCaTxnYC8B9kTYZJzJ1y/TCay/tIU9mk5Mr3FxWmZbUtDSundtjEpbWTtjgVbHQkfVhLGQ1YoGT2migig5JjRaa/hF0M3x0Mq0qDXmhI6n1bZvxn/FhBS/hh3dlAK1sQiy/POV1X/L3iB004nfFrYirDK4bKd5JXkmoBCnqvL0OHILz0HHvuWi71JVwscY7x5GIqFwp/nQiiC3sQPrv7Jmm5qYtuxuZX0k/b7aUBLiuqaJvSLA0209tqe7UVJ4MzI7Ga6DEzLDuNbLT1HwQhhmv0rnd03jTU9XUZK88L6Aenu7yLj7ntryUcQo23/UaVNplkI4Tnmb1BiB5gKlwQ+ZMC9OF5EFywk/GguXCWUQPwoD8Im840x6ML2FQMspnpK58XtkeNsQPziRJ9aLC1jMHalH4GLytA1yDGnz/ZAt2imeoXw9gqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K/OIeYdHZxl92WGbur/o8SN4iMQBkH5vslfngDUOeIxXt+HG0MqPvLdM6uc2?=
 =?us-ascii?Q?v/acx/P/hb59J0zhkMS8t0ybqCY2Jcba1UizqZDbe1E5n9EUiozVhobpXhU/?=
 =?us-ascii?Q?9Ss+MXgO3eUDgXJyn5okf5vtVXkxCAXMUERvMgG3xKwtz+3z6JpBQNV7zDfl?=
 =?us-ascii?Q?h61fRdNqbLvR0yzzddOnZt7C8s/aDg07WuSVk4qbhStI/kfv+VNtG1ql2kkp?=
 =?us-ascii?Q?gYAkw6BpNpGmqm8+q/IkBvGt9noZ2mkbqWEPYTff8ZywSQxFQZzxl01n7kl6?=
 =?us-ascii?Q?ZhXNV987pYeRSbvTwzQQHOGs8Gml7LsxraoI+A3c/R+Ujj4jMu7vK/OkMsVV?=
 =?us-ascii?Q?zw1vDG1ew0oQ0FHj4/BWPf7LtPGQN0cWDJR13n2L43+1cBhDN9FZmN5ajJvt?=
 =?us-ascii?Q?L76r2kpjrp+Pyd6svwG52fvvnWW3LuSO7tWiNN+C7ls0iID/m23IWZE/nPkO?=
 =?us-ascii?Q?nFXMu7iE8Zp0MZZdIvpzpDmHvknnl8c1NQ+quz17CmWqzNheCWb/uhmESW3R?=
 =?us-ascii?Q?w5YuKp0SPqoEJcBjCoGuCnDyKwcMgOo0+WzbRoc/XMr8jD9bYffCp0F8uyX2?=
 =?us-ascii?Q?ujRhcPzqo3GDU+CDIa5AlF7eGQ6tKoB1cxM0ICmtkfauWCssn3PNGRsA1NSZ?=
 =?us-ascii?Q?kBVr3eSaGzFXlOAnJalzVSWBqNMlW/9ZAtg+9aw3InbhDGb3EPMMXvoQG5BZ?=
 =?us-ascii?Q?C42n7Rzev9Whn97yT8JdyGhaMVmVvKsjju9KqWTOYoZDO8FlQaPx2QM044fn?=
 =?us-ascii?Q?xXljh6mzYMDU+qG+U97dpcC+raFoB4wHSoRlLEaLyI6XrgX8HA9bVkTIHS7J?=
 =?us-ascii?Q?xX5I0TXBcNZbZK72kqPbR0r8dfTnrrJE2MRr/YtA6SXZ98wf4snBL2YFejCx?=
 =?us-ascii?Q?mGZYo0/fcyl9UPkI5X2bMXSrtdg0tZhYLydc0a1IG5u65psznycfKaedb12m?=
 =?us-ascii?Q?/8Cbsr5c6/KrRxPLliWV4YwUViGEYRpBA7Y5gvNKP4olWz8XSQBBOyNpY14e?=
 =?us-ascii?Q?rW5J++aRrid0+xHi0mRClurxrwtuGvRLiahgI1HCreg0y3tARyXA9NgJZj9T?=
 =?us-ascii?Q?gCRaiGhPI1PTrGrT90ftfjr8Oxc00tJttmOPsK1mB82lc++6xW3lDRx7ussj?=
 =?us-ascii?Q?Nxp/aD5/7mXacSCoMEkLvywNW9p4IbDtwL2NApCjSMdVI1QEDZ75xAnq+2LN?=
 =?us-ascii?Q?rC9fsfAyU76m27z8dvKucwwHqeQwvmWy9zuellCNhuvrQBzKKA404wMXq2G2?=
 =?us-ascii?Q?nr12v6pUERE4eBMbRu2uSA2fuHaDYNZPoEsR2+asgDBi5jQ+NeAUuHiFninc?=
 =?us-ascii?Q?AwXMsPwL/RWvmHN5ZhTZxHfmGuw+SeCbj7L1IFMai94GtN5Eqfz/mVIrQNgK?=
 =?us-ascii?Q?rx+f9SRGY5L/MGAHoKjuifAEl36NM8DZNXW6OkCJSNyCW5fMaBjKnRdtrVEG?=
 =?us-ascii?Q?ipu8GoAeeDVF+Cq400PiLnIqSy4yYxLOkEqEr4/ucqKrmWlgLeylF9sYhCqC?=
 =?us-ascii?Q?I1KJM+y9TFFuaCf7G+sSK6l5MH9GvXy/fFvBDP47RrGhNe2/b1QYt3vsXdmB?=
 =?us-ascii?Q?Lqs3iUeaDlhCPGQNI7h2cyxdNJsiWqGrLUj/QxCBwqVM+1qjhUFKvT7gszh0?=
 =?us-ascii?Q?rQY/lIsmidGPGFYPIzcE0lC3SI2HStuGrVVwo168n9yvjfSqpAbs3D47n+LT?=
 =?us-ascii?Q?fYdBOtXl0KYrpMbRXtRMDKXEk5lkd0XNq9/AJZ9AhOu705n2BCEx5AIyWwQp?=
 =?us-ascii?Q?KOMK0IZblg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b16b30-a37a-403c-629c-08def4fac22b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:37.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jPWXookl5+d5G/czKcV4TQc9EXPZzcj8t1y3zSYBtNl6HTl7cHBISfoZSKgqFqbc8W8+5Xrs+i0cpXv8OO3eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

A GSP message carries its length inside the checksummed region, so once
the framing or the checksum fails, the length cannot be trusted to skip
the message.

Two paths left a bad message at the queue head. A framing or checksum
failure returned without advancing the read pointer, so every later
receive re-parsed the same message. A validly framed message whose typed
payload failed to decode returned early and did the same.

Poison the queue on a framing or checksum failure, and fail every later
receive, so the bad head is parsed once and recovery requires a reset.
Advance the read pointer past a validly framed message whether or not
its payload decodes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 63 ++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3224079abf7e..fc4c229b8b9a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -3,6 +3,7 @@
 mod continuation;
 
 use core::{
+    cell::Cell,
     mem,
     sync::atomic::{
         fence,
@@ -523,6 +524,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Err
                     gsp_mem,
                     elem_seq: 0,
                     rpc_seq: 0,
+                    poisoned: Cell::new(false),
                 }),
             }))
         })
@@ -622,6 +624,12 @@ struct CmdqInner {
     /// [`CmdqInner::receive_msg`] match that reply to the awaiting command. Advances once per
     /// logical command.
     rpc_seq: u32,
+    /// Set once a message with corrupt framing or a bad checksum is seen. Such a message has an
+    /// untrusted length, so the queue cannot be advanced past it, and every later receive fails
+    /// until the queue is torn down and reset.
+    ///
+    /// A [`Cell`], so the shared-borrow read path [`Self::wait_for_msg`] can set it.
+    poisoned: Cell<bool>,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem,
 }
@@ -748,11 +756,13 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result<u32>
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
@@ -763,7 +773,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
 
         // Extract the `GspMsgElement`.
-        let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
+        let Some((header, slice_1)) = GspMsgElement::from_bytes_prefix(slice_1) else {
+            self.poisoned.set(true);
+            return Err(EIO);
+        };
 
         dev_dbg!(
             &self.dev,
@@ -777,6 +790,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
         // Check that the driver read area is large enough for the message.
         if slice_1.len() + slice_2.len() < payload_length {
+            self.poisoned.set(true);
             return Err(EIO);
         }
 
@@ -805,6 +819,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
                 "GSP RPC: receive: Call {} - bad checksum\n",
                 header.sequence()
             );
+            self.poisoned.set(true);
             return Err(EIO);
         }
 
@@ -830,8 +845,8 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
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
@@ -850,22 +865,26 @@ fn receive_msg<M: MessageFromGsp>(
         let func_matches = matches!(function, Ok(f) if f == M::FUNCTION);
         let matched = func_matches && expected_seq.is_none_or(|expected| seq == expected);
 
-        // Every path must advance the read pointer past this message.
+        // Every path must advance the read pointer past this message, including a failed decode.
         let result = if matched {
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
             Err(ERANGE)
         };
-- 
2.55.0

