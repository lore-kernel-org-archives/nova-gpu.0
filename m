Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59B3B27DF
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693779; cv=fail; b=Y9OjhBtj8TjGMYoMdIbdPUCc2J4JAbHvemeUORuWcUH0bFw9U76rmCFIQ0ZU6u71UWP/UcO54QZBGJ2VOt059byPrkRrjcJXQTj2izCk3wyZvg0gP47mEZnKh+oCD/a8RtL5vAbWyWmXi9WDcnkFJsVj4RBaYSiqk7JhqoWgCak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693779; c=relaxed/simple;
	bh=+vJ+/A7j2+TONkXuK1Lbs2ju+d2fkvYdIaIOqKjYdBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Np3RIEEm2Ys0kUKS8ahvOWMuDSIEYYyfiYeZlFzua9ffGaUoD337DRitNRr+avFHW0KHmNOJdoIzpOAKzdiqqCY4HZyvXsSZ2Fn0fhXyXP0fHA5m3X+n1+rBySy4VdMtdEPyvHq7wORAX6LVbRHW7rG9x67852sUVgwJrcHFI34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bN/mpA6c; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bN/mpA6c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQ1fFVzGozRyzeTO4vJZsQTtrMB0NtAb/1O2v+cIGoRDV65bZcMXL7Pf6WgC/81Y6AjzmxCimBUoiyWUvJVTrpVjtTK+/oioWNLK0FSiCBnTqI48YgkV19qipO3r1OjR+LHEP4oqqIWto3uM1SwIO4zSyIJ/dhXTqQ6vGYBC3o8gviVBR7ewJKXFS6WOmbUHQ5AfzpAy3yRHxbnEYW/1osBEYptfFXvg+mx7ICuJ8rzNHUKaitdNFQPMZ/Mss2wYxDCcUVArjUfATgtQUFiK14FYA0mA4TmWdo2KKDuaVkpuSSTkuNHdZkGSEnhivqfXjyeuUSP6c6gg1zNIrpsspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKFrl50ECKUCayG+CUK5LQrUV9AxQzNsQhrg3LpbQa4=;
 b=v1UQm+x6SYFLMsoT8oqdF9GzUH6cqokC+mBontLuXcuzR8sS6ilGeIKFwQwRWpiQL0uSdloSFfkioqS5202RYDS3QEfgtEcv62jV5zWWDGfCUnuI9XwHK+WSgTU7TIvJ5k9bVjHTQv+1TNP4otJi4j3v1fe88qhNy1oF7z8MnjsRWfLeXhQHrU8SOa2gzeaoyblcn7ZfM9B5aTfXFMlQgGeFR7Y9yUaE3Juc8yfTgwHYzEpFYw0R6j/mLu+6y45XAnRB9X2ZHbNFn1zsvbMj0PdgACLHfBkj6T1waWhnkkdsUyBUeUBo6ermiEbNQgh/q+bBnBAsM+0xkOOqGpLVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKFrl50ECKUCayG+CUK5LQrUV9AxQzNsQhrg3LpbQa4=;
 b=bN/mpA6corpv5CccCn+/ba+k3DcqE7HLtVVa469L1tBFVzfFJrtBeNUysgLfWuTxNAKly5/+EcLrGgsHIySXnvFZm8uKpptv31/1TQTayViAVfLo/4YJBrKI1IOmKGhAMXDzDVvgWof08geCB9OdUjD3hnCIAUTM99EGjbcPVJLbbV8/ePTEWaBTUvOU7844GK1i2lhgS8BqR38PbSqv9xHFv+slKbwUL+KYRnyhlW4bXZow9w56uDpDp+EL1vreuUsCxQhd1IGcsF5cb3nS8dBx9Lj+HUw8+FMQvRjo9o/VszvzzdwXcZSI34vZqKK6aZG7t7YbBWaBefN4E5yl+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:09:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:09:10 +0000
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
Subject: [PATCH v3 30/33] gpu: nova-core: match GSP RPC replies by sequence, not just function
Date: Thu, 17 Sep 2026 18:07:16 -0700
Message-ID: <20260918010719.1176945-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0024.namprd21.prod.outlook.com
 (2603:10b6:a03:114::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 6354429b-12ec-4a80-5280-08df15214923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Dtoou8yYHwLtg4IxO+SqXa11OjsLuUNFF3fXBlJ/BJN7ogONIn5mH0hvednPa0os6q+IuU2j9ZdbsmYCey2GZINXpoQ6O8aBT+jW/O8DKN2hcV9c72iJEkj2PDqNkb/utiZe70UU+/Quxe1P/X+zm6f4ny9hYM7noIFVOllkNzEOh7i6R4xyTk7lC8YKZshO5BHqaTG5DHrG5VvZdPn+wydyb0gxUO+oV9IXl7RWkde2c0zacFwkpdfdoLH7vpvErsvhzZACO8nbi7vMqa8O+1M+LuBBUuSm6Of+hOkKFltDRDQRzzdZb9u2gf+bb2MWCnnZ/zzqm3AhNoI24I7Pa6Xpx7tktrNwCv/VeYXPc/H5Jk8MbU6bV2NjWUJmqaKlL+g4KFi0oVCi+6Af/+Nqp04RxAelvpRtph1Chq9FB9o7mES7dxtUZPGRmGj+xBMEUws9R6ZPLlMpnI5mA9Xy0ybZ0+o9jjwQXMSJ98/KIwah9m+y3DMXBnq6Y1ClTtJ7Uj08PyAJBq3AQMZ53F0Vajkm8aGLXIk3BaJBqT9usy79wE0HndAbvCcziAWMRsstDxfBmg3bc63JfmuZzMFfVMW1b/e+EMMA9Bu3wJECNypJe9840RgbkRqPXIRCt+5Z4H1ZyeEVLOJKs2r4YD0YU+uyjjF6vDeZDlcpAMdC6KU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Nu/DKyLUcWmIBrI5pekLP/oJRDigBO3RgIsb5VpLJF/V89bjjY1vVDMacUT?=
 =?us-ascii?Q?MeJlBnueRg8eEeB+2EP/kEVKDLDTrHqBl8d/Qmk53mWN4fiFy1IG7GWX5R++?=
 =?us-ascii?Q?Kw6db4fLerZPMon0OpKqHQTEpTaHTYwezBNLKR3mUOdIEd8WK0+T6TUY9LeP?=
 =?us-ascii?Q?tTm/kvgyL3SgPav/GR2MEhMmiz0uI0H8WLlAWQbZ8AQpE3vTLveIpT75Mshn?=
 =?us-ascii?Q?/ayK0TdcBTY2nJ1tBQdJS3kG9womkDwxF+JkkC5Q4ojcpGDeTrGEiObinjU9?=
 =?us-ascii?Q?Bcmebkll8bnAvU9YZx8ClBlRtk/9gTDnr1tdeG0rS6nEcR1D8Rxjh3cIlEcy?=
 =?us-ascii?Q?3Uag07RBILAlpSMfWLBr+rW+JEQxvk2PMi3yIRAmbQThFJ1sdDHnqqwiZDxd?=
 =?us-ascii?Q?PY44GcxdQjyCngy+UBqQD66kW14XpqgRnK8F8Vo8vc+DEYXovAshc+LWQUAf?=
 =?us-ascii?Q?MRAiG1ctkzpmKAFI71xqAnX7ShHAZyjz+9I+bOail6nsQ35RAeZRwnUtSBYm?=
 =?us-ascii?Q?VtkH7mDQW2vdmoHR/q7uKG+KHlhhNFOJk7mDjS4KVAA/miiLAsd6k9+UThdm?=
 =?us-ascii?Q?ppioypLoxWSOj4VC+viwKcYrTTd8UND7pYp3nJiygOVNWU/tpG0pPH5XEhVz?=
 =?us-ascii?Q?JaHlqq1o/8DAcZ8gAEgtad6Ct03XUAMrfrXLhEqL+gIxYzxQSExw/DnHQEYs?=
 =?us-ascii?Q?ERriUnr2ccj3/cwn+aJjcQqPwMcvIXH7tQ9+lhuvzZTUhlmhZDheAibHPoXW?=
 =?us-ascii?Q?wqD/7T5LUc4sPBPC3EDjZ3+bEY5Hfh83GL8VHc6uohIn9A/7UhxqvklJ3QOK?=
 =?us-ascii?Q?hMUwjeS97edYrc03sksvbxSFYXy2BXigeGIcnKNyiLJbrkAJVla/idjg48M1?=
 =?us-ascii?Q?MiO+0rHfenXSRRTA4EcoDWB01v9w+Vz1VCEoX2e6O9lj3evWOcaEQPq4Bpb7?=
 =?us-ascii?Q?4tDyaQJ68jKJ1j7wtmutzvLaCiE2OkdXBsa/U5TSHJWTWYSvRmb7+1+peRpC?=
 =?us-ascii?Q?ICiqs9si2psQ9R5jV7zFBTYMQM3X1E89WXcAsDrkTxHfPgLDWROkccV9hgYl?=
 =?us-ascii?Q?paj7tdBU/isGP3GW3ID9C79khqHeHjOxy0P2sK5AYH0bTWxWUJQ5AQfh2GkA?=
 =?us-ascii?Q?AfCnNiB5cNDXXH1Uwr7q2UGIwvr8/yLpw7cCA8jJFUQQf5TmFfIn9KgHAd3H?=
 =?us-ascii?Q?3ZozgVwOGtAOi4NzyOFxNFioL/t6f8T3t4htxgM+WjC0UAeAzI9JgErfP/Oe?=
 =?us-ascii?Q?e4D0Nj+rtCE0ErTHtoeCgznxGh/Hws/HqV5CWNNMArzEvTGmFHIAxys6qSqv?=
 =?us-ascii?Q?o2j+Jkl2df5HhDV4tqOXbCZFsMjomVfAQ77JRgUcUDzcdHw5wJQvqnKHV5HI?=
 =?us-ascii?Q?FqKPzVPIXbOfxSAlZTc3RpToMz0/3eTLmN374UZ+sznrc/uvfSqNq9qNXo/c?=
 =?us-ascii?Q?unZsM6c2zbqTkEkEKFBNa1ZpqtoZM1mR8VvKgnEWCPqF+RhPwUQcLAEEs4RM?=
 =?us-ascii?Q?f3hr4QYz9qC2TJprcRf6afcgwv6oFyuRXoK0mgM/PDwUCqtFMXwAp/8cY+Ak?=
 =?us-ascii?Q?y2Gugty1/TUNdDqzXj4dxa8WjaRzaLS1evfkMbiLx5Qbt7FiV6eaKeYT4lk1?=
 =?us-ascii?Q?H0af9C3NfzFV1Suo4SO5d7+QotpnO3zq+2GEXxosE+P4TO59a59QHWf9+2SP?=
 =?us-ascii?Q?RoYe0RYa0IE8AdjOF/0sfU72X4uutgLYYH/NVuKEXkZFMw77uEFE6FrY8RBJ?=
 =?us-ascii?Q?eyblTUxkvQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6354429b-12ec-4a80-5280-08df15214923
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:08:01.6291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsUl7fK8zbp9LXQ4RUpb9faO2OfRtubriFm+01Zrm8TAoIN82w1xkiRLS4MFrGmUom3oDJOV9qJzri4wsPclsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

GSP-RM copies a command's RPC sequence number into its reply, alongside
the function code. The r570 firmware leaves that field zero, and the
r000 firmware fills it in.

Nova-core matched a reply on the function code alone and never set the
sequence in a command, so a reply to a command that had already timed
out could satisfy a later command with the same function code.

Write the sequence number into every RPC command, and require both the
function code and the sequence to match before accepting a reply. An
unsolicited event answers no command, so a caller that waits for an
event still matches on the function code alone. A message with the
expected function code and a stale sequence is a late reply rather than
an event, so it is logged and dropped.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/interrupts.rst |  9 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs          | 94 ++++++++++++++--------
 drivers/gpu/nova-core/gsp/fw.rs            | 13 ++-
 3 files changed, 77 insertions(+), 39 deletions(-)

diff --git a/Documentation/gpu/nova/core/interrupts.rst b/Documentation/gpu/nova/core/interrupts.rst
index fdcd789cf4f9..8519c73e9989 100644
--- a/Documentation/gpu/nova/core/interrupts.rst
+++ b/Documentation/gpu/nova/core/interrupts.rst
@@ -574,9 +574,12 @@ function code says which it is.
   receive trace at debug level already records every message's arrival with
   its sequence number, function code, and length.
 
-The sequence number takes no part in the match, because the GSP does not echo
-the command's sequence number on every reply. On r570 the reply to
-``UnloadingGuestDriver`` carries sequence 0.
+A command's reply must carry the RPC sequence number that nova-core wrote into
+the command, as well as its function code. A message with the awaited function
+code and a different sequence number is a stale reply to a command that already
+timed out, so it is logged at warning level and dropped rather than classified
+as an event. An unsolicited event answers no command, so a caller awaiting one
+matches on the function code alone.
 
 The read pointer advances past every message, whether it matched, was an event,
 or matched but failed to decode, so a message is never left at the queue head
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 93c31b49903a..fc26c7d8aac0 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -555,7 +555,7 @@ pub(crate) fn new(
                 inner <- new_mutex!(CmdqInner {
                     dev,
                     gsp_mem,
-                    seq: 0,
+                    rpc_seq: 0,
                     poisoned: Cell::new(false),
                 }),
             }))
@@ -587,9 +587,9 @@ pub(crate) fn send_command<M>(&self, command: M) -> Result<M::Reply>
         Error: From<<M::Reply as MessageFromGsp>::InitError>,
     {
         let mut inner = self.inner.lock();
-        inner.send_command(command)?;
+        let expected_seq = inner.send_command(command)?;
 
-        inner.await_msg()
+        inner.await_msg(Some(expected_seq))
     }
 
     /// Sends `command` to the GSP without waiting for a reply.
@@ -607,7 +607,7 @@ pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
         M: CommandToGsp<Reply = NoReply>,
         Error: From<M::InitError>,
     {
-        self.inner.lock().send_command(command)
+        self.inner.lock().send_command(command).map(|_| ())
     }
 
     /// Waits for the response to the GMC request with command id `command_id`, and passes every
@@ -647,6 +647,8 @@ pub(crate) fn send_gmc_no_wait(
     /// Waits for an unsolicited GSP event of type `M`. Events that arrive before it are logged and
     /// consumed.
     ///
+    /// The event answers no command, so it is matched on its function code alone.
+    ///
     /// The queue mutex is held for the whole wait, up to [`Self::RECEIVE_TIMEOUT`], so no other
     /// caller can send a command or consume an event meanwhile.
     ///
@@ -663,7 +665,7 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        self.inner.lock().await_msg()
+        self.inner.lock().await_msg(None)
     }
 
     /// Logs and consumes every message the GSP has already posted, and returns without waiting for
@@ -685,8 +687,9 @@ pub(crate) fn drain(&self) -> Result {
 struct CmdqInner<'a> {
     /// Device this command queue belongs to.
     dev: &'a device::Device,
-    /// Current command sequence number.
-    seq: u32,
+    /// Next RPC sequence number, advanced once per command, however many messages the command is
+    /// split into.
+    rpc_seq: u32,
     /// Set once a message fails framing validation. Every later receive fails, since
     /// the bad message cannot be skipped. See "Draining the GSP-to-CPU queue" in
     /// `Documentation/gpu/nova/core/interrupts.rst`.
@@ -711,7 +714,7 @@ impl CmdqInner<'_> {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_single_command<M>(&mut self, command: M) -> Result
+    fn send_single_command<M>(&mut self, command: M, rpc_seq: u32) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -728,7 +731,7 @@ fn send_single_command<M>(&mut self, command: M) -> Result
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.
-        let msg_element = GspMsgElement::init(size_in_bytes, M::FUNCTION);
+        let msg_element = GspMsgElement::init(rpc_seq, size_in_bytes, M::FUNCTION);
         // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
         // fails.
         unsafe {
@@ -748,22 +751,22 @@ fn send_single_command<M>(&mut self, command: M) -> Result
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
         self.gsp_mem.advance_cpu_write_ptr(elem_count);
 
         Ok(())
     }
 
-    /// Sends `command` to the GSP.
+    /// Sends `command` to the GSP and returns the RPC sequence number assigned to it.
     ///
-    /// The command may be split into multiple messages if it is large.
+    /// The command may be split into multiple messages if it is large. GSP-RM copies the
+    /// sequence number into its reply.
     ///
     /// # Errors
     ///
@@ -772,24 +775,27 @@ fn send_single_command<M>(&mut self, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_command<M>(&mut self, command: M) -> Result
+    fn send_command<M>(&mut self, command: M) -> Result<u32>
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
     {
+        let rpc_seq = self.rpc_seq;
+        self.rpc_seq = self.rpc_seq.wrapping_add(1);
+
         match SplitState::new(command)? {
-            SplitState::Single(command) => self.send_single_command(command),
+            SplitState::Single(command) => self.send_single_command(command, rpc_seq)?,
             SplitState::Split(command, mut continuations) => {
-                self.send_single_command(command)?;
+                self.send_single_command(command, rpc_seq)?;
 
                 while let Some(continuation) = continuations.next() {
                     // Turbofish needed because the compiler cannot infer M here.
-                    self.send_single_command::<ContinuationRecord<'_>>(continuation)?;
+                    self.send_single_command::<ContinuationRecord<'_>>(continuation, rpc_seq)?;
                 }
-
-                Ok(())
             }
         }
+
+        Ok(rpc_seq)
     }
 
     /// Logs `reason`, poisons the queue, and returns `EIO` for the caller to propagate.
@@ -803,22 +809,26 @@ fn poison(&self, reason: fmt::Arguments<'_>) -> Error {
     /// Sends a GMC API request to the GSP.
     ///
     /// `payload` follows the GMC API header in the element, and `max_response_size` is the largest
-    /// response that the caller accepts. The request carries the next sequence number, which GSP-RM
-    /// copies into its response. The number is consumed even if the send fails.
+    /// response that the caller accepts. The request carries the next RPC sequence number, which
+    /// GSP-RM copies into its response. The number is consumed even if the send fails.
     ///
     /// # Errors
     ///
     /// Errors from [`DmaGspMem::allocate_command`] are propagated as-is.
     fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32) -> Result {
-        let seq = self.seq;
-        self.seq = self.seq.wrapping_add(1);
+        let rpc_seq = self.rpc_seq;
+        self.rpc_seq = self.rpc_seq.wrapping_add(1);
 
         let dst = self
             .gsp_mem
             .allocate_command::<GspGmcMsgElement>(payload.len(), Self::ALLOCATE_TIMEOUT)?;
 
-        let msg_element =
-            GspGmcMsgElement::init(command_id, u64::from(seq), payload.len(), max_response_size);
+        let msg_element = GspGmcMsgElement::init(
+            command_id,
+            u64::from(rpc_seq),
+            payload.len(),
+            max_response_size,
+        );
         // SAFETY: `dst.header` is a valid reference, and not written if the initializer fails.
         unsafe {
             pin_init::raw_try_init(core::ptr::from_mut(dst.header), msg_element)?;
@@ -830,7 +840,7 @@ fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32)
         dev_dbg!(
             &self.dev,
             "GSP GMC: send: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
-            seq,
+            rpc_seq,
             command_id,
             dst.header.length(),
         );
@@ -908,6 +918,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// A message whose function code is `M::FUNCTION` is decoded and returned. Any other message
     /// is logged as an event.
     ///
+    /// With `expected_seq` set, the message must carry that RPC sequence number too. A message
+    /// with the expected function code and a different sequence is a stale reply to a command
+    /// that already timed out, so it is logged and dropped rather than classified as an event.
+    ///
     /// The read pointer advances past the message in every case, including a decode failure.
     ///
     /// # Errors
@@ -918,7 +932,11 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ENOMSG` if the message was not the awaited reply.
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
@@ -926,9 +944,11 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         let message = self.wait_for_msg(timeout)?;
         let function = message.header.function();
         let seq = message.header.sequence();
+        let func_matches = matches!(function, Ok(f) if f == M::FUNCTION);
+        let matched = func_matches && expected_seq.is_none_or(|expected| seq == expected);
 
         // An early return here would leave the read pointer on this message.
-        let result = if matches!(function, Ok(f) if f == M::FUNCTION) {
+        let result = if matched {
             match M::Message::from_bytes_prefix(message.contents.0) {
                 Some((cmd, contents_1)) => {
                     let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
@@ -951,7 +971,17 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
                 }
             }
         } else {
-            self.log_event(function, seq);
+            if func_matches {
+                dev_warn!(
+                    &self.dev,
+                    "GSP RPC: dropping stale {:?} reply (seq {}, awaiting {:?})\n",
+                    M::FUNCTION,
+                    seq,
+                    expected_seq,
+                );
+            } else {
+                self.log_event(function, seq);
+            }
 
             Err(ENOMSG)
         };
@@ -967,7 +997,7 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     /// Receives a message of type `M`, waiting up to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
     ///
     /// Any other message that arrives first is logged as an event and does not extend the
-    /// deadline.
+    /// deadline. `expected_seq` narrows the match as [`Self::receive_msg`] describes.
     ///
     /// # Errors
     ///
@@ -977,7 +1007,7 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     ///   [`Self::wait_for_msg`]).
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
-    fn await_msg<M: MessageFromGsp>(&mut self) -> Result<M>
+    fn await_msg<M: MessageFromGsp>(&mut self, expected_seq: Option<u32>) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
@@ -988,7 +1018,7 @@ fn await_msg<M: MessageFromGsp>(&mut self) -> Result<M>
             if remaining.is_negative() {
                 break Err(ETIMEDOUT);
             }
-            match self.receive_msg::<M>(remaining) {
+            match self.receive_msg::<M>(remaining, expected_seq) {
                 Ok(msg) => break Ok(msg),
                 Err(ENOMSG) => continue,
                 Err(e) => break Err(e),
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 14271fbe0c25..ced7da14c0b2 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -470,13 +470,14 @@ fn new() -> Self {
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
@@ -503,8 +504,12 @@ pub(crate) struct GspMsgElement {
 
 impl GspMsgElement {
     /// Creates the queue element header and the RPC header of a command with a `cmd_size`-byte
-    /// payload.
-    pub(crate) fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
+    /// payload and the RPC sequence number `rpc_seq`.
+    pub(crate) fn init(
+        rpc_seq: u32,
+        cmd_size: usize,
+        function: MsgFunction,
+    ) -> impl Init<Self, Error> {
         type RpcMessageHeader = bindings::rpc_message_header_v;
 
         try_init!(GspMsgElement {
@@ -514,7 +519,7 @@ pub(crate) fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Er
                     .checked_add(cmd_size)
                     .ok_or(EOVERFLOW)?,
             )?,
-            rpc <- RpcMessageHeader::init(cmd_size, function),
+            rpc <- RpcMessageHeader::init(rpc_seq, cmd_size, function),
         })
     }
 
-- 
2.55.0

