Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C0A3A9618
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967233; cv=fail; b=kQw9ufeV94FhvJfCplMs6M4L+N354z6CjZw5K7qbSwXidNRKCuK5xkbhS86/lLY6AoZ6iWWrZZGBsJifLcZBlur1917hTHgzppOIPyu/LvonQIEHxRGKQ1zHFBaRxGZDcn5SE8wPpIhzkrJB1gKyEPyH+1sz0ly+ZFg+QjVBqi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967233; c=relaxed/simple;
	bh=3l3a4O8/kdCSPhyDq2pbd3dksEbK2dvWgE+a90JNv30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LbCA/suk3gKFlyWir3QbhEVeMAamTJgKcVKqOKlSJoheKhLW98oDO0IFAC8QOmREO/TP5+n49h7a4IRnxL1xFzyzctBHavLNi+0bVv8H0QcWIcpBw1xcKA2VaJgSZ9QafQDfdzaDRb/d2YMLrHdg0XFE/mR0SzL7RhUkym1x3aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YLRxV31v; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YLRxV31v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBt6A/OmrA1to9PQAe86MB6iMXQ4/EhDmbjNL6sTqrplSPb7e2e9D/hqkIH/7GZCtwkIzCKeN26lCg0LDfBLUas/c6dWKbZGolmms1SFCj1Vm01TpjNiUulpogd3crbtfW+IO9SLmqZ1gQf4fN2XcNBHALUOOHv/4oInm1HNIyygf/w//tVtjIcj9xwnty/Y3YECwsfIs//EyJyOAmm/5MXyb04ochktHvEfAfq9IST37LqgI7KhiMQOMpcnwlbW8bW5BzrBogzyiz6h9ZbGoPSTkBU9g8b/tJV+bWQT85E3wkyLWQDlF8CZZRxuTik+izGfsyLv1JeOzu0B9h76AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS55A6UY2pASP01OQ1yUtOSQSfIaQMkfjsuJ99WV+Pc=;
 b=WV7Zv80pdGKf6p+9kzwSccibsmFJqTf6Dzs1UmGwRe5Xd7eL+QXb8pCC1su43Vc1gT+69akknFpsbtO1qEXjyehOC1tLX3zQS9lRDkOcKFLk/1zeiPPpph12ZJuhUY/viDu6d+HGerFFuSvY76z9u+rdQlIwGqSskpzQOyhvpLXjq8FXeaJv4Dw4tw9e9XN2f6IQLyrKqzhLKwx2xIV0O8RbQgzEFLg0+RUHjwnTQnP7txcdrmvp7ZjzS4UNvDKQIo5p+Ivemo7LmAs5MSSW3rc/UdHKbzY61sWOffNmjP0UMgreN8/mjIaHzz8EsvwIpziWYigV3yMqFb2dxIUIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS55A6UY2pASP01OQ1yUtOSQSfIaQMkfjsuJ99WV+Pc=;
 b=YLRxV31v1RcYDs+5va3nGQnwWRc2Zqx0cd3uJSljwLW8nrDvWGVf6spNAThxn0iKv2PkVg87gGO4OuNQvvY3/rAbS2eaMePrGy4qCLBQmwrhv/KzhjLqSofxkOm5Rt5wom57AeRkkfj5adqe4HAAv5lv9dmBkuUWcm9DLth7SFCIJqpcsHJ2TZDyWkufAvpU1phgAh7eFGelmhKhwuA2Oqoqt60k9lsRTbgsjOSxPtUhNY2H3L3xEhQW1JF/0QPuINj9h8u7/FdU1Uetv9rzdsfeTdAL0b9kLCDfCAPYjutlEXxxIuxl87jsi3wdk8Q4auU63rzbrmE/bOwgjxVcXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:39 +0000
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
	John Hubbard <jhubbard@nvidia.com>,
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH v2 13/15] gpu: nova-core: retrigger the GSP falcon and clear every latched cause
Date: Fri, 28 Aug 2026 18:33:32 -0700
Message-ID: <20260829013324.499542-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e3c373f-bc1c-4768-390b-08df056d8d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5jrhUGIvPDNUO7dQiN3WDouaLNHu4huygYTukOPClQisYE5QVUKmCsmNnsiz1DkduZmDN6yytChHIO3nXysiV4jajgY1+APB4Jd447yzjrRadnWj+bKOFH+XwRoW6f9aUuPzjHd73OtssGL4WGq0Y1pIzYd+TYjfpY4tYPmSMy+Ixoi9SxrqDBUzfWz3ltXwhXPs0jhT7zbllOYXN31uHdN6NFFZZjDgVJvIin8uO3e/Mt68xyIRVVh2KVYLdtJicx7BcDaCe5OBQ4T4+34AHw0R1cx4mUrEeqCZarjT/sJYJOJ9kq0lFPRsnnVZTBBfAuimtDQbJt78+kSBFRvfatbo+YwllPSZtuDYthwykUO7CR8hDivC93P7+XsCWoDWl1H9OJQo7y8t44zfItWz+dhyPApz0XtHHVFndJeAbWsqET7gyaqMHaudLL2r7fYaKbwjGFcgzuudM/OuDW1+f9w4HMa5FzBwCSENpvgDiSKWx5I79uPAtZJxnmtKJm1+/ggdaYhmntP39fKQn/AmFnMvlIbo/tCaYbJLT5g3dU6Iuj+9I6kzBl3+Bpcb3DgwAhOL/tHngMWvW5SCrJFqfmd6zH/CCHUT+zfls3/Ibv5LVTQrBHS4AZqzUrJh1a4YIaX/A6K5AfIWXhRw/eX7gyg8HJRoMUFUvx/I7f+F/8U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5yoXuG97Jag/A0EuMvhmQCAfUYyojzf1L9yk4PbS2I/6hSvm2nXIzJBJm1/D?=
 =?us-ascii?Q?oSrhiGpifc0fxF7RvUvP6F0XO21pRhRUBclmmQTZqR+NqWktey7oszUcOBTX?=
 =?us-ascii?Q?jV25KVAY6tvbULLo1Ja0RUaQ/nk/r2PtKhFCK/bB/pTf1qUYTVjHW4Ew7UHG?=
 =?us-ascii?Q?/OoeypHcUkLm5r7EH7UGaSYaLLyYrHeicPux53FJHpnSZREE1R5XBw6As2fu?=
 =?us-ascii?Q?J9pAczxFnpuaaWvxgn3M2DAKAL3qO/vIAigAspbOQMdCBbGvWRdG4ytXGRVj?=
 =?us-ascii?Q?j6D1jdAXPRW2tMHbf7AP3FLHzb23V1rG2OTXCk4aoHRWAN8gtOd0gI3r7kNz?=
 =?us-ascii?Q?vHBKJfbae77Cm2KSW3pPcUsYtApjV/3zN9U3M1ACsQdXHASqg5KpQZG+xFje?=
 =?us-ascii?Q?IR4Mxu8U0Q8aV6P3z6F4s813808+wXxUAUj5hJS0pDKj8LAJNyBaxV5iCnTz?=
 =?us-ascii?Q?5lMGzlncxZsPUlrm1Piau08aYvU1fkUXWvXWCemYuD7m+XS7lVMh8uULi1Qx?=
 =?us-ascii?Q?LF5LqdIK4kE2sWcQd6+GP5F1rBvJVG6+WqR7GTD7Crunz1VXUNbsXqcnLPOA?=
 =?us-ascii?Q?tMDLeHzsge/7G8e3Yriyukf7CtiTQ8MZqytQMk8VF3cqB23xVjttfoiwLmhf?=
 =?us-ascii?Q?rVLkGyORTdsPyBrj+BO6Ym/rm0Qcq1M4bSmQ8Wpud7ZNPUUcmeWsm4GPAxMI?=
 =?us-ascii?Q?IAwOyo8jwoARMfc0lX8a2jsGni76xsIw+VK5n+UDoVLjMPbTTLcLcJqnivPN?=
 =?us-ascii?Q?tX1HLkVvb8K3K0i63UUKkY5L5qBMGO7ad/C0hr24rGL3nWL3ZqFISFhcmZiN?=
 =?us-ascii?Q?KjY3odUYnlEG3Lng70mX8X41nCH4psP24gIUUS9qljOOZ0L8zafbaw5gxwPT?=
 =?us-ascii?Q?tpGSmgLVCFLHzAbwMR77O9QQmbqlhuOqmqD/nIZLjwRHxx602ySolHwStZey?=
 =?us-ascii?Q?RNONffAF0NSTRQHPXr0rE4WBqmidXIYgK1fl4PTXDCLpfNF39wGz//4w/p0D?=
 =?us-ascii?Q?grAWc2MsHL2loODwTp1FgL+6CGLZApWdBG08RlNd/uMDR2qs1JO72jl1qR6+?=
 =?us-ascii?Q?HVkoh4jj2uA6GvNEJ+94Y/BiO0qZiOaWTUwk9GpJGQZgAIMdRbXKxMZY6vIv?=
 =?us-ascii?Q?3M81WKLgncIUOMYxXVUeJzODYcFw9M9aV73h8vhLospoMy60Fsi1+FzGazBC?=
 =?us-ascii?Q?+x+5TsH7NtRQY4jFp5RunsgHaqQFB8dUMHLoEIOttGGZrEna0P9mEHBTDirz?=
 =?us-ascii?Q?BwcpbVIFDTqCb9i+ReZJJ4F5JwERLenAQbUZNIZ1GLx7qxbvuCEDd5jwxf33?=
 =?us-ascii?Q?163dVl6g7LMJC24kMkNo+7ampBnRkvbS5sHR3tW1nHUYWo+GytGpUbr3V3W9?=
 =?us-ascii?Q?k215/uXMfSCVOfJeybdoLMnbM+yZgJcJxzcFnhVgIMKMTLG/QW2hpXV2LD5S?=
 =?us-ascii?Q?wJCb+Mx1/HAjTnAFG1L7d32OEP85KPK+cG6jF71/fyeZe9JpnzKB9dc1oKXQ?=
 =?us-ascii?Q?2ssMh/JLjhRSlSVv1fNOM7bI34YaBceOBpkOP+PKiBYBO2aWBCUA4GDmeFHa?=
 =?us-ascii?Q?H5aulewLXqCIdLWK9h70n7avvWEqAny1IM37LLMnTsrXsgdmnxcHZEKQ1orb?=
 =?us-ascii?Q?gTil08vT0IWcFRx8H1fVrHFMcPQyODcHrlTcR/YU8bwNce1TA8w/ast2N5mY?=
 =?us-ascii?Q?qbes5ZH7wCbaM0/+SIOtgPuHtnFd9lKm2e6yRmqI++J3N32b5pPxd0elSlUz?=
 =?us-ascii?Q?YAt5He+hrw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3c373f-bc1c-4768-390b-08df056d8d97
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:39.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ut36cHaRZfYydBdljWWon/DaCX3OXMyaG8dXNqWzjD5FAv+nVZ2bB/FwOflg9t4X7w7+OnjfrNvuIAx5ElSG4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

A falcon signals the interrupt tree when its set of enabled causes goes
from empty to non-empty. While any enabled cause stays latched, later
causes produce no signal, and Turing falcons have no INTR_RETRIGGER
register with which to supply one.

The GSP handler cleared its GIN leaf bit and then cleared the falcon's
SWGEN0 latch. A cause that arrived between the two left no record: the
leaf clear discarded it, and the falcon had nothing left to signal.
Swapping the two clears moves the window rather than closing it.

The handler serviced SWGEN0 or reported an unserviceable cause, never
both, so a HALT co-pending with SWGEN0 stayed latched. nova-core's probe
cleared the SWGEN0 latch before draining the tree, so a message posted
in between set a leaf bit that the drain then erased. In every case the
GSP went silent for the life of the device.

Write the falcon's INTR_RETRIGGER register after every clear of the GSP
vector. That supplies the missing signal from whatever causes remain
enabled. Turing falcons have no such register, so skip the write there.

Handle every cause the falcon reports on one invocation, masking the
ones with no recovery path so the re-emit does not raise them again.
Clear the SWGEN0 latch after the tree drain instead of before it.
Neither of these depends on INTR_RETRIGGER, so both apply on Turing.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs | 36 +++++++++++++++++
 drivers/gpu/nova-core/falcon/hal.rs |  8 ++++
 drivers/gpu/nova-core/irq/gsp.rs    | 61 ++++++++++++++++++-----------
 drivers/gpu/nova-core/regs.rs       | 20 ++++++++++
 4 files changed, 103 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index f9d9e8e0386b..6ee5c1ef1af7 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -16,11 +16,13 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        hal,
         Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
+    gpu::Chipset,
     regs,
 };
 
@@ -64,6 +66,40 @@ pub(crate) fn take_swgen0_intr(bar: Bar0<'_>) -> regs::NV_PFALCON_FALCON_IRQSTAT
 
         status
     }
+
+    /// Masks and clears every interrupt cause set in `status`.
+    ///
+    /// A masked cause leaves the falcon's enabled set, so it neither raises the tree again nor
+    /// holds that set non-empty.
+    pub(crate) fn mask_and_clear_intr(bar: Bar0<'_>, status: regs::NV_PFALCON_FALCON_IRQSTAT) {
+        let causes = status.into_raw();
+
+        bar.write(
+            WithBase::of::<Self>(),
+            regs::NV_PFALCON_FALCON_IRQMCLR::zeroed().with_value(causes),
+        );
+        bar.write(
+            WithBase::of::<Self>(),
+            regs::NV_PFALCON_FALCON_IRQSCLR::from(causes),
+        );
+    }
+
+    /// Re-emits the falcon's enabled interrupt causes into the interrupt tree.
+    ///
+    /// The falcon signals the tree on a transition of its enabled causes, so clearing the tree
+    /// leaf while a cause is still latched leaves no transition and no further vector.
+    ///
+    /// Does nothing on Turing, whose falcons do not implement the register.
+    pub(crate) fn retrigger_intr(bar: Bar0<'_>, chipset: Chipset) {
+        if !hal::has_intr_retrigger(chipset) {
+            return;
+        }
+
+        bar.write(
+            WithBase::of::<Self>().at(0),
+            regs::NV_PFALCON_FALCON_INTR_RETRIGGER::zeroed().with_trigger(true),
+        );
+    }
 }
 
 impl<'a> Falcon<'a, Gsp> {
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 7e532889a1f4..f0828b32aebb 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -72,6 +72,14 @@ fn signature_reg_fuse_version(
     fn load_method(&self) -> LoadMethod;
 }
 
+/// Returns whether `chipset`'s falcons implement `NV_PFALCON_FALCON_INTR_RETRIGGER`.
+///
+/// Turing falcons do not. Ampere and later do, including GA100, whose falcon otherwise uses the
+/// Turing HAL, so this is keyed on the architecture rather than provided through [`FalconHal`].
+pub(crate) fn has_intr_retrigger(chipset: Chipset) -> bool {
+    !matches!(chipset.arch(), Architecture::Turing)
+}
+
 /// Returns a boxed falcon HAL adequate for `chipset`.
 ///
 /// We use a heap-allocated trait object instead of a statically defined one because the
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
index 6366380eef98..a1030d66cc70 100644
--- a/drivers/gpu/nova-core/irq/gsp.rs
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -50,18 +50,17 @@
 
 /// Clears the interrupt state that GSP boot left behind.
 ///
-/// Disables every vector in every implemented leaf, clears the falcon's SWGEN0 latch, clears the
-/// tree's pending bits, and rearms PCI interrupt delivery. On return no vector is enabled, so the
-/// tree delivers nothing.
+/// Disables every vector in every implemented leaf, clears the tree's pending bits, clears the
+/// falcon's SWGEN0 latch, and rearms PCI interrupt delivery. On return no vector is enabled, so
+/// the tree delivers nothing.
 pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, irq_type: pci::IrqType) {
     let tree = Tree::new(bar, chipset, irq_type, GSP_SUBTREE.into());
     tree.disable_all_leaves();
-    // GSP boot consumes its notifications by polling the queue, which leaves SWGEN0 latched.
-    // Clear it before the tree drain below, so the drain clears the tree state the clear sets.
-    // Messages already posted raise no interrupt of their own, and the caller's queue drain
-    // covers them.
-    GspFalcon::clear_swgen0_intr(bar);
     tree.drain();
+    // GSP boot consumes its notifications by polling the queue, which leaves SWGEN0 latched, and
+    // the GSP drives no new signal while it is set. Clear it after the tree drain, which erases
+    // every leaf bit and would erase the one a message posted since the clear had set.
+    GspFalcon::clear_swgen0_intr(bar);
     // The `TOP_EN` cycle in `drain` is the rearm for the two enable-cycle methods, but pre-Hopper
     // MSI rearms through a configuration-space write instead. An interrupt delivered before probe
     // leaves delivery un-armed on that path, with no handler to have rearmed it.
@@ -80,6 +79,8 @@ pub(crate) struct GspInterrupt<'a> {
     cmdq: Arc<Cmdq>,
     /// The GIN interrupt tree for this chipset.
     tree: Tree<'a>,
+    /// Chipset, for the falcon retrigger, which Turing does not implement.
+    chipset: Chipset,
     /// Device, for logging from interrupt context without taking the command-queue lock.
     dev: ARef<device::Device>,
 }
@@ -98,15 +99,18 @@ pub(crate) fn new(
             bar,
             cmdq,
             tree: Tree::new(bar, chipset, irq_type, GSP_SUBTREE.into()),
+            chipset,
             dev,
         }? Error)
     }
 }
 
 impl irq::ThreadedHandler for GspInterrupt<'_> {
-    /// Top half: clears the GIN leaf, takes the falcon SWGEN0 latch, and rearms PCI interrupt
-    /// delivery.
+    /// Top half: clears the GIN leaf, takes every cause the falcon reports, and rearms PCI
+    /// interrupt delivery.
     fn handle(&self) -> irq::ThreadedIrqReturn {
+        let bar = self.bar;
+
         // Only service our own vector: require the GSP bit in the leaf and clear just that bit, so
         // a co-pending vector in the same leaf stays pending for whoever services it. The subtree
         // stays enabled, so there is no whole-tree disable and enable.
@@ -119,27 +123,40 @@ fn handle(&self) -> irq::ThreadedIrqReturn {
         }
         leaf.clear_vectors(GSP_INTR_0_VECTOR.leaf_mask());
 
-        // SWGEN0 is the message-queue notification, so wake the IRQ thread to drain it.
-        let status = GspFalcon::take_swgen0_intr(self.bar);
-        let ret = if status.swgen0() {
-            irq::ThreadedIrqReturn::WakeThread
-        } else {
-            // The tree routes every falcon cause to this vector, so something other than a posted
-            // message fired it, for example a HALT from a GSP crash. There is no recovery path for
-            // those causes, so report the status rather than discarding it.
+        let status = GspFalcon::take_swgen0_intr(bar);
+
+        // Every cause the falcon reports leaves the falcon's enabled set on this invocation. A
+        // cause left latched holds that set non-empty, and the falcon signals the tree only on a
+        // transition of the set, so no later SWGEN0 would signal at all.
+        let unserviceable = status.with_swgen0(false);
+        if unserviceable.into_raw() != 0 {
+            // The tree routes every falcon cause to this vector, so a cause other than a posted
+            // message also arrives here, for example a HALT from a GSP crash. nova-core has no
+            // recovery path for those, so report the status rather than discarding it, then mask
+            // the cause.
             dev_err!(
                 &self.dev,
-                "GSP interrupt with no SWGEN0, falcon IRQSTAT {:#x}\n",
+                "unserviceable GSP falcon interrupt, IRQSTAT {:#x}\n",
                 status.into_raw()
             );
-            irq::ThreadedIrqReturn::Handled
-        };
+            GspFalcon::mask_and_clear_intr(bar, unserviceable);
+        }
+
+        // The leaf clear above consumed the tree's record of this interrupt, and the falcon signals
+        // the tree only on a transition of its enabled causes, so a cause that arrived while this
+        // handler ran would never reach the CPU. Re-emit to supply that transition.
+        GspFalcon::retrigger_intr(bar, self.chipset);
 
         // Delivery resumes only after this, so it must happen on every path that services the
         // vector, including the fault path above.
         self.tree.rearm_pci_irq(GSP_SUBTREE);
 
-        ret
+        // SWGEN0 is the message-queue notification, so wake the IRQ thread to drain it.
+        if status.swgen0() {
+            irq::ThreadedIrqReturn::WakeThread
+        } else {
+            irq::ThreadedIrqReturn::Handled
+        }
     }
 
     /// IRQ thread: drains and dispatches the GSP-to-CPU message queue.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e360a6d25c60..925600825434 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -124,6 +124,15 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         6:6     swgen0 => bool;
     }
 
+    /// Masks interrupt causes at the falcon, one bit per cause, in the layout of
+    /// `NV_PFALCON_FALCON_IRQSTAT`.
+    ///
+    /// A masked cause is excluded from the enabled set the falcon signals on, so it cannot be
+    /// raised again by `NV_PFALCON_FALCON_INTR_RETRIGGER`.
+    pub(crate) NV_PFALCON_FALCON_IRQMCLR(u32) @ PFalconBase + 0x00000014 {
+        31:0    value => u32;
+    }
+
     pub(crate) NV_PFALCON_FALCON_MAILBOX0(u32) @ PFalconBase + 0x00000040 {
         31:0    value => u32;
     }
@@ -251,6 +260,17 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         0:0     reset => bool;
     }
 
+    /// Re-emits the falcon's enabled interrupt causes into the interrupt tree.
+    ///
+    /// Write-only. A falcon signals the tree on a transition of its enabled causes, so a handler
+    /// that cleared the tree leaf while a cause was still latched has left no transition behind,
+    /// and this write supplies one. Turing falcons do not implement this register.
+    ///
+    /// OpenRM declares two elements and uses only the first.
+    pub(crate) NV_PFALCON_FALCON_INTR_RETRIGGER(u32)[2] @ PFalconBase + 0x000003e8 {
+        0:0     trigger => bool;
+    }
+
     pub(crate) NV_PFALCON_FBIF_TRANSCFG(u32)[8] @ PFalconBase + 0x00000600 {
         2:2     mem_type => FalconFbifMemType;
         1:0     target ?=> FalconFbifTarget;
-- 
2.55.0

