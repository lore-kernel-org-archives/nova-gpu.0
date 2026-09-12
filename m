Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553A0388E55
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188278; cv=fail; b=GAFSHjH3SFigkL+LdZVOP7f5hSPjv8bwejzQ0NPijR5GC6bc+mqNvVQ+kxv5B5pd/XNymY+Tydg5t2UZ404bbi/HXdG/Ay/VZjX4bXT4l45oLchhRNfKdxzg0o9yrWFR0JF8kgikey17bvscICNPs0FZNSWjWBriFDsOEkEFfiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188278; c=relaxed/simple;
	bh=TY/Ul6SCR/VeNHfRTc4jRHN3qA+Ku8l2Wn/XRKNJpIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=arb6P/1Erbdjkb/yr/bGGSpvbJu1VQbsLYgMX6hicZyKUr+1hqXGse9zjlyVxLLkxIFuVYgTjc4V2VeukJ1QTclHr7McCnGhXdfv2rUeq3r+omDx/w0YE/DUp9K42lmuUcsegFGF/xfuywAw4HTqUtiqbwkBpsnlbfJQpPyfll4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=du3MA6yS; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="du3MA6yS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5pFf3yn0tvR5E5S3ROOTpH6kX+uv6/hrFPXxiDxjIq53UTj+Wu3PyOsaNbJP0zlX+R5iy9NNBGCuJiUoFFkzS8nxPfHNY7dyp0A6IUoqM3tFnW3RYmWiXmaz8DFsuLzcMBP+EtrmmGlX3e2rOobcLBtBALwo8D1Cm3h6g9e69UnMKtt+uXdazIxEVlWEGGwC+zMbZVwxoTkDHXN97EGIzquegiWVk2O+Qj7rkJmlEQEu4Bavbxxp7/PYTBN1flIBy3zzRB5jPlAQjGf5iwtvc+YELhDjUphn4rD7ul2WTNUfdPQiD8qcfQ7R61hygtRv1tLntHEkNGCCDrHc0WpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zZRYnMqUlO41XvVDuDcMK0R8bJogtrwni3GLpGEhXA=;
 b=MEgOSxrp+8NNxvf7RckQojLh2kJsSwRE4Wq3/qZC87n8pbWNxPZ1Ks3N0n8spHKO6ie0NXPXRySsAyZiGnZUWgj/26O9SguCnYuFsjwusL6u6tfeEorUYR7ojQPo77HVu8Dy2dT3izqVwjUZu90MbH6MEGA9RPTltuMw5ABYfmVN25vrBMVVM0cCg0DDYDpoyvIjicdlph1oj1Zcg8AhhHbkRqYQeTBrOI9t9/KemFmlZuX6rYfQZb9W+RavUj+bOAADMptH41ndsv8TMuCbqMb9HYZ1m5b7y6/UwoRqPJytt1cmD+aVzTGI+BSfjlEjS3nP/smI0HzwtpKxdQeTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zZRYnMqUlO41XvVDuDcMK0R8bJogtrwni3GLpGEhXA=;
 b=du3MA6yS6JUQsPz1fTysCWQuKqwFFAfuWf2GqXtxfzZ/iqaPYZycqDuGcu62yXCzsFumUKiTEhPoThjGwwjqasCLOjj43ExRyvHrnwRNvc4fRlbNOICogl7nIZfrS06t3/JJg6znFultqyg89v+Gw7UFqx9M+h+RgjPB7aNnOw9uKPthc8FtYiQ8touMtr7KFJ7MWRQjKCeTBUJ2rNPOboNHBd3ikNdCDdGcGD8zrQIm4sauBcrt1FSLQL3dXbVTDaBnfJwBE9C69J8+XBsoj+5warzE7XSkj/PypJjxzuTl8BgH3P5Kif4kDCAAMh539h1iHRNaot0b29AR2iUYBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:27 +0000
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
Subject: [PATCH v4 12/17] gpu: nova-core: bound a GSP wait by a single deadline
Date: Fri, 11 Sep 2026 21:43:55 -0700
Message-ID: <20260912044400.677097-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb8433f-75cb-46ce-4812-08df1088868f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|3023799007|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	uQspEa8ps8TmtgL/J2vNyUUDKDFNNfMeazetfeBBwTn5ADEMIwkXJXgaHGlCDhNAvfYMIzz6CM+cTHig7pBFmoNNdS5B7uZIxHJY5hM+yuVbD4HVc/Cz9I5aFrOOpfVyXwfJQ3VfShfd1VBjnnO2FGhEJ1zJZcys5uMlEqyULmtI7unQdQ6O4a6GQGsOaVUmiEyP3dc7ktX93yoA4s/7zAau1wl5SNKiCijKj9Bpf4uu50a2kjcq+0STDO11PVBoL3gsQqXthUeUkoy413lrmcwDc1Nb++N4AIeuuWsjLDmzqX3px657rjZ6upXXP2Sp4TLKc/cyh3LrGAgG8gPZ1xRAsvKd7/ar1ogcYc+bJHH7PamePObWPq3BMi37fa/nygeYMlXCcPPKcX0jD69z8MTB39zMi/ZsET4j9HQZONWULz9xCrz2U7LXSiL4EWIoAyLaVTzXFFqlNu+43gqhD2U+r2TS689kl6rIKAj0Ws0+eU2rFcyK736IhHu+UWQVXPSRDdJgdIJ6yrw8sygZOeV5uaaSwP9hwNHIc5g9TDcNaOanvyJgsEDbfmroQEwNBGEM1QbLiH/PBwkCrJw2dgr75jtsA41MbI/QUKO7OAXtIxPO/axjnZpJA6/nkYmuBqIpoE3HjS4yq3mMcafc3mrP74ascx3EuIfO4HePwA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f7rqMV2J/uBsD1rZ4eEePSZpnX//0QiEbmBC1igaT0zXfIJVyshZ/r/j+9uR?=
 =?us-ascii?Q?XOID9s4ZyF/HUfYrYozjsPNFuz19fD0b7eWHrEb5fRWP7WF2aoVbalYSvu8M?=
 =?us-ascii?Q?Cpc/iiZQQ4tC9EybPDm0n0UA2TDDRlxJ6TzPQRSDfqEiGG7L0h4aLX71Ir9v?=
 =?us-ascii?Q?e7Ku3cGJEd+tafb4HhKrIGpLhtTWLMY3wEk11wECr5PX2Wjvf7Zropiq2pyA?=
 =?us-ascii?Q?OdwvLnyOKkLgYDaytZJ0OFKW70TRv1UrJg7W0iXog1c6X9PC5u89EFpxhr0G?=
 =?us-ascii?Q?FRGTUD4cl0WhOvl6qx80WqPEr+ceUHzGsX/GnrFSUcNjD7xBzdm/IH/hKZ7d?=
 =?us-ascii?Q?rBBbYoZYzoDiPkNdxGp1K12rUtTksyjh0Asqif8Sk0vpRg+R1onxnxCAudQY?=
 =?us-ascii?Q?Qjbycsb1BI9JTrH2jQ00K82sCJdRhbzLgZMrYahsBb7872kjTaFeb/SWAvql?=
 =?us-ascii?Q?Je3Z0Kc9mpCje+4wyPjgyHGwJBob6yOKq3ywULorzbIDtcgoxxjs+iE6FxRj?=
 =?us-ascii?Q?5HerCVT/qX1Lt3YwgxHDF6XS18pTktCDpF0xy8zEqWcfkJ5UgjOXJZKaVL1I?=
 =?us-ascii?Q?Am7BAMtvc3iK4829Pj4AIaIBFjDrmKopudeAPptngQ5vNEGKhPc+NzAxnYeS?=
 =?us-ascii?Q?FoPXCvU6VMT5v2at7yFbm9YqzNGaPw95j7r0/QzFYOBUd4NAQqJNDPFg9142?=
 =?us-ascii?Q?3UmbcWNFn1vS/s6oaAwcG4gIOu+tfgENaNud+sOtxqPrugOQ2x6tiZ+XHTIA?=
 =?us-ascii?Q?gNcPwwAqpCQ4R9QCLj4nSDUkENUA8kxyOkR3nfmPeDDHvuk68UyLIWM332oq?=
 =?us-ascii?Q?AlkpgrSsHPnEZuctlvlcfOnAhadWgwL7k+4bzPp9TyhYo+dnjYLLm6kTr+2m?=
 =?us-ascii?Q?lcm1k657iGbBDUsXHlbkaI+ukb2MSVhtGSLA6j37LQMsJ1nhSOMgzxpwEm4t?=
 =?us-ascii?Q?zaNaSzW+F8MV1/JyXalz6KJG4+2zhZmYE0Ott7Ez1IG2tWahg+DDP/YyRz0m?=
 =?us-ascii?Q?vNTnX0HgRNBfXjil4pi6NTtHjP1PUPvKtujeicZrM0y0AsIpd+z4R3VsRaz4?=
 =?us-ascii?Q?EY1BdUmVEbsnxHaMTRF6/DhxzMqm3/AMiTMNlVruTsXPkVoZKupWqSok/43r?=
 =?us-ascii?Q?Ua7Uey+L0gEIC3z/Qc8o4D+1AyFbM1iL2sIc4NA5FyhRatkYDIVHzH0QkfR/?=
 =?us-ascii?Q?1vFG1kUqrGI3rgTsLu6Mqy9XpXt+S8XiEiCUN35y89hNS291DE0+jd4NPUrz?=
 =?us-ascii?Q?k5W0A4JHcS2FtCMw+nInSal9HxgOGigKiy8fUsD5DOcJawsx7HFEBo3DYFtC?=
 =?us-ascii?Q?Ci0O5Zn3d6Kkn4d74zBWw4pDrPuc0gQQtaDbCMWbbmHIXpbyVRYS+B7jsGt4?=
 =?us-ascii?Q?VGDM7Qjs1m02pyqsArAOa0U6Ge25Ps3P49skbAFprHN3ZMVyEO5vn1+oMzNA?=
 =?us-ascii?Q?rJqRp/w9g0YRqs+QzmRntLGXpFixXsst4JU/eyb8iyF7vRkqJU9/w+CuJp1Q?=
 =?us-ascii?Q?lKy4ldB6Pk/f/qR+/+80gVW6jKT8liRU56luLTNZntvmwhPhyiTwI1s43RxQ?=
 =?us-ascii?Q?XnSv2qlVcw5yba0mX1e0KCBu4RL0P3W68SY3x1XMZWLjEXird3tmUiRiWxgW?=
 =?us-ascii?Q?tGjSHs7vcIvWgil9taP2jARoBcbmzrwsOrpxDC6ipT+q0WLGfkTIP12Psok7?=
 =?us-ascii?Q?S+FS7PnChK191tgz0p+xhZAEXt/0x3Raxn5aT86BYkR2Nt0MSi+ppqc9BxMr?=
 =?us-ascii?Q?UbbHubLMvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb8433f-75cb-46ce-4812-08df1088868f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:27.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1G25WFQaCp0iQTSse7/HU8N6HsvKCOP4MqLaizdTlIz1JJhSfEW4PO26j/ZKcFrhQjlHdb2SuSfCAw3UvMYVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

The GSP posts unsolicited events on the same queue as command replies,
so a caller waiting for one message consumes whatever arrives first and
reads again.

Every read started a fresh five-second timeout, so a steady stream of
events extended the wait without bound. The two boot-time waits for an
unsolicited event also released the queue mutex between reads, so a
command sent from another thread could consume the event and leave the
waiter to time out.

Compute one deadline when the wait begins and pass the time remaining to
each read, and hold the queue mutex across the whole wait. Put the loop
in one helper that the command reply wait and both boot-time event waits
share.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs      | 73 ++++++++++++++++++++------
 drivers/gpu/nova-core/gsp/commands.rs  |  8 +--
 drivers/gpu/nova-core/gsp/sequencer.rs |  8 +--
 3 files changed, 60 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 45c3c3aea8f9..4595aa2176e5 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -32,7 +32,11 @@
         },
         Mutex, //
     },
-    time::Delta,
+    time::{
+        Delta,
+        Instant,
+        Monotonic, //
+    },
     transmute::{
         AsBytes,
         FromBytes, //
@@ -134,7 +138,9 @@ fn size(&self) -> usize {
 
 /// Trait representing messages received from the GSP.
 ///
-/// This trait tells [`Cmdq::receive_msg`] how it can receive a given type of message.
+/// A reply that [`Cmdq::send_command`] waits for, or an event that [`Cmdq::await_msg`] waits for.
+/// The receiver matches a message's function code against [`Self::FUNCTION`] and decodes the
+/// message with [`Self::read`].
 pub(crate) trait MessageFromGsp: Sized {
     /// Function identifying this message from the GSP.
     const FUNCTION: MsgFunction;
@@ -569,8 +575,9 @@ fn notify_gsp(bar: Bar0<'_>) {
     ///
     /// # Errors
     ///
-    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
-    ///   not received within the timeout.
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply does
+    ///   not arrive within [`Self::RECEIVE_TIMEOUT`] of the send, however many events arrive
+    ///   while waiting.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -585,13 +592,7 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
         let mut inner = self.inner.lock();
         inner.send_command(bar, command)?;
 
-        loop {
-            match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
-                Ok(reply) => break Ok(reply),
-                Err(ENOMSG) => continue,
-                Err(e) => break Err(e),
-            }
-        }
+        inner.await_msg()
     }
 
     /// Sends `command` to the GSP without waiting for a reply.
@@ -611,15 +612,25 @@ pub(crate) fn send_command_no_wait<M>(&self, bar: Bar0<'_>, command: M) -> Resul
         self.inner.lock().send_command(bar, command)
     }
 
-    /// Receive a message from the GSP.
+    /// Waits for an unsolicited GSP event of type `M`. Events that arrive before it are logged and
+    /// consumed.
+    ///
+    /// The queue mutex is held for the whole wait, up to [`Self::RECEIVE_TIMEOUT`], so no other
+    /// caller can send a command or consume an event meanwhile.
     ///
-    /// See [`CmdqInner::receive_msg`] for details.
-    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECEIVE_TIMEOUT`] of the call,
+    ///   however many other events arrive while waiting.
+    /// - `EIO` if the queue is poisoned, or if a message fails framing or checksum validation.
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
+    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        self.inner.lock().receive_msg(timeout)
+        self.inner.lock().await_msg()
     }
 }
 
@@ -901,6 +912,38 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         result
     }
 
+    /// Receives a message of type `M`, waiting up to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
+    ///
+    /// Any other message that arrives first is logged as an event and does not extend the
+    /// deadline.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if no message of type `M` arrives before the deadline, however many other
+    ///   messages arrive while waiting.
+    /// - `EIO` if the queue is poisoned or a message fails framing or checksum validation (see
+    ///   [`Self::wait_for_msg`]).
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
+    fn await_msg<M: MessageFromGsp>(&mut self) -> Result<M>
+    where
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
+        let deadline = Instant::<Monotonic>::now() + Cmdq::RECEIVE_TIMEOUT;
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                break Err(ETIMEDOUT);
+            }
+            match self.receive_msg::<M>(remaining) {
+                Ok(msg) => break Ok(msg),
+                Err(ENOMSG) => continue,
+                Err(e) => break Err(e),
+            }
+        }
+    }
+
     /// Logs an event, meaning a message that no caller was waiting for.
     ///
     /// An OS error or robust-channel record is logged at error level and an unknown function code
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d1c80cf3c452..a01ab14299c6 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -188,13 +188,7 @@ fn read(
 
 /// Waits for GSP initialization to complete.
 pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq<'_>) -> Result {
-    loop {
-        match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
-            Ok(_) => break Ok(()),
-            Err(ENOMSG) => continue,
-            Err(e) => break Err(e),
-        }
-    }
+    cmdq.await_msg::<GspInitDone>().map(|_| ())
 }
 
 /// The `GetGspStaticInfo` command.
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 1782ed7d7ca6..250adc9fe74f 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -343,13 +343,7 @@ pub(crate) fn run(
         libos: &'a Coherent<'a, [LibosMemoryRegionInitArgument]>,
         bootloader_app_version: u32,
     ) -> Result {
-        let seq_info = loop {
-            match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
-                Ok(seq_info) => break seq_info,
-                Err(ENOMSG) => continue,
-                Err(e) => return Err(e),
-            }
-        };
+        let seq_info = cmdq.await_msg::<GspSequence>()?;
 
         let sequencer = GspSequencer {
             bar: ctx.bar,
-- 
2.55.0

