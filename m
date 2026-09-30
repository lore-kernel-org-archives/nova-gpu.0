Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99E638E8A1
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739802; cv=fail; b=Hc6QEmLRM1TkzBX5Bb2PRqJQwOuxuehhAf7g9pUkP4/NkXxq0FC0sXXYc2IBJG9nb0pYWm5TzaXSjqzbqB4vm8Kpn0MD+um1OhOPu45eTWNpHVAGK3Qg32OxcuHFFcceItXGOGPj4M6Mk8+roz/idWeUH1UdkedTIHESxUgyWVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739802; c=relaxed/simple;
	bh=lUWQlpQLBXs2jwVGwknbQrTcE6ZOmjbru92R4mOEl1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uamnfY0lj/UOfQAs9duL6UqtTJ+Rfw+ce9Vp9ZFJmEgnaR2V27YEwtABW9fHolFQTxIiR4cPCapoLzGgwt8zPXHfUbzCd/rNUwDL2Bk4+2yodu3klQFN/+310cl2rneoKcJaULbL6pW0FxG7r2OoNG1hHtJsrD97F7dTsP2ELdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RN0ypfO3; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RN0ypfO3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJDA1JFtKhM8wLziHc4irLhcw5EeUYzjNQ9ixZ2/5FQvZextOeseUcK6scKSa0Y42010bwCDs2Hb43256NE4+HezzW2xgBC7cmEE5Bi/LjYs8Nqei7vRfEDqg6cciHsusGULUWNvovcDg7sGigrFM6gXfE4w5JgfrEAonPG7YVxYPs6TT81lVx1tnes+IAXrdXMjbfK57Tax7mXIqD7DAb5FLRctR/l4cjqtktRlxWEw0irH5OeqQIZb3AZ6UA9lcy9bLOq8csDaFMIfCty5yf25tpGLZWxsTVDJUvNh/8RBSfaa7U5g7gNUOkSG/SixieEcRbKyaNjJsAfwLLTRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiOXOmILdLvTDf+atlsHOwQ3KyN1aiqmu44Bwj7gnJA=;
 b=quvLLRyne1/bFhhbkvsiUNXnv8+rjjNY05QLIIWpb5d9vcougQ5kUdeknKUg1XAr86y+K6oM0Tt7Ay7av71vPCVUDxdf7SN9dCRsDWj/rHvNTlRrmkn4al0Tk09Ol1y6gUWhijJrQRoYlDZBeYKhku1risqeCTWudCQC4WU1IArppMVj0EfWSfOrXcfLKO3VDs0cq5qg+iBQFWoVjjChx5YSQXCPc2vVI5/oGj3ys9ZYkbD51EHYF3O/GclhYdlI6o2T0XFdXDokitSFr7lNzG5p9c1YDJzqqqXAaxzwCGe0/CIGbb0tsPJYS7JJkCC/6XtVWrYqndvnf4sM2wjiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiOXOmILdLvTDf+atlsHOwQ3KyN1aiqmu44Bwj7gnJA=;
 b=RN0ypfO3AvNnQOyHa1a5g2PRmVW1HFLAIiBriIyWLMO+8+exdmkzaHWVnYkSgQDg2wlSXbIhzhMzXnxvw09hxnS1E3IJqbJ+arFKHVkhR1unD3EXAQ1TwbqChyDahT1nwjrCvGR2MgxHocPQEJRtQeJ1IiEKns3Kqp7S8Lipfii5x4Hhl5m8iAPzr0x8l0FV4lrKpQC7UIV8sgmT2WtxH3pPpVFzZqgI9QDQ+1Yw6OmKZ/K8NpLL+HPZc+TTI+oAH0c9ARQ8mO4Z5erWfl6imevWHJS9Fa2KAWYPPQJA7cfhL6QCH0Om8xjw8Sl6mHUo5Gc7uaXKDdXJ70/F4+FNXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:24 +0000
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
Subject: [PATCH v5 11/15] gpu: nova-core: bound a GSP wait by a single deadline
Date: Tue, 29 Sep 2026 20:41:44 -0700
Message-ID: <20260930034148.590687-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:510:e::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: e597c530-8c5a-4e41-2706-08df1ea4d6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|11063799006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lZIWViKbnqmJcDszob8IvFd5bk8NIR3KIRJprki5ck4suKgwEEv9HdvnepiJHE4Me29Y1avnuFScpu7YVafeKV/XeW7XglAaAv2ZWzW9D4Qk64306r4krwFYYULyIdIOO3epgj5GA2BL/vupVhg4KLZGnBLM7NnmY+H4nOua3YVYRaAK/9jwV3kTnDV91fH0AAqte39VckvgLUx5HExRre598sleIUzKkqC+bDLBsWJGycLxPv0iPyu4VqGu+dLSwpjn73pJ5jeMr1aoUdW6QpSBukLup5qNq0AZ1Bf0xK6WSqj1KsTQbW56GsjkOo5pK+qm9NdRSzayPM5gFVHpdT2PiS8CQuy3D+Vo9VH+DLNi/8spdbb7UPytQQubwCttxUmiLgO5BrOe4fb/mS2vzUXv5SI4lYMqpRiT+OrCXNy7W4jSWZMfVtgSbC75kfNjb3JsFyzDvOTrXXpVPyFF8nV6DzFG20rwI9r2Wv7C8lTkXIr05/nhY3MXzmHD6w7tsu4N4Js3HllAbdQpqifG26cc4Kr0Rm7LvEZUlshQbOMh3FfOfgfy96mD0Re3Zb8XYVIxmjFnFFIwakvoqZXObJpImw9DWxP/sRCsU6Y1Fj5tcbuYAgIadsMfitAvQPzLlWoThPiASBdYQkf4FganjltVzLBY3QjBs6Wixb+XLwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wo3aqbh7DDbqb6nad6+wT8E2xhUGRv/dwwjrgpY9Oc3FNMq50MAzICBYY+ym?=
 =?us-ascii?Q?vrzDodo7GLDSgrjyjAKedF0+wY0RdYKmmQmZJBA3cIWYK/OiQZ5Isxr204/q?=
 =?us-ascii?Q?ubyEun6XYUrPT7REuGf8LsjgyhnAIExWyAGGY2hKEeH82ZJpyzBC3YkOBQtP?=
 =?us-ascii?Q?8gSJT2Z6Y5VOAyXKJcbUXf8/xRPZzgVZlZvRm+yj1bjfva7pS7EZp/3hAsp5?=
 =?us-ascii?Q?MUBKJpQojSHdAlz4SVomtPlmtWGQdCE5pgB81eCBNdeAyS2D//SufqUg2sLm?=
 =?us-ascii?Q?IMD34n9InthrDkNx6bgh3OHjh+lvlUUkUG4UG3LREqiJgvcum5XC4AvqK8DB?=
 =?us-ascii?Q?utY+nsrWLF/VxkHmJbIrblONq9FU89dVBV3Q+ReGpnjGth3be99524u+x+kR?=
 =?us-ascii?Q?6Offbs+fYRDzSGchhOf0JCrx6Zfs5jc5Z3lGQgkzRDyjYkRmcwZsHwBrMOa6?=
 =?us-ascii?Q?x2fW3ieQiH/sDFBgCOhWzuqSQ97ygE2L/xQGUtBzGiLR1LedcpC5JW6Nyct4?=
 =?us-ascii?Q?OYGrFXAAh4/2OJlryNxJLLtsxFqBJ8rw+VpgiHy2RGVzTjC9TxUBNu+vNYNe?=
 =?us-ascii?Q?b5KA3SyPHeDzcn/rIGO7tlvG5wEq2Rph54YV7Ve9c8GL/Wjk/k/v7rTBpxYx?=
 =?us-ascii?Q?YZ+dyYBMYj/5LA9PwtoemIgnIC7jm7RPgEAZ//Q3HCxXNv5bmII7lhRUltN8?=
 =?us-ascii?Q?p4Wlbdv0X5fjWbOgaYRSOYazbL7Mwo+QkpJ8gX/UivwvXvzx5lLIcnRIBijv?=
 =?us-ascii?Q?FutGIGEr9tqvG6J6oZRgLY/A/D61F1uKxSHRfPkyOeCH2NNMwmk4F3FFlP43?=
 =?us-ascii?Q?N3VAqe1Q+3VUsEeAv62krHwUad1bGRSsPfh3nn47v2EuD9rtRdlSdf0xX0iD?=
 =?us-ascii?Q?sewNQ/brApt+L/+krXri2c7bdJBhPY4BA65Fj35GeLxRSGAlyNEWPb4wmiKu?=
 =?us-ascii?Q?ohfQH64rEPHEWzwau4JN3ldIhk8WlNwT8y4t5VYdFlD60Zo4bOlkwm1wRLll?=
 =?us-ascii?Q?YJ5wZ3OY36CV+Qe+L7NC7FG36oEdh3zsgCrU8m7IUJZUkr36w1Yk68oxZOst?=
 =?us-ascii?Q?h+t9ni95bBTAoOzVdg7vj9QkMXWccRTwHLNE8H6H57vyLNCz3YNeULrDjH/B?=
 =?us-ascii?Q?m9jHOzdmIvjndZO7KoqP82L8Kq711js8Y820sLEMJj7f5bU82KNNFcFEFk75?=
 =?us-ascii?Q?ThOs1r4NJpHubn2LyPt0vetazxk/tYCjeBoNaA1zX09W60QWdxRMd3zhQQPG?=
 =?us-ascii?Q?4fYl1FXIXTNkBW2V1DQnuVVhb+zEe/O3qVfxHV2vO9ipdrtaSOMgt4H7Vn7t?=
 =?us-ascii?Q?6jWnVkBGtYF3c8AZyl6hx64ELFIZstHkXrrAV+Ir9bPmtOcp2B8LuqZppIYb?=
 =?us-ascii?Q?WfhJgT88Flv5bi85goBuT94zuwaGr1jv4n8r9D66Tg+FERwwSNJSGvlhqx1s?=
 =?us-ascii?Q?CsM88/nfb0KUXQSxFT0AuFtRZt33e1+t15SiMSTjPx26hrAuu+OiP38AMt9z?=
 =?us-ascii?Q?Lp1d2f7/LZoOOdg+ATlTvDbRBsXOTPsgP9ZxNfICmZaKDCYQjHVjAv6UPyAL?=
 =?us-ascii?Q?kNF/xA7K6CH5uzQXEP5CHJu1z93DVbpeeBqQzv5bn0UPy/YPmgf1Gwux6YiV?=
 =?us-ascii?Q?R0IX4HeniPkJ6Lgqh/1FpDaOTyEkWlhd4eCu0B64IgOm/y/ct3npj26QGNFX?=
 =?us-ascii?Q?NlHu+0TOARyQGezsF3H/6Wy6ZuxbaQY+5ISXgToiDCkZdBJ4z6r7E9QWFnPV?=
 =?us-ascii?Q?dTzLiYvAyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e597c530-8c5a-4e41-2706-08df1ea4d6e0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:23.9455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kiq0jfD8+GJcJtAsDC/sBuMjhtcTS+BJ57vpf3OpLMzhxKxHYOfuwT6YgREKlze3y7fMcU5qhmdNHIOFVUgBGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

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
 drivers/gpu/nova-core/gsp/cmdq.rs      | 72 ++++++++++++++++++++------
 drivers/gpu/nova-core/gsp/commands.rs  |  8 +--
 drivers/gpu/nova-core/gsp/sequencer.rs |  8 +--
 3 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index ad2a14d08cb0..ae3808de44e2 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -28,7 +28,11 @@
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
@@ -130,7 +134,9 @@ fn size(&self) -> usize {
 
 /// Trait representing messages received from the GSP.
 ///
-/// This trait tells [`Cmdq::receive_msg`] how it can receive a given type of message.
+/// A reply that [`Cmdq::send_command`] waits for, or an event that [`Cmdq::await_msg`] waits for.
+/// The receiver matches a message's function code against [`Self::FUNCTION`] and decodes the
+/// message with [`Self::read`].
 pub(crate) trait MessageFromGsp: Sized {
     /// Function identifying this message from the GSP.
     const FUNCTION: MsgFunction;
@@ -566,8 +572,9 @@ fn notify_gsp(bar: Bar0<'_>) {
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
@@ -582,13 +589,7 @@ pub(crate) fn send_command<M>(&self, command: M) -> Result<M::Reply>
         let mut inner = self.inner.lock();
         inner.send_command(command)?;
 
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
@@ -608,15 +609,25 @@ pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
         self.inner.lock().send_command(command)
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
+    /// - `EIO` if a message fails framing or checksum validation.
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
 
@@ -870,6 +881,37 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
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
+    /// - `EIO` if a message fails framing or checksum validation (see [`Self::wait_for_msg`]).
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
index 0c787fd689bf..cdbb13674f08 100644
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

