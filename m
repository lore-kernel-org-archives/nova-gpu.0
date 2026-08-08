Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C6388E49
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158708; cv=fail; b=Wmll5xbNfGCm0R/rt5huj//iw6qYEvovv3/oDseRAt0hVKzX/GN5l1kWtCUq3LtXObJURdrC9EBwWfhqiFLnkZKn3V4j+6pBdvu0iZx6naH9wJCiKWPnLem0cq19ECFhu1yLgj3InwdpeXKorM9ClbFEfK5t6/zLW7H2k2cVMZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158708; c=relaxed/simple;
	bh=pht1DVQLuulETVRWMNi0PSOyv8J5sl57fBGUg9r7jM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R4z+sK5NDIW4ECV6dJCOra4qedKCeVfnDafBD1w3UT/H1kS+5bKIrmE6daKuvvxy9Wu/XIlpF4QES47WpDBakfV5vcNFivdUTRe7taZi10azH9yg2IBHfFNkXSwYF+frVhdcon9aul/Qu4HGo/sztMEY0Y1HzNasARz1zDzkf1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KClrL3C5; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KClrL3C5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1KMFDpdyMChZF255RTglnhnP9epdvBokRQ7dzQgKvaLDAKgMKnRr9G3XxrdAses+118NKYeTU6x/tsuVvRJU7pvxsRoH7GJB8z/h4y7nYlfzbD7MOx5l5prDQCwf6dQNw+QCivhPGx5NapYUckAj+UuVC3L9zzJol0ixcTGI0iGfrAA/f4zlVTsxrehi0mk+YKLURTX5Ysw/drud4qXBd9VnkXMTvG2mqfz78z0tK6sYZlCxtAOhPKtCxX6u/lWVySWFN2gSUUQXTBWUg8Rj/CQWI4j/aIridlll6eMFrLG0IgZXkVbTvMIg1wmYw4VKifi1U+S188WJGUqAKgxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHz3y5DKMJJ+2f2yTsIvFfnrNYxw/0un4RdJnBO8EFo=;
 b=v4Qan4PEQOzLzZjR8ZIs+cpIBUPq9ryJWGpIbEVC4X1QLTFv9xa8m2WHjBMDsFJtXo6Vm3ds5AFzQNPQrNz5GzxozUr/NagM8/4myV4M18n13V3LlDfU/X//++CNWvIhdYBoD5MsLnu1tp18TSJ2cFRM2jYbDdYHVJOrNnuzQxIhtqB5zXZHkuqZshMmG/uKjP3x+4vZ/D/zZr76EWd4g83IeaIVRgmwD+7ogsyckl4LTvWiGJTOrXb65lMDCy6mapiOBz6J+5Qnz2ZB9KKBRW9ETH7ThCK4LklfxCqRdHcvF1PCyXtyptOmoB8Yq2um3+ZTbJHP8pwzoe1XNN+7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHz3y5DKMJJ+2f2yTsIvFfnrNYxw/0un4RdJnBO8EFo=;
 b=KClrL3C5xBNgto1BHTQ2OnBWpq3l8j8OjZhDK3LobwpCIWAqrciT3ePFH3kzOxDhMBpa5u9Qi2gNhw1zP9apk2HWwnKng284T18ia3csYX95oqjqOWSFnyMHHB7RC7mwmjgOleFFmasFiKmkRGQCo5i/4mNCRcUWWooNVLegxFTQwVgH8LIZfR9UkfBGeQXFf9Mv971bQxj2wec40gvDyxpmoRW8fKNBhUjXQDj4lK5Sq/D8mua5nkFAAcJFU6+49g/VD/nmgH97rP96ET9tXuT75dWHxKg9IBUKr1fsB/mG367QnDPBROclh1lsk6GEb32Pnv6bROJSK0SAjUgFNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:35 +0000
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
Subject: [PATCH 11/17] gpu: nova-core: match GSP RPC replies by sequence, not just function
Date: Fri,  7 Aug 2026 20:11:13 -0700
Message-ID: <20260808031120.363869-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbd7a27-db10-4da7-de01-08def4fac15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	5qTDe+kxshXroin7ho1SBofa0XAwU7SsXlUmCbWEDkzRoVp8vVQmGp/yTU+7uMWzBHkI26URQYBZZik3ysSG0V3AJgJ+wQfc9ZUDOwPpZSRLvuNSd72BFthKFNgyOF/5Wyb0CzeY6qPGokMtlG/VdXW9IWPWLTy/3S6ZkY6LDD6LrU+KCL8Wjgg76MTBszbbeFsort3N3nrEehIlaJd9n55eXRTCYjEDzwjZ1BlaAH20v5+6zFxhE2uvjQbsOT6G9GDc2IstvNELDbnRhNMuJUyazmjF/JO+jcDDnENvwqQIADE0Doh0Zh6WIeBlaaAOK37Vhb7CnatEZPbBU6WwRvFdFtXkuccJkcuZHEFMci1gNzzaBSMDJSe70fe49aFfjBEroKCYcgcjXIj2XIzsuDPYhxqECa9B0fsVWXsf7wYAoYQ1iuif0x9G34Ddiv1aDIgaWBacbhBHr7N9IelBziAD82A7xmDzZRRukriaNJBSbVIum0RbtLwIqhHUjMIRR0PHEjwFirVqC68aaB73qPf3jh2Id+GP2+eVT7AkPY4rVfOamPztazdaNP41F0lZZ8s7K34axQmrgbk0wToRMVyN7d+YKBhT/D5INNkEsE43HTzuCZe3UN/KTI2j+n179pTjTN8TH3PL287kmbnqZEuFOMlreo1WP1sdH95fx0Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TAjif8YBXNbUp7WGo1TwhH5ag5MurrQkyBADkIPRUiQ/2uxcsDz0GrhBRB6S?=
 =?us-ascii?Q?OLCe5YCKxf0QiGVSqad6O/fq/vwR/1c0kLSfqlvngCoFRpZ9IKpf72Od8t3L?=
 =?us-ascii?Q?sWkg+rBI5Hk+bVTmlNWGerKudVhTbRaBvXEpUrx7vCYGbTQ+4MfWVP7jzgbk?=
 =?us-ascii?Q?c8ywzYhyHFPa19oscjcIYz0fws9vSbVJVLXA2eV4QArcChfn4fwNwrXiNsb+?=
 =?us-ascii?Q?wpMJyedPUtvp47xaasM87dxiYuPu1diby0bCoAG/uMDVFBc3QF854Cy0amgu?=
 =?us-ascii?Q?IrJ1ONM0eAciTmUkfraChRCgicd3UCyrh/aEgfKncpx2ojygdkyfOVP/nBu5?=
 =?us-ascii?Q?NiQkG7ZGOZzHsjmo6zl47Y4QwbskQ9YfUODLKZIo9tsluoWjkKJI0wJZLtAY?=
 =?us-ascii?Q?JQ0gg9oyRvZt3gNEH87z6kQg5MS8JPmcvOmRlOe6+0cANLMT1NHStWiYmOrn?=
 =?us-ascii?Q?W6kjK7PDUsl7J7dqCBKu2BGgr79kFPfx1dsB9j4iyjpB2FFgvs9ILpZHc/oH?=
 =?us-ascii?Q?HiYvWfMm8JKXHKuEn95Llp6wIwlxrTLgq/KWHNX0aY+V5QPEPANxae+o7DRy?=
 =?us-ascii?Q?rJS51WkuJpM6+2KXK9LqtXcuL6lTA3nngLpwsGbqlFP/7xlRMIl+Gt1zDihz?=
 =?us-ascii?Q?BVUi1wsZklDwisn7BiMv1Kd/6ujvUts30m+RHBrKAwC+OUxFoi/FSZBqZMdG?=
 =?us-ascii?Q?8bTZpe+U/Zi6DpawLJUP1sLKN0LM/rpadDd/OUgN78vvNfpMfCMTX+X6xS9x?=
 =?us-ascii?Q?qr/Z+4obpg5EGGOGhsnjfUC683GIwqogkJFILFbEHwC8tJCQPY5HPVuyn82b?=
 =?us-ascii?Q?Vgvdj+ZAusgpRS0UD3IQLvPMU/Esjoim1HHWV6bR1Yp6pCpxUpePK0z6O6gn?=
 =?us-ascii?Q?6dEFtUgX4T5NEQNR6pT+5ft1H57x0q0aJ4CDyN8PdaTORWUinPZPGCEs4GXt?=
 =?us-ascii?Q?Lq5Q//DN7FJDu/2EljHYX/kSquxagRTeVrqYsXAe9xWnFko5mYU5jIUSET25?=
 =?us-ascii?Q?kCEuPQ4DDg89FLrfX3EhTeja4tIP3KT2k3xDaY7VqZysoLeqLc50xmY6ByPm?=
 =?us-ascii?Q?jvFNH8aNOztYZkH7SFPGHvwdBYWhPduAzCHOSPuTC/xkH+dxXesEjGXLgvgv?=
 =?us-ascii?Q?prhWEusAmvv1PTJEihOwF6oFPtHoJweQnFQffSTs1i4Qqz5h5zI0ZqnJz3Kr?=
 =?us-ascii?Q?I6YJTD/l7OAsvOYdJKjWxwSWl1G5ZP5qAVK+boRVBhii6dsf7tkxHFl936nR?=
 =?us-ascii?Q?DfmYTA8yux//BtVP9qyiNUvr+yfFr9twGOEqvWPmnAlZpEPaEP4deaiO42eo?=
 =?us-ascii?Q?vKJnGIdKLGyB8stck71ttSfk72qWxoyXUTa0vBL26sxFGmAOSe5uepPG56Hc?=
 =?us-ascii?Q?77TxYO+3ro/P1VlHCn73cP3clpEHRdvdI9ZoehxcuEyWTg1Bts1pjtZLyoE8?=
 =?us-ascii?Q?8d8HTMuwVKOwFd/1xMKXbCVlbeShjd4uN57AbxoB5ZjhB3MANZCKq1IEAjCO?=
 =?us-ascii?Q?x+CyaBkh625lqbHUXF0pryaS+fifNtRxt6ZNoUD+IZs9YbD/tEjYFhuyrwpI?=
 =?us-ascii?Q?7NCoEPwN1belIlX23Z9cUrLy7rF9LRIKzaPmvjsPUolch/c5ugjgstJFSDSB?=
 =?us-ascii?Q?IbA9hlfzj6dzTQBZC3SYTEob2MNlNKIGEj3R4BM/moClvGGzomcNn511yqI2?=
 =?us-ascii?Q?QLZ2PvAKJasmeU9SyFTbv++xAhxFsBLLga+W/wpF7e/r49zm16yfOj9VWN+N?=
 =?us-ascii?Q?6+Utz947tA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbd7a27-db10-4da7-de01-08def4fac15b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:35.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wa9UGz7cZaQjNpejo4PPNhM8DQKrAqCWSoDrDexqaBmMwLWW7TD0Gmsa5GW8D6+aDiGuEBtKRdSdWFVc02gtig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

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

