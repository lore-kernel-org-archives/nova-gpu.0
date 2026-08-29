Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D33A1A3F
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967224; cv=fail; b=MQY+5HtLlErzYPRMmtm31YO+/hX4ULsLwKd9k95FyBl4tWohe0nEWtT821sW7mzfFbRc2Uqh4PgUuEymLLQC59kRdiDTFGo7qBMtRhhLQmyu4v4knRvtEN31uhimUQktVtHwgfPG8eNg9T3T6Q+LMx7tNddBZeoWt0CsOE8q7Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967224; c=relaxed/simple;
	bh=pht1DVQLuulETVRWMNi0PSOyv8J5sl57fBGUg9r7jM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ltny2GajwkCaDljynLH880yRcyHnUx6RiOhxfSY7qEKLoYRMJeygnJWdvS6BYu3ION7KtGnhlArjb1G2wBmEOTKUz05Y1TiGGf8RROGCpQXGozqMeaFok589D3I/rgNVl6C0Ibcy5QRGPdlNgp0vw9BbcWuUyXYL2pfWFDqnJp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X9wN1c/s; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X9wN1c/s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaUjCnXkBnQZ9dVKCWyKis1lzZvYD+g0J2aTR0A/YpYEi/FoTpEwoXICj3cTOGTC1qnEeO5mPeBFZoQj4yEfoJv9vg/c6y20FTwz4vMPIrc4VmWT8Ed6Vec95Iy2o/YrTcTsLrCwTfE0fneFvzSsCtB9pQrQneb4s0G42bUtFNrv4XXri4CteR9FXCJB7zoUZCFv57CFwNCGsssm85CakEXeuG/zy/skfmTrWduP1yJJJfSrzhf/n9KcsHv3uYriimLVLD8BPMbdQh8cEGRMYqqUEMGlyCygt0uKjYbaEQMV+kHFJ1DGFyMA5IXlNG7cllBBooNGWgzQzgqsQ0zBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHz3y5DKMJJ+2f2yTsIvFfnrNYxw/0un4RdJnBO8EFo=;
 b=J8a0YcqE4nYDpXe6ptba+T13nF5Y+wuIJchuXrxAsAFbWMIl1UrrnrECnC1ITf1z9qdKxpHXvM8izicI9VGLfya+3qaLcd/mtkg00jcTf9z09sFaM/aVptWSZQyK6xp7ckbjxNrS8lWDrhTUt0AicV38148F7hdLnr20pYlxiGnBUBbLm0mQaPQwRwCMl0UUq8DNXvUAOtunMbvhr/+Nsuf1SUppNfRa1MOeSpZKtie62x+g3JDR5k2aNZVqAIqWOnYrONB05IHru5gj/HwvSHp3kRfNKTK0s9UrxA+R1+v3X4sI005EJTRg5BI+J4x4Ujmqo1sn0sJthqi5DQqJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHz3y5DKMJJ+2f2yTsIvFfnrNYxw/0un4RdJnBO8EFo=;
 b=X9wN1c/s2JXVt9JTnGU/MJqbp+J+07y87SCreyWK6Rd2xICYhGZmx0TscqZ2f593gbEUdT9WEB9/2wt3LNTPWaFICrQKCWNdMZxnuS7jFLouK2M5Z+eW2LDO7Spa5ng3Ucj34rw42X4Cp8XiPyYATfsWkJJDALhtp3kwSx25rnz400Y6ALEcevYD5CvCzoH4+C5XbEqCPxnZIkjJBgNEXIwLS/Z7AtobydnQFVDlQgtFrv+vaGa1RKg3m079x4x+8yvfFSZtMekwAoct3RuQcGRR4xOjcpLJydKhtkAuSomVZAeJybpPiblBVCXOyJSR/FBoL3XjvRvNNet+oEOovQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:35 +0000
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
Subject: [PATCH v2 09/15] gpu: nova-core: match GSP RPC replies by sequence, not just function
Date: Fri, 28 Aug 2026 18:33:28 -0700
Message-ID: <20260829013324.499542-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: 849bb472-4796-4a45-e489-08df056d8ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mr6+sITwwCM6253UEUZHFmyHAF4c2r8QESEsStprb3jPAu++INIf2Ch7v8+nXnSele7/viH7tfGdcj10z4toaBaQ82rfQTlHyuVpaFMcwr70OVrdg6FZCoHlXVT0/weZs1mzqB7HbcAneeIr/faVXLq3apVuxotZZEFDcV7bpJmdhh/neh/qFYw8oDh5c/jB+AusGdQexkYvEpDBpCNoBigXNMgnDQJUSNsu6xQUcCo78CwUtdZX9M8ZMYxuUjjfD/vhuo38jTqcZP8urL6s01Mnb8XrXJQfFNGUv+LwT5FzL8ObTBVmNajc3zjmbFotWoKK54Sks+814KYLysVDw/Pdpn+7aHGoDjKQcbsPw+q/cQYt4goyScW3FwKPERuNZcna4WruzhJ2dz9HwfD9HN30PcOFEFrSETvFbmwi4FUKzUV893FzjOTgRoOcwEOMYuvRvlHA77zberVJ0DzizxuOkbEkaVDhK9ASff94YVoayCNtT5DjJKV/TbhYLdvipC/NGwY9F/oH/rxjJ6je48uzOR+gIJxhSzyFOBNKQq/bl749Km6pUdaJflNmqrIHs/pRT7ZitwzkMIc0hDm1G9UFdxPotGvsEUa6q4nWCLLK24NThMe/EDfTBZnbIeyHuGPU+lu9Jf3cTKkZLHvbAz4MXxdcWEanMEt5Z1v3iOY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iofPit6VGPmrxl0GNVkion0qNI3vytcc8zEYGcCeM1Q6T6JS2BncCXrbmJKQ?=
 =?us-ascii?Q?956Aa835IYJiaBHh+HfLoMqkr43VC6rTy86e/owPlwmdCP4zDLYUgM5Zs4Xj?=
 =?us-ascii?Q?RIhpb8KxyKSZPAxUPIPk9I0sF3F9TU/IS5g5ObcJuRwTh1E3lDZjpg5OdkKs?=
 =?us-ascii?Q?SZVQgSLU5ghZdb1zNdYHzhn4A3YmHj+lTmey5w1TyJTYaK8on4sdg9DBQVto?=
 =?us-ascii?Q?oaONAveplAYxIbK7mlCsJ/kEo2QyxInl9h39lCFZVv9QzpA9MdE5TBC02eja?=
 =?us-ascii?Q?gHtJMxbfH99HTIEL7EF2ihSTJoOC3kplggwKvIvPCnxF7UEM4HVL7Ef4wDcO?=
 =?us-ascii?Q?cxTDT0dnsNOEUQ9RqLMPE7oGLvoj/oKxQQXtEbZmARDmNNROi00mFyomOIAe?=
 =?us-ascii?Q?PAv2ESlP2FYwLWtij61WsqnLLnX2/QqHnMBzv/HExkQz8JXCix13lLXBOkNf?=
 =?us-ascii?Q?gJPpYJYNdFjEHIbRy2nOBQCURipDqr5OxECKIRXv6Y75WpHfz+hAyGqdKSz3?=
 =?us-ascii?Q?fH6THS4O9A8eR4BBjjjtB5ANKiXKQT7yAHnhb5jt/BhNVTQV3pzx4DjuMu0B?=
 =?us-ascii?Q?9ZjIHDCT87txPTayGeNMGj2KunGYP0Tn7qJinn/Zt7Q99V6q/+dVZAHntMcF?=
 =?us-ascii?Q?VOLIHK2jUwpCRVVHM8TyNK6akFKnPYHfsfmXo7hjRqCGK20eflCQBXIUZhmX?=
 =?us-ascii?Q?pJA9reONHZIohI5RepcQyU+AoVoYboejfpKJnepLoxoe79EIj+DNB07UQT/2?=
 =?us-ascii?Q?v+Rj7bNjllW5HeScbbdQT1w/wx5RfvJe864dJyTCXvg9dYBQ9qsERtp0fcs6?=
 =?us-ascii?Q?N/ANKXu/IxOdH0m8biVmbHbWRhSgHb5JFuFjX28HkLqPppQnNX9bUm3tGrTU?=
 =?us-ascii?Q?4L3aNtz8ODC4eGoLp+sem/gxRdqN155VVvYXQjNQkyQ/ao+0/6Z8TKIV69dD?=
 =?us-ascii?Q?pjFs1faWx9Qs+tvdsugqrmp+tRa9lwiJfN9vmuIe58fOLlDQp1zRxnsx4HAp?=
 =?us-ascii?Q?R67/cxXKclU5wKMNa8mWT/VHgTTZX3JcKw2SwuaerTDYq2UHHt3gaWz/qJ1e?=
 =?us-ascii?Q?O58FMndDYC2u045mbDAqlLTM/x5LKKWBajs78RLxBS1SxYNGH61/zeWWKvmN?=
 =?us-ascii?Q?9Ho65vw4JYDWINHUZ1kmOOZ75LEv7eaJRrHZKKPxggFKVk+ae5quGt3lLIL4?=
 =?us-ascii?Q?DFYkHTb8qUwdLSpKOHhvXXlkRHyVyuIUoLtGnOvx36O6gopcmkb/M70TUXTj?=
 =?us-ascii?Q?JnbzCmbSUFeHCMRGZxKBc4cxqwyk93ZVSnPEE14qj+fli2IOSoXWLmcwJ42V?=
 =?us-ascii?Q?agZZVIx61A68IpanEX9my2ftTeEaNrynqFGC9uVkRk2PtwYRPstakumIMGcl?=
 =?us-ascii?Q?JDP/3YP6iVLhCcxqMf9nn4IhlEyMXZPWhz8Me9I+fp5Lm1UmGkAb4IP7zAXM?=
 =?us-ascii?Q?spmaj2OhboPr6m6lnY4JmLVmGNQfIAkF4xxR7hcLLxMxv/rlYXtgFWNttrWX?=
 =?us-ascii?Q?KSMEym78TpAxX9/C3dnKO41qXwAyEyKUBq8irf8OVihEdFmyt7K1TKhSSNaX?=
 =?us-ascii?Q?F7/0iL0b7vcx3CZvUi3DByLPLdPPCvSQftJt6Orvrq/Vur8vRkZ/S8x+/ilw?=
 =?us-ascii?Q?slXWYdo/iYEgUGRLW/2/h1FBsXWA51dg98eEwtDmuR+5Hg0esnFhiFDQ9Er1?=
 =?us-ascii?Q?XGff6v0s74XMFmNt7W+QDz9SExc/tKSw3kBIuc7nFa2uQT70U8Rjx54HuBML?=
 =?us-ascii?Q?g9T+vgD+3A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849bb472-4796-4a45-e489-08df056d8ae4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:35.0921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDNNOpqYwcb8kilKMWNhdFw1FCUwHvwDnxp1z6rcgbVgPX2Fvr8+ZFzT8QZiHsDQIW5ZoyzYu3y+3u4KH29whw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

The GSP replies to a command by echoing that command's function code and
its RPC sequence number.

nova-core matched replies on the function alone and never set the
sequence, so a reply for a command that had already timed out could
satisfy a later command using the same function.

Give the RPC sequence its own counter, separate from the per-element
transport sequence, set it on every command, and require both the
function and the sequence to match before accepting a reply. A message
with the expected function but a stale sequence is logged and dropped,
not mistaken for the reply or dispatched as an event. A caller awaiting
an unsolicited event still matches on the function alone.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 89 ++++++++++++++++++++-----------
 drivers/gpu/nova-core/gsp/fw.rs   | 13 +++--
 2 files changed, 67 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 0df52df1da89..3224079abf7e 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -521,7 +521,8 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Err
                 inner <- new_mutex!(CmdqInner {
                     dev: dev.into(),
                     gsp_mem,
-                    seq: 0,
+                    elem_seq: 0,
+                    rpc_seq: 0,
                 }),
             }))
         })
@@ -569,10 +570,10 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
         Error: From<<M::Reply as MessageFromGsp>::InitError>,
     {
         let mut inner = self.inner.lock();
-        inner.send_command(bar, command)?;
+        let expected_seq = inner.send_command(bar, command)?;
 
         loop {
-            match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
+            match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT, Some(expected_seq)) {
                 Ok(reply) => break Ok(reply),
                 Err(ERANGE) => continue,
                 Err(e) => break Err(e),
@@ -594,18 +595,19 @@ pub(crate) fn send_command_no_wait<M>(&self, bar: Bar0<'_>, command: M) -> Resul
         M: CommandToGsp<Reply = NoReply>,
         Error: From<M::InitError>,
     {
-        self.inner.lock().send_command(bar, command)
+        self.inner.lock().send_command(bar, command).map(|_| ())
     }
 
     /// Receive a message from the GSP.
     ///
-    /// See [`CmdqInner::receive_msg`] for details.
+    /// Matches on the function code alone, for a caller awaiting an unsolicited GSP event rather
+    /// than a reply to a command. See [`CmdqInner::receive_msg`].
     pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        self.inner.lock().receive_msg(timeout)
+        self.inner.lock().receive_msg(timeout, None)
     }
 }
 
@@ -613,8 +615,13 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
 struct CmdqInner {
     /// Device this command queue belongs to.
     dev: ARef<device::Device>,
-    /// Current command sequence number.
-    seq: u32,
+    /// Next transport sequence number for a queue element (the `seqNum` field). Advances once per
+    /// queue element, including each continuation record.
+    elem_seq: u32,
+    /// Next RPC sequence number. The GSP echoes it in a command's reply, which lets
+    /// [`CmdqInner::receive_msg`] match that reply to the awaiting command. Advances once per
+    /// logical command.
+    rpc_seq: u32,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem,
 }
@@ -633,7 +640,7 @@ impl CmdqInner {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
+    fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M, rpc_seq: u32) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -650,7 +657,7 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.
-        let msg_element = GspMsgElement::init(self.seq, size_in_bytes, M::FUNCTION);
+        let msg_element = GspMsgElement::init(self.elem_seq, rpc_seq, size_in_bytes, M::FUNCTION);
         // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
         // fails.
         unsafe {
@@ -678,23 +685,25 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
         dev_dbg!(
             &self.dev,
             "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
-            self.seq,
+            rpc_seq,
             M::FUNCTION,
             dst.header.length(),
         );
 
         // All set - update the write pointer and inform the GSP of the new command.
         let elem_count = dst.header.element_count();
-        self.seq += 1;
+        self.elem_seq = self.elem_seq.wrapping_add(1);
         self.gsp_mem.advance_cpu_write_ptr(elem_count);
         Cmdq::notify_gsp(bar);
 
         Ok(())
     }
 
-    /// Sends `command` to the GSP.
+    /// Sends `command` to the GSP and returns the RPC sequence number assigned to it.
     ///
-    /// The command may be split into multiple messages if it is large.
+    /// The command may be split into multiple messages if it is large. The GSP echoes the
+    /// sequence number in the reply, so a caller passes it to [`Self::receive_msg`] to match the
+    /// reply to this command.
     ///
     /// # Errors
     ///
@@ -703,24 +712,26 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
+    fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result<u32>
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
     {
+        let rpc_seq = self.rpc_seq;
+        self.rpc_seq = self.rpc_seq.wrapping_add(1);
+
         match SplitState::new(command)? {
-            SplitState::Single(command) => self.send_single_command(bar, command),
+            SplitState::Single(command) => self.send_single_command(bar, command, rpc_seq)?,
             SplitState::Split(command, mut continuations) => {
-                self.send_single_command(bar, command)?;
+                self.send_single_command(bar, command, rpc_seq)?;
 
                 while let Some(continuation) = continuations.next() {
-                    // Turbofish needed because the compiler cannot infer M here.
-                    self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+                    self.send_single_command::<ContinuationRecord<'_>>(bar, continuation, rpc_seq)?;
                 }
-
-                Ok(())
             }
         }
+
+        Ok(rpc_seq)
     }
 
     /// Wait for a message to become available on the message queue.
@@ -805,10 +816,14 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// The expected message type is specified using the `M` generic parameter. A message whose
-    /// function code matches is decoded and returned. Any other message, whether its function code
-    /// is a different one or is unrecognized, goes to [`Self::dispatch_event`] and `ERANGE` is
-    /// returned.
+    /// The expected message type is given by the `M` generic parameter. With `expected_seq` set,
+    /// the message must also carry that RPC sequence number to count as the awaited reply. With
+    /// `None`, the function code alone decides the match.
+    ///
+    /// A matching message is decoded and returned. A message carrying the expected function code
+    /// with a different sequence is a stale reply to a command that already timed out, and is
+    /// logged and dropped. Any other message goes to [`Self::dispatch_event`]. Both non-matching
+    /// cases return `ERANGE`.
     ///
     /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
@@ -820,7 +835,11 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ERANGE` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
-    fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
+    fn receive_msg<M: MessageFromGsp>(
+        &mut self,
+        timeout: Delta,
+        expected_seq: Option<u32>,
+    ) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
@@ -828,10 +847,10 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         let message = self.wait_for_msg(timeout)?;
         let function = message.header.function();
         let seq = message.header.sequence();
-        let matched = matches!(function, Ok(f) if f == M::FUNCTION);
+        let func_matches = matches!(function, Ok(f) if f == M::FUNCTION);
+        let matched = func_matches && expected_seq.is_none_or(|expected| seq == expected);
 
-        // Bind the result rather than returning early. The read pointer must advance past this
-        // message on every path.
+        // Every path must advance the read pointer past this message.
         let result = if matched {
             let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
             let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
@@ -857,7 +876,17 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         )?);
 
         if !matched {
-            self.dispatch_event(function, seq);
+            if func_matches {
+                dev_warn!(
+                    &self.dev,
+                    "GSP RPC: dropping stale {:?} reply (seq {}, awaiting {:?})\n",
+                    M::FUNCTION,
+                    seq,
+                    expected_seq,
+                );
+            } else {
+                self.dispatch_event(function, seq);
+            }
         }
 
         result
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 05f54fee6186..0b01c81ec092 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -782,13 +782,14 @@ fn new() -> Self {
 }
 
 impl bindings::rpc_message_header_v {
-    fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
+    fn init(sequence: u32, cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
         type RpcMessageHeader = bindings::rpc_message_header_v;
 
         try_init!(RpcMessageHeader {
             header_version: MsgHeaderVersion::new().into(),
             signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
             function: function.into(),
+            sequence,
             length: size_of::<Self>()
                 .checked_add(cmd_size)
                 .ok_or(EOVERFLOW)
@@ -813,25 +814,27 @@ impl GspMsgElement {
     ///
     /// # Arguments
     ///
-    /// * `sequence` - Sequence number of the message.
+    /// * `elem_seq` - Transport sequence number of the queue element (`seqNum`).
+    /// * `rpc_seq` - RPC sequence number, echoed by the GSP in the reply.
     /// * `cmd_size` - Size of the command (not including the message element), in bytes.
     /// * `function` - Function of the message.
     pub(crate) fn init(
-        sequence: u32,
+        elem_seq: u32,
+        rpc_seq: u32,
         cmd_size: usize,
         function: MsgFunction,
     ) -> impl Init<Self, Error> {
         type RpcMessageHeader = bindings::rpc_message_header_v;
         type InnerGspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
         let init_inner = try_init!(InnerGspMsgElement {
-            seqNum: sequence,
+            seqNum: elem_seq,
             elemCount: size_of::<Self>()
                 .checked_add(cmd_size)
                 .ok_or(EOVERFLOW)?
                 .div_ceil(GSP_PAGE_SIZE)
                 .try_into()
                 .map_err(|_| EOVERFLOW)?,
-            rpc <- RpcMessageHeader::init(cmd_size, function),
+            rpc <- RpcMessageHeader::init(rpc_seq, cmd_size, function),
             ..Zeroable::init_zeroed()
         });
 
-- 
2.55.0

