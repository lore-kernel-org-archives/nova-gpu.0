Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903038735E
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188277; cv=fail; b=swrAIZ68TLhcclET7YeDzhfXwKzZWTNfn/7sQbPanKSz8ZsJe3JYf6q80Lt7+fkH1UtGnb6vGF/JLZXf4sA1pG40msWbYebq+Xs705t3ukVMwDP4G42YdoJlcm/es90u+QditqwEfnJ5jmz5Wj35ADYP7+OqZTeZ+dKjwXGkauc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188277; c=relaxed/simple;
	bh=PNjtLV5cPLI3FYnokO/JndTY9/4noVNcjsVrqqYlVKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oXUWpWtFj3gdt8xDDzALxld1mOHFOuu/or1CyMcQWAFHXmFsOta3g9q0iowQGCK5b5LCtpo0HRI7aRlLGIlCcpHkN2oMcW7bm3dV6H66t5d8NfngduzfXA8AaKfR3Rk8jx0NlRV/Vox4SWXeZ/RMxemSEC/hnAXAhsRhVRSMyLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f97/RJUH; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f97/RJUH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBGDxftSqZ4pPaGdZtDxXuzeG0I/bk7CuWLsc1PlSN68ZlPK5+bBnyiYktkzhLGzppUkmNiZAWTj2L6xaU/QpwIFwgIS1LFu/onQpaCCN2+WrZpNWXNWplYguO5uDO0ZcKbyq37TMr5INicmx1Kl/imLpUH3Dcf9M+U5av5UdLcNNx12YqlKHIQ6jZCezb+WMJQyYMOXQ7yZMrG8veYD+anh5tkMaZC+wEMih5Q3DGyThARUrGcfnKoL8lSFnj91/XqHgAJCdMhcNpxVm0cxBsnf5gzmZ4EKAo33wA4VcfXv5wgKEz7ebzAqVwflL/C4OncQHVU8PohVtkiojgnRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLGGnm5er6ZVOnOlxYg9GztoA97c9MGWeY3sRGaPkIE=;
 b=ebyni0t8ezI/4E0mGCupXRfV2gPD9ojXjvpF/KclRSqNmV4aKoQLzkYt9EXZp+YQQkyVELRhL7KYTt44PguWZAQeQHUoxPjiKb61J32R4CMsxjeJj6jaaaEW6+AdPpStYz5nkFNSM+ZDFHT6+J62h5ObzT2H8zGmBncxQR2KztH0TRAzxNpgvOUF8rBSqaJ7nT1nVs4mve7rYV0nn+hP44FWbSZg8RGowTcdTa3z1WDiea60+1jMflC8T5HonYVZPKUk7fPIe1nV8s/LZkHXMiV5UFyyWjBkqAzv/8RWfLV7DZ6QqoUKI52KxKmqSrHSyl/mhS8d0dq6+sOss04ZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLGGnm5er6ZVOnOlxYg9GztoA97c9MGWeY3sRGaPkIE=;
 b=f97/RJUHgWXwkVoW/E3twaXv0NsurC8IpVS+G69OektlJ4WxafgeS9+jVRnsJOQkBsygawWQPf7R5JOJt4oMCOxES+hn/MHAWtFm9egV0p1BlCmGAt1TiNtZCRhDrpG/6SDFhEnKu+Jhn023+Y0l3rqs2cwS+b76FNPFjaNrCmwUOkw5OIyTL55u+GaYlrcZGyd2MAh6bq1JUX7yD+BuybKQtn60Sk6tr8vBk7RaT1/gJpfx93/BhCjQotF5CppsJ3qwvvDPSZ9Al5H2q3nUZ28ifNyngInFtvijoVuPISyDdFVUFHcwQY55BpjN948xnnjybMR2rv51oxalgAGNHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:25 +0000
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
Subject: [PATCH v4 11/17] gpu: nova-core: return ENOMSG for an unmatched GSP message
Date: Fri, 11 Sep 2026 21:43:54 -0700
Message-ID: <20260912044400.677097-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e94632-2ef6-47d1-8f72-08df108885ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|3023799007|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	hUc6N0wQoJry50gbPqqCgIR0EGnrTB2rgyHQGSIibJAq87r/IyTSWoFYk2VJcodpqga4imhLjEfz19f/i6cpFitsaAjdV+NZLWHaIDtI2wOqSGzrlriDO6xX1gwmi1+O9j/+UVNA6eQJfWNttKcWwTMAH2t2pSmpNQDVk94xXgxlxU9UQY8CwuDGlq13rroqHQq5T2yx+Fgjlca0BkCUkoyjHZJfpRtjutuQX2+wNkQWJtqvmfyHI2V6oSoxAWFI0rnwQJaV3HnVvlr9hSSut56G1OC35iRVd/WUitw8MXkp4hN4qSwAo2H5X90GtPIDAzdidfDy+Yjzg+AjroODc4+0Od3XVV2VraBRuoHczSdTZ/V+vWgIVuz8QF9KvU+jXHoQoLBlgxnojsKApf3QObBIJJUejhS7BgiplRlhu9ZZTVVhbBU9c78AXpRleii28hrOOSHvRXA7FAMHll3SuF9hrASgecTTX8DuXPSCq9sGeOf7X9mOpyZ6SbAZPR96VfJzMYy3AeEAwpzRzqWjDzE+vYnO2WJH0sMW2DWbh1rQuiOUoVR38jwajsbrpZw+csbl56rpofEMUZUpELxRs/8zcg9+nY9SqAYDjZA2kfACoHRyorjBEwJJjeLt2uhHNnjX/x4nhmr/opsZMM4CqInGwnu5ifMTPqxEmJp0qpM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(3023799007)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uaqZBITFpchc5k7eNizhM/4hTphXNFuYcNbH8rvPyWAOM7FQTwhIIjdNO3Ij?=
 =?us-ascii?Q?BZWy+yjL76r9fHogUS9cG+I2B4Nzy3q8BffJZ01bV3VSyInHnEyAqfx6kfet?=
 =?us-ascii?Q?90337k9cEeFT0p7UvU+ij2U+QlKK7BLULBlCa1G+OXU1EeGEUgKuQCy9d2ye?=
 =?us-ascii?Q?EmqmJvwL+kFoT+WuSBns7EMpyjdcalsTFlUj65J3O/WaNrmUh++hR+F1JN6A?=
 =?us-ascii?Q?Z21MoWFIZywMMlT3q4kKTFPD6auWAR6IJWGH19AXnsgpDWcLaG2W3P1kkKX9?=
 =?us-ascii?Q?eBvzgibWlEjEVHnY7y6Gb75arLRJYFNli2k0kOwQSwj4NAfrxlW0T09/Q46C?=
 =?us-ascii?Q?N97U8fnT/zUUoQsqn5qc2GZ+V8xFtxgZJz1tpHUR72xV4tU/7B2PSbgiz2uL?=
 =?us-ascii?Q?cUDVSWIqW0aOvhy4TFMhFtLBQMyWg6XOk8QTkhNC04XY4TSLGk2lsRuTyzKR?=
 =?us-ascii?Q?VyCK+wvNSfvw3NQIuANUl9eUDmukuQeXhY/o9epOTq1rpP187d1v/kX3P//M?=
 =?us-ascii?Q?pP1wgTq5IR/ZxGJZd1Vl7KRPjzfL2+2vISSqCGGsUR2uD+5hxGpzO4xsw3Wj?=
 =?us-ascii?Q?gX/DkcAcPKhyOlbdOL5HallOW2isdUws4xelW9i52RLVms/zw/JjSO/XS2Kj?=
 =?us-ascii?Q?ti3345VA6dtM5CAqDQZZJW7PA29AD+zD/WZMmfaIJ3i0dqrQCtFDHKVG3ntI?=
 =?us-ascii?Q?XYOkcBfASdiTYswMgia6RZsihYsEREIrH/LUd/JtQ08iCa+QU8ch4J3GELg5?=
 =?us-ascii?Q?iSJ3nh2WdBbjd50bJLwonAbXW08yILocfuTv/CsIaAtZo6dIb6MXjSu/hHft?=
 =?us-ascii?Q?nTaze8GFjBZjMQnwIRqRcAn9w8eXBLb1/Qdd4U+HsM4nji8OxlqpnQ3KE6ei?=
 =?us-ascii?Q?gFU1SaHuC7M38Jc+ggAp41DoturqTHhchajQbAZ+/1VUzb6QrciJjb8BnvKu?=
 =?us-ascii?Q?NLsjrp2DSIYHv7zu0pdaxKoZQKn8jtOx+V5PbdONwgNjmE7JNRVe+BoArn0G?=
 =?us-ascii?Q?QiDpL06QUaTTjHdkU/Cwm43EUt2bruEjj2SWED/JgUI2cv0kAKYvoWfBM5q2?=
 =?us-ascii?Q?2ogOvluW/d7CUqgGUNS8YZChIT1uKuR7XrmXkJHSSlqETgRqc3MYXuofym63?=
 =?us-ascii?Q?w3b09f0m1FARwP4mvm6czHiKMMftMO6b11fyrLLAk+jp1sRh9U36Hl98OBMp?=
 =?us-ascii?Q?jKCXCcRjKbgA/03A6cpOPtn+EX7xgfE0t3iA2mgEdqUx0YNHrx7A1HvOozGV?=
 =?us-ascii?Q?R0QurPAFE3TpO395dtSR6dhRLJFOf1oMEMqpGMIxzqJRnyZhGEudmubq+nt7?=
 =?us-ascii?Q?bGWvR9uUI4BgdGmju46aL0tDeFU5XS9VDXN974qoq4QYkWqyzbaoN3kNRXYX?=
 =?us-ascii?Q?Gq/LJVM0cKy8U1ti7yTvCQDexeamYPZUHrRUyl9KaipYtZAnGpVTGIKTMG/e?=
 =?us-ascii?Q?190y2/su/wr7cTQgaac3e+cqU9kUNTdQWqSJyPUZoFLz40IE0Yv95UONYICE?=
 =?us-ascii?Q?mRxk+tzK7TM7OHxDYap4YEh7CsN+ky1U6+FJgC07CR01UQwgD3NOPVYxLT5r?=
 =?us-ascii?Q?4RQZSb+s6IPxw/jk57DDCFLXFofLdoUbfkcbvAvSuTQRHFr9w8LvTw/SIbTU?=
 =?us-ascii?Q?3fKZ+xdkblz1HnLx8NK4g0z9IokUkqHzYg7CNATP2ngQ9aM1qHqfULvZQtRI?=
 =?us-ascii?Q?9qNcfxaJjWHpht+vVhjI3PYzeFOPUZZ5iRR9ELiFKY2O8xXIvDbh4c36+i17?=
 =?us-ascii?Q?T4T/7vRZXA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e94632-2ef6-47d1-8f72-08df108885ca
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:25.7899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p81jcNXZrjKNPSojO+LnYDgIw1WJMZKgMWQUdV8c/vMTbkzmp0mSY3M7zeIBZ/DGETjg/rLlV5Ef29MK0DdhUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

The GSP posts unsolicited events on the same queue as command replies,
so a receive that asks for one message type has to report that the
message at the queue head was a different one.

That case returned ERANGE, which means a value outside a valid range and
says nothing about a message.

Return ENOMSG, no message of the desired type, instead.

Suggested-by: Gary Guo <gary@garyguo.net>
Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs      | 6 +++---
 drivers/gpu/nova-core/gsp/commands.rs  | 2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 855c5a708525..45c3c3aea8f9 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -588,7 +588,7 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
         loop {
             match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
                 Ok(reply) => break Ok(reply),
-                Err(ERANGE) => continue,
+                Err(ENOMSG) => continue,
                 Err(e) => break Err(e),
             }
         }
@@ -852,7 +852,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if the queue is poisoned or the message fails framing or checksum validation (see
     ///   [`Self::wait_for_msg`]), or if the matched message is too short for `M::Message`.
-    /// - `ERANGE` if the message was not the awaited reply.
+    /// - `ENOMSG` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
@@ -890,7 +890,7 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         } else {
             self.log_event(function, seq);
 
-            Err(ERANGE)
+            Err(ENOMSG)
         };
 
         // Advance the read pointer past this message.
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index e087c9e8c35c..d1c80cf3c452 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -191,7 +191,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq<'_>) -> Result {
     loop {
         match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
             Ok(_) => break Ok(()),
-            Err(ERANGE) => continue,
+            Err(ENOMSG) => continue,
             Err(e) => break Err(e),
         }
     }
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index dae34c11eb05..1782ed7d7ca6 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -346,7 +346,7 @@ pub(crate) fn run(
         let seq_info = loop {
             match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
                 Ok(seq_info) => break seq_info,
-                Err(ERANGE) => continue,
+                Err(ENOMSG) => continue,
                 Err(e) => return Err(e),
             }
         };
-- 
2.55.0

